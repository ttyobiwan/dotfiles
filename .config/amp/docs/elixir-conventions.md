---
globs:
  - '**/*.ex'
  - '**/*.exs'
---

Follow these Elixir conventions.

## General

- When writing `@doc` and `@moduledoc`, don't add `Parameters` and `Returns` sections. Only add `Example` section. Examples should be safe to copy and paste, and cannot contain truncated code.
- Don't add specs or docs to private functions.
- When adding code blocks in docstrings, do NOT add `...>` or `iex>` as continuation - just use proper indentation.
- Add imports and aliases on the module level, not on function level.
- Avoid using `only` in imports. Something like `import Ecto.Query, only: [from: 2]` is rarely necessary.

## Logging

```elixir
# Implicit keyword list (preferred for readability)
Logger.info("User logged in", user_id: 123, ip: "192.168.1.1")

# Explicit keyword list (also valid)
Logger.info("User logged in", [user_id: 123, ip: "192.168.1.1"])

# Multi-line for complex metadata
Logger.error("Payment failed", [
  user_id: user.id,
  order_id: order.id,
  amount: payment.amount,
  reason: error_reason
])
```

```elixir
# Good: Identifiers in metadata, details in message
Logger.info("Payment processed for $#{amount} via #{method}", [
  user_id: user.id,
  order_id: order.id
])

Logger.error("API request failed with status #{status}: #{error_message}", [
  conversation_id: context.conversation_id,
  user_id: user.id
])

Logger.debug("Database query completed in #{duration}ms returning #{count} records", [
  table: :users,
  user_id: current_user.id
])
```

```elixir
# API operations
Logger.info("API #{method} #{path} completed with status #{status} in #{duration}ms", [
  user_id: current_user.id,
  request_id: request_id,
  method: method,
  endpoint: path
])

# Database operations  
Logger.debug("#{operation} query on #{table} completed in #{duration}ms returning #{count} records", [
  table: table,
  operation: operation,
  user_id: current_user.id
])

# Error handling
Logger.error("#{service} service unavailable: #{inspect(error)}", [
  service: service,
  user_id: user.id,
  request_id: request_id,
  retry_count: retry_count
])

# Business logic
Logger.info("Order #{order_id} processed successfully for $#{total} via #{payment_method}", [
  order_id: order.id,
  user_id: order.user_id,
  request_id: request_id
])
```

## Phoenix

- Always use Phoenix and Elixir generators before manually creating code. Generators ensure consistency, follow best practices, and maintain proper project structure.

```bash
# Create database migrations
mix ecto.gen.migration create_users_table

# Generate schema with migration
mix phx.gen.schema Accounts.User users email:string name:string

# Generate embedded schemas
mix phx.gen.embedded UserProfile name:string bio:text
```

- Generated migration can use binary_id for schema's primary key and its references with option `--binary-id`.

## Oban

- Jobs should just perform an action(s), and maybe do some results gathering/aggregation. They should NOT hold any feature-specific logic.

## Ecto

- `Repo.delete_all` can return a result as second element if select is supplied in the delete query.
