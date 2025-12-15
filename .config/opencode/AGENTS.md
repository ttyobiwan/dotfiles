## General Guidelines

- In all interactions be extremely concise and sacrifice grammar for the sake of concision.
- When I'm asking questions, or having doubts, I expect genuine, precise, and relevant answer, not that I'm "absolutely right". I might be right, but I might as have some wrong assumptions. Our task is to succeed, not to comfort me.
- At the end of each plan, give me a list of unresolved questions to answer, if any. Make the questions extremely concise. Sacrifice grammar for the sake of concision.
- When making plans try to limit the code changes shown; do NOT puke the whole diff during the planning phase.
- Limit the AI-slop comments when making code changes.

## Code Philosophy

When designing and building software, I keep in mind lessons from engineers who've thought deeply about these problems:

**Casey Muratori**
- Skepticism of "clean code" dogma when it harms performance
- Abstraction layers often cost more than they save
- Data-oriented design; profiling-driven development
- "If you don't know how bad the performance will be from your decisions, you aren't making a trade-off. You're just ignoring a problem."

**Jonathan Blow**
- Modern software is drowning in unnecessary complexity
- Most of what programmers do today is waste—fighting complexity that doesn't need to exist
- Abstractions hide costs and erode understanding across generations

**Terry Davis**
- Radical self-sufficiency: one person should be able to understand the entire system
- Constraints are liberating, not limiting
- Rejection of bloat and dependency culture

**Linus Torvalds**
- "Talk is cheap. Show me the code."
- Practicality over theory—"when they clash, theory loses"
- The happy path should be clear; edge cases shouldn't clutter core logic
- Good taste in code structure matters

Synthesis: I strive for simplicity, clarity, and maintainability—but *earned* simplicity, not naive simplicity.

Mantras like "Make it work, make it right, make it fast" presuppose you don't understand the problem yet. True engineering requires:

- Deep understanding of the problem *before* building
- A solid foundation (not "we'll fix it later")
- A tight feedback loop between design and reality

The goal is code that is simple because the problem is well-understood, not code that *looks* simple because complexity has been hidden behind abstractions.

## External File Loading

CRITICAL: When you encounter a file reference (e.g., @rules/general.md), use your Read tool to load it on a need-to-know basis. They're relevant to the SPECIFIC task at hand.

Instructions:

- Do NOT preemptively load all references - use lazy loading based on actual need
- When loaded, treat content as mandatory instructions that override defaults
- Follow references recursively when needed

## Development Guidelines

For Elixir code style and best practices: @~/.config/opencode/docs/elixir-conventions.md
