#!/usr/bin/env python3
"""
Waybar script for pi session status.

Reads ~/.pi/waybar/<sessionId>.json files written by the waybar-status
pi extension and outputs a waybar-compatible JSON object.

Output format (return-type: json):
  text    — compact session summary shown in the bar
  tooltip — per-session details shown on hover (Pango markup)
  class   — "pi-running" when any session is active, "pi-idle" otherwise
"""

import json
import os
import sys
from pathlib import Path

STATUS_DIR = Path.home() / ".pi" / "waybar"


def is_alive(pid: int) -> bool:
    """Check if a process is still running."""
    try:
        os.kill(pid, 0)
        return True
    except (ProcessLookupError, PermissionError):
        return False


def fmt_tokens(tokens: dict) -> str:
    total = tokens.get("total", 0)
    if total >= 1_000_000:
        return f"{total / 1_000_000:.1f}M"
    if total >= 1_000:
        return f"{total / 1_000:.0f}K"
    return str(total)


def fmt_cost(cost: float) -> str:
    if cost >= 1.0:
        return f"${cost:.2f}"
    if cost >= 0.01:
        return f"${cost:.3f}"
    return f"${cost:.4f}"


def load_sessions() -> list[dict]:
    if not STATUS_DIR.exists():
        return []

    sessions = []
    for path in STATUS_DIR.glob("*.json"):
        try:
            data = json.loads(path.read_text())
        except Exception:
            continue

        pid = data.get("pid", 0)
        if pid and not is_alive(pid):
            # Stale file from a crashed/killed pi session — clean it up.
            path.unlink(missing_ok=True)
            continue

        sessions.append(data)

    return sorted(sessions, key=lambda s: s.get("lastActivity", 0), reverse=True)


def build_output(sessions: list[dict]) -> dict:
    if not sessions:
        return {"text": "", "tooltip": "No pi sessions running", "class": "pi-none"}

    running = [s for s in sessions if s.get("state") == "running"]
    idle = [s for s in sessions if s.get("state") == "idle"]

    # ── bar text ──────────────────────────────────────────────────────────────
    # Running is dim (nothing to act on); idle is warm (needs your attention).
    parts = []
    if running:
        parts.append(f"<span color='#6e6e8a'>▶{len(running)}</span>")
    if idle:
        parts.append(f"<span color='#F9C096'>●{len(idle)}</span>")

    text = "π " + " ".join(parts) if parts else "π"

    # ── hover tooltip (Pango markup) ──────────────────────────────────────────
    lines = []
    for s in sessions:
        state = s.get("state", "unknown")
        project = s.get("sessionName") or s.get("projectName", "?")
        model = s.get("model", "").split("/")[-1]  # strip provider prefix
        tokens = s.get("tokens", {})
        tok_str = fmt_tokens(tokens)
        cost_str = fmt_cost(tokens.get("cost", 0))
        cwd = s.get("cwd", "")

        if state == "running":
            state_icon = "▶"
            state_color = "#6e6e8a"
            state_label = "running"
        else:
            state_icon = "●"
            state_color = "#F9C096"
            state_label = "idle — waiting for input"

        # Line 1: icon + project name + state
        lines.append(
            f"<span color='{state_color}'>{state_icon}</span>"
            f"  <b>{project}</b>"
            f"  <span color='{state_color}'>{state_label}</span>"
        )
        # Line 2: model + tokens + cost, indented
        lines.append(
            f"   <span color='#9898b0'>{model}"
            f"  ·  {tok_str} tok"
            f"  ·  {cost_str}</span>"
        )
        # Line 3: cwd path, smaller/dimmer
        lines.append(f"   <span color='#5a5a72'>{cwd}</span>")
        lines.append("")  # blank separator between sessions

    # Remove trailing blank line
    while lines and lines[-1] == "":
        lines.pop()

    tooltip = "\n".join(lines)
    css_class = "pi-running" if running else "pi-idle"

    return {"text": text, "tooltip": tooltip, "class": css_class}


if __name__ == "__main__":
    sessions = load_sessions()
    print(json.dumps(build_output(sessions)), flush=True)
