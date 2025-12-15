---
globs:
  - '**/*.ex'
  - '**/*.exs'
---

Follow these Elixir conventions:

- When writing `@doc` and `@moduledoc`, don't add `Parameters` and `Returns` sections. Only add `Example` section. Examples should be safe to copy and paste, and cannot contain truncated code.
- Don't add specs or docs to private functions.
- When adding code blocks in docstrings, do NOT add `...>` or `iex>` as continuation - just use proper indentation.
- Add imports and aliases on the module level, not on function level.
- Avoid using `only` in imports. Somethign like `import Ecto.Query, only: [from: 2]` is rarely necessary.
