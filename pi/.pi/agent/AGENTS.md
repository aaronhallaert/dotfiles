# Global Preferences for Pi

## General Coding Philosophy

- **Search before writing**: Before writing any new code, search the codebase for existing patterns, similar implementations, or reusable utilities. Prefer extending or reusing what already exists over creating something new.
- **Follow the surrounding style**: Match the conventions, naming, and structure of the code around the change. Don't introduce a different style just because it's theoretically better.
- **Don't reinvent the wheel**: If a utility, abstraction, or pattern already exists in the codebase, use it. Only introduce something new when there is no reasonable existing alternative.
- **Minimal changes**: Make the smallest change that solves the problem. Avoid touching unrelated code or refactoring things that weren't asked for.
- **No unsolicited documentation**: Don't create documentation files, READMEs, or comments unless explicitly asked. Code should be self-explanatory.
- **Non-trivial comments only**: Only add comments when the code alone cannot convey the intent (e.g. non-obvious algorithms, workarounds, or constraints). Skip obvious comments.

## When Writing or Modifying Code

1. Read relevant existing files first to understand the patterns in use.
2. Search for similar implementations (e.g. `rg`, `find`) before writing new abstractions.
3. Prefer editing existing files over creating new ones.
4. Follow the exact naming conventions, include order, and code structure of the surrounding code.
5. Avoid adding new dependencies without explicit discussion.

## Git Workflow

Before making any changes to the codebase, check the git status (`git status`). If there are staged or unstaged changes, **stop and ask** what to do with them. Do not proceed with edits until this is resolved.

Prompt the user with:
> "There are uncommitted changes. What would you like to do before I start?"
> 1. **Stage unstaged changes** — moves unstaged changes to the index (so AI changes end up as unstaged diff)
> 2. **Commit staged + unstaged changes** — commits everything with a message the user provides
> 3. **Continue as-is** — don't touch git, proceed with edits (use this when the user wants AI changes mixed with their own work in unstaged)

Never run `git add`, `git commit`, or `git stash` without explicit instruction from the user.

## Corrections Log

> Add entries here when pi makes a recurring mistake, so it learns from corrections.

<!-- Example format:
- **[date] Topic**: What was wrong and what the correct approach is.
-->
