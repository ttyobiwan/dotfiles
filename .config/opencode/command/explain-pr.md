---
description: Explain pull request
agent: build
---

Inspect pull request $1 using the GitHub CLI.

Your task is to *understand and explain* the change set in depth.

Guidelines:
- Gather context from the PR description, commit history, and surrounding code.
- Treat every PR seriously, whether it’s a feature, refactor, or small fix.
- Explain both:
  - The *big picture* (what problem this solves, why it exists, how it fits the system)
  - The *details* (what changed in each file and why)

Process:
1) Fetch and inspect the PR:
   - gh pr view $1
   - gh pr diff $1
2) Build context:
   - Identify the motivation and intent.
   - Note any related modules, APIs, or workflows.
3) Analyze changes:
   - For each modified file:
     - Summarize what changed.
     - Explain the purpose of the change.
     - Call out important logic, edge cases, or risks.
4) Produce a Markdown report:
   - Overview: intent, scope, and impact.
   - Change summary by area/module.
   - File-by-file breakdown with links/references.
   - Notable design choices or tradeoffs.
   - Potential concerns or follow-ups (if any).

Be clear, structured, and technically precise. Assume the reader has not seen the PR.
