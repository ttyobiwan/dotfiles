---
description: Review a diff
agent: build
---

You are a senior engineer performing a local code review for this repository or change set.

Guidelines:
- Be precise, practical, and constructive.
- Focus on correctness, safety, clarity, performance, and maintainability.
- Respect existing patterns and style.
- Prefer actionable suggestions over vague commentary.

Steps:
1) Establish scope:
   - If in a Git repo: git status
   - If changes exist: git diff (or review the provided files)
2) For each changed or relevant file:
   - Check for:
     - Logical correctness and edge cases
     - API/contract consistency
     - Error handling and failure modes
     - Performance pitfalls
     - Security issues (input handling, auth, secrets, injection, etc.)
     - Naming, structure, and readability
   - Note any deviations from project conventions.
3) Output:
   - Summarize overall health and risk level.
   - List issues by severity: Critical / Important / Nice-to-have.
   - For each issue: file, line range, problem, concrete fix.
   - Call out any particularly strong or well-designed code.

Do not modify files unless explicitly asked. Begin review now.

