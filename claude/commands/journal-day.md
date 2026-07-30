# Daily Journal from Claude Conversations

Synthesize a work journal entry from all Claude Code conversations on a given day, scoped to this machine.

## Argument

Optional date: `$ARGUMENTS`. If empty, use today's date. Accepted formats: `YYYY-MM-DD`, `today`, `yesterday`.

## Steps

### 1. Resolve target date and hostname

```bash
python3 -c "
import sys, datetime, socket
arg = '$ARGUMENTS'.strip()
if not arg or arg == 'today':
    d = datetime.date.today()
elif arg == 'yesterday':
    d = datetime.date.today() - datetime.timedelta(days=1)
else:
    d = datetime.date.fromisoformat(arg)
print('DATE=' + d.isoformat())
print('HOST=' + socket.gethostname())
"
```

### 2. Extract conversations from that date

Run with `TARGET_DATE` and `HOSTNAME` env vars set to the values from step 1:

```bash
python3 << 'PYEOF'
import json, os, sys, datetime, pathlib

target = os.environ['TARGET_DATE']
projects_root = pathlib.Path.home() / '.claude' / 'projects'

results = []

for project_dir in sorted(projects_root.iterdir()):
    if not project_dir.is_dir():
        continue

    slug = project_dir.name
    # Last hyphen-segment is the repo/folder name; full slug decodes to path
    parts = slug.lstrip('-').split('-')
    short_name = parts[-1] if parts else slug

    for jsonl in sorted(project_dir.glob('*.jsonl')):
        mtime = datetime.datetime.fromtimestamp(jsonl.stat().st_mtime).date().isoformat()
        if mtime != target:
            continue

        ai_title = None
        user_msgs = []
        first_ts = None

        try:
            with open(jsonl, encoding='utf-8', errors='replace') as f:
                for line in f:
                    line = line.strip()
                    if not line:
                        continue
                    try:
                        obj = json.loads(line)
                    except json.JSONDecodeError:
                        continue

                    t = obj.get('type', '')

                    if t == 'ai-title' and not ai_title:
                        ai_title = obj.get('aiTitle', '')

                    if t == 'user':
                        ts = obj.get('timestamp', '')
                        if ts and not first_ts:
                            first_ts = ts
                        content = obj.get('content', '')
                        text = ''
                        if isinstance(content, list):
                            for c in content:
                                if isinstance(c, dict) and c.get('type') == 'text':
                                    text += c['text']
                        elif isinstance(content, str):
                            text = content
                        text = text.strip()
                        if len(text) > 10 and not text.startswith('<'):
                            user_msgs.append(text[:300])
                        if len(user_msgs) >= 3:
                            break
        except Exception:
            continue

        if not ai_title and not user_msgs:
            continue

        results.append({
            'project': short_name,
            'title': ai_title or '(untitled)',
            'first_ts': first_ts or '',
            'user_msgs': user_msgs,
        })

results.sort(key=lambda r: r['first_ts'])

if not results:
    print(f'NO_CONVERSATIONS_FOUND for {target}')
else:
    for r in results:
        print(f'PROJECT: {r["project"]}')
        print(f'TITLE: {r["title"]}')
        if r['first_ts']:
            print(f'TIME: {r["first_ts"][11:16]}')
        for i, m in enumerate(r['user_msgs'], 1):
            print(f'MSG{i}: {m}')
        print('---')
PYEOF
```

### 3. Synthesize journal entry

If `NO_CONVERSATIONS_FOUND`, tell the user and stop.

Otherwise synthesize a concise journal entry:

- Group sessions by project
- Each project gets a `### <project>` heading
- Bullets: what was actually worked on — distilled from title + user messages
- Extract the real work (problem solved, thing built/debugged/explored) — not meta-commentary
- Merge sessions on same topic within a project into one bullet
- Past tense, technical, implied first person ("debugged X", "added Y", "investigated Z")
- 10–20 bullets total, no padding, no filler
- Do NOT include timestamps, session IDs, or pleasantries

Output format:

```markdown
---
title: Work log — <YYYY-MM-DD>
type: journal
host: <HOSTNAME>
date: <YYYY-MM-DD>
---

## Work log — <YYYY-MM-DD> [<HOSTNAME>]

### <project>
- <what was done>

### <project>
- <what was done>
```

### 4. Write to wiki

Target file: `${HOME}/Documents/Obsidian Vault/wiki/journal/<YYYY-MM-DD>-<HOSTNAME>.md`

- If file exists: read it, replace full content with updated synthesis (you own this file)
- If not: create it with the synthesized content above

Also update `wiki/index.md`: add or update an entry under a `## Journal` section:
```
- [[wiki/journal/<YYYY-MM-DD>-<HOSTNAME>|<YYYY-MM-DD> (<HOSTNAME>)]] — work log
```

### 5. Log

Append to `${HOME}/Documents/Obsidian Vault/wiki/log.md`:
```
## [<date>] journal | <HOSTNAME> — summarized <N> conversations across <M> projects
```
