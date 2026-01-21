Look at PR $1 using the GitHub CLI. Your job is to triage and resolve reviewer comments *locally* (no replies on GitHub, no extra branches).

Goal:
- Fetch all PR review comments + regular PR comments.
- Summarize what is worth addressing vs. what is not.
- For the items worth addressing: describe (and implement) the minimal correct local changes.

Rules:
- Do NOT push, force-push, create branches, or comment on GitHub.
- Prefer small, safe changes that align with existing code style and patterns.
- If a comment is unclear, infer intent from surrounding code and the PR context; choose the least risky interpretation.
- If addressing a comment would require a larger redesign, propose an incremental fix and clearly note the tradeoff.

Process:
1) Gather context:
   - gh pr view $1
   - gh pr diff $1
2) Fetch all discussion:
   - gh pr comments $1
   - gh pr view $1 --comments
   - gh pr view $1 --json reviews,reviewComments,comments
3) Build a single list of actionable items:
   - De-duplicate similar comments.
   - Group by file/module.
   - Classify each item:
     - Must-fix (correctness, bug, security, broken tests, obvious logic errors)
     - Should-fix (maintainability, clarity, edge cases, performance)
     - Optional (style preferences, bikeshedding, subjective)
     - Not addressing (out of scope / already covered / incorrect suggestion)
4) Address locally:
   - For each Must-fix / Should-fix:
     - Identify exact file and location.
     - Make the smallest correct change.
     - Update related code/tests/docs if needed.
   - Run the most relevant local checks (tests/lint/build) and fix any failures introduced.
5) Output a Markdown report (do this even if you make no changes):
   - PR context summary (1–3 bullets)
   - Comments triage table (comment → category → file → action)
   - “Will address” section: what you changed (or will change) and why, with file references
   - “Won’t address” section: what you’re skipping and why
   - Commands run + results (tests/lint/build)
   - Any assumptions or follow-ups

Begin now.
