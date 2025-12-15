---
globs:
  - '**/*.ex'
  - '**/*.exs'
---

Follow these Elixir conventions:

- When writing `@doc` and `@moduledoc`, don't add `Parameters` and `Returns` sections. Only add `Example` section. Examples should be safe to copy and paste, and cannot contain truncated code.
- Don't add specs or docs to private functions.
