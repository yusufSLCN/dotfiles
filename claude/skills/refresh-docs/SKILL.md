---
name: refresh-docs
description: Audit README.md and CLAUDE.md against the current codebase and propose targeted updates for review before editing.
---

Use this skill when the user asks to "check", "update", "refresh", or "sync" `README.md` / `CLAUDE.md` against the current state of the repo.

## Mental model — the two files serve different readers

- **README.md** is for humans (contributors, users). Narrative onboarding, install steps, comprehensive API tables, hardware walkthrough, examples. Welcoming tone.
- **CLAUDE.md** is for the AI assistant. Dense, prescriptive, focused on things not derivable from the code: invariants, domain rules, gotchas, conventions, ordering constraints. Skip marketing and user-onboarding content.

**Do not duplicate content between them.** Overlap should be limited to high-level architecture and key concepts. CLAUDE.md should be tighter — if removing a sentence wouldn't change how a reader implements a change correctly, it probably doesn't belong.

## Steps

1. **Discover current state.**
   - Run `git log --oneline -20` to see recent changes.
   - Read `README.md` and `CLAUDE.md` in full.
   - Run `ls` at the project root and inside each listed directory to check project structure accuracy.
   - If the project exposes an HTTP API, hit `/openapi.json` (if a server is running) or grep `@router.(get|post|delete|put|patch)` to enumerate endpoints.

2. **Identify drift.** For each file, list every discrepancy between the doc and reality. Categorise:
   - **Structural**: missing/renamed files, folders, routes, modules.
   - **Behavioural**: features added/removed/renamed; invariants that no longer hold; config keys that changed.
   - **Wording**: typos or phrasing that became inaccurate but still scans as correct (easy to miss).

3. **Check for content belonging in the wrong file.**
   - Onboarding / install / narrative → README only.
   - Prescriptive rules, invariants, gotchas → CLAUDE only.
   - API reference tables → README (or a dedicated `docs/api.md`). CLAUDE should reference, not duplicate.

4. **Report findings.** Before editing, list each proposed change grouped by file and category. Example:

   ```
   README.md
     Structural:
       - Project Structure missing: recording.py, tests/
       - File Management table missing GET /files/folder/{name}
     Behavioural:
       - "POST /record/start accepts mux_mappings" — outdated; field removed
   
   CLAUDE.md
     Structural:
       - No section for Experiment Recording
     Behavioural:
       - Frontend polls only /devices/ — now also polls /record/
   ```

5. **Ask the user to confirm** the list of proposed changes. Do not edit yet.

6. **After confirmation**, edit each file in place using `Edit` / targeted rewrites. Prefer small `Edit` calls over full `Write` unless more than ~50% of the file needs rewriting.

7. **Verify**. If the project has tests, run them (`uv run pytest -q` or `pytest -q`) to catch anything that broke due to doc-driven assumptions. If the docs reference the API, spot-check the documented endpoints actually exist.

## Rules

- NEVER add "Generated with Claude" footers, timestamps, or signatures to docs.
- Don't invent features — only document what's in the code.
- Keep CLAUDE.md under ~200 lines where possible. If it grows, refactor rather than append.
- Preserve the user's existing voice/tone when editing — don't rewrite sections just because you would phrase them differently.
- Use concrete file paths with line numbers (`handlers.py:120`) when CLAUDE.md needs to point at specific code.
- Don't commit automatically. Leave that to the `commit` skill or to the user.
