---
name: commit
description: Stage changes, propose a commit message for review, then commit on approval.
---

Follow these steps exactly:

1. Run `git status` and `git diff` (staged + unstaged) to understand what has changed.
2. Group the changes into logical commits. If there are changes from different concerns (e.g. pre-existing unrelated changes alongside your own work, or distinct features/fixes), split them into separate commits. Do NOT force everything into one commit.
3. For each planned commit, propose a commit message and list the files to be staged. Do NOT commit yet.
4. Show the user all proposed commits at once:
   - Commit 1: message + file list
   - Commit 2: message + file list (if applicable)
   - etc.
5. Ask the user to confirm before proceeding.
6. Only after explicit confirmation: stage and create each commit in order.

## Commit message format

```
Short summary line (50 chars or less)

- Bullet point describing change 1
- Bullet point describing change 2
```

## Rules

- NO footers, NO signatures, NO "Generated with Claude Code" or co-author lines.
- Use imperative mood ("add", "fix", "remove" — not "added", "fixed").
- Keep the summary line under 50 characters.
- Use bullet points for additional detail.
- Do NOT stage files that look like secrets (.env, credentials, tokens).
- Run `ruff check` before committing. If it reports errors, fix them first.
- Run `python -m pytest --tb=short` before committing. Do not commit if tests fail.
