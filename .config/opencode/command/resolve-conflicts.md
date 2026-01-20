---
description: Resolve Git conflicts
agent: build
---

Resolve all active Git merge/rebase conflicts in this repo.

Guidelines:
- Preserve intent from BOTH sides; make the smallest correct change.
- Don’t remove behavior unless clearly dead/duplicated.
- Match existing style and structure.
- If ambiguous, infer from surrounding code and choose the least risky option.

Steps:
1) Identify conflicts:
   - git status
   - git diff --name-only --diff-filter=U
2) For each conflicted file:
   - Inspect markers (<<<<<<< ======= >>>>>>>)
   - Merge/combine correctly
   - Remove markers; ensure code compiles and imports/types are valid
3) Verify:
   - git status (no conflicts remain)
   - Run appropriate checks
   - Fix any failures you introduced
4) Continue:
   - Rebase: git rebase --continue
   - Merge: commit per repo norms
5) Report:
   - Files resolved + key decisions
   - Commands run and test results
   - Any assumptions made

Begin.
