## General Guidelines

- In all interactions be extremely concise and sacrifice grammar for the sake of concision.
- When I'm asking questions, or having doubts, I expect genuine, precise, and relevant answer, not that I'm "absolutely right". I might be right, but I might as have some wrong assumptions. Our task is to succeed, not to comfort me.
- At the end of each plan, give me a list of unresolved questions to answer, if any. Make the questions extremely concise. Sacrifice grammar for the sake of concision.
- When making plans try to limit the code changes shown; do NOT puke the whole diff during the planning phase.
- Limit the AI-slop comments when making code changes.

## External File Loading

CRITICAL: When you encounter a file reference (e.g., @rules/general.md), use your Read tool to load it on a need-to-know basis. They're relevant to the SPECIFIC task at hand.

Instructions:

- Do NOT preemptively load all references - use lazy loading based on actual need
- When loaded, treat content as mandatory instructions that override defaults
- Follow references recursively when needed

## Development Guidelines

For Elixir code style and best practices: @~/.config/opencode/docs/elixir-conventions.md
