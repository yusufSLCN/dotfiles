---
name: code-review
description: Review pending changes on the current branch for bugs, regressions, and style issues before committing.
---

Review the pending changes on the current branch and report findings. Do NOT modify any files — this is read-only.

Follow these steps exactly:

1. Gather context:
   - `git status` — see what's changed.
   - `git diff` (staged + unstaged) — the actual changes.
   - `git log main..HEAD --oneline` (or `master..HEAD`) — commits since branch diverged.
   - `git diff main...HEAD` if there are prior commits on the branch worth reviewing alongside working-tree changes.
2. Read each changed file in full where the diff alone is insufficient (small files, files with significant surrounding logic, or when the diff has `...` hunk boundaries hiding context).
3. For each concern, decide severity:
   - **Blocker** — bug, regression, security issue, data loss, broken contract.
   - **Should fix** — poor approach, missed edge case, violates project conventions in CLAUDE.md, dead code.
   - **Nit** — style, naming, minor readability. Keep these brief and few.
4. Report findings grouped by severity, with file:line references using markdown links. If there are no issues, say so plainly.
5. End with one of:
   - "Ready to commit." (no blockers or should-fixes)
   - "Fix blockers before committing: <short list>" (has blockers)
   - "Consider addressing: <short list>" (should-fixes only)

## What to check

- **Correctness**: Off-by-one, null/None handling, race conditions, wrong types, incorrect logic, flipped booleans.
- **Regressions**: Removed behavior that callers still depend on; renamed/removed public APIs without updating call sites.
- **Project conventions**: Read `CLAUDE.md` if present and flag violations.
- **Security**: Injection, unescaped input, secrets in code, overly permissive CORS/auth changes.
- **Tests**: New behavior without tests; tests that don't actually assert the new behavior.
- **Error handling at boundaries only**: flag missing validation at user input / external API boundaries; flag *added* defensive checks on internal code that can't fail.
- **Over-engineering**: premature abstractions, unused parameters, speculative generality, dead branches.
- **Comments**: flag comments that describe *what* the code does, reference tasks/PRs/issues, or just restate the identifier. Keep comments that explain *why* (non-obvious constraints, workarounds).

## Rules

- Do NOT run formatters, linters, or tests — this skill only reads. If you want those, use the `commit` skill.
- Do NOT edit files. If a fix is obvious, describe it; don't apply it.
- Cite every finding with a clickable `[file.py:42](path#L42)` link.
- Be specific. "This could be cleaner" is not a review comment. Say what and why.
- Skip praise and filler. Report issues and a verdict.
- If the diff is large (>500 lines), review in passes: correctness first, then conventions, then nits. Don't drop coverage to save tokens.
