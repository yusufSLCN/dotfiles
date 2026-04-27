---
name: merge-request
description: Create a GitLab merge request with glab after reviewing branch changes.
---

Use `glab` (GitLab CLI) for all merge request operations.

Follow these steps exactly:

1. Gather context in parallel:
   - `git status` — uncommitted changes
   - `git log <base>..HEAD --oneline` — commits on this branch since it diverged
   - `git diff <base>...HEAD` — full diff vs base branch
   - `git rev-parse --abbrev-ref HEAD` — current branch name
   - Check if upstream is set and up to date
2. Determine the base branch (usually `main`; confirm with the user if ambiguous).
3. If there are uncommitted changes, ask the user whether to commit them first (invoke the `commit` skill) or proceed without them.
4. Analyze ALL commits on the branch (not just the latest) and draft:
   - **Title**: short, imperative, under 70 chars
   - **Description**: summary bullets + test plan checklist
5. Show the proposed title and description to the user. Do NOT create the MR yet.
6. Ask the user to confirm.
7. On confirmation:
   - Push the branch with `-u` if not already tracked
   - Run `glab mr create --title "..." --description "..." --target-branch <base>`
   - Return the MR URL

## Description template

```
## Summary
- <bullet 1>
- <bullet 2>

## Test plan
- [ ] <test step 1>
- [ ] <test step 2>
```

## Rules

- NO footers, NO signatures, NO "Generated with Claude Code" lines.
- Use imperative mood in the title ("add", "fix", "refactor").
- Pass the description via a HEREDOC to preserve formatting:
  ```
  glab mr create --title "..." --description "$(cat <<'EOF'
  ## Summary
  ...
  EOF
  )" --target-branch main
  ```
- Never force-push to the target branch.
- Do not open an MR against `main` if the repo uses a different default — check with `glab repo view` if unsure.

## Other common operations

- List MRs: `glab mr list`
- View MR: `glab mr view <id>`
- Check CI status: `glab ci status` or `glab mr view <id>`
- Add comment: `glab mr note <id> -m "..."`
