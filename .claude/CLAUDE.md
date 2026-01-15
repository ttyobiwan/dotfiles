## General Guidelines

- When naming session, use max 3-5 words.
- In all interactions be extremely concise and sacrifice grammar for the sake of concision.
- When I'm asking questions, or having doubts, I expect genuine, precise, and relevant answer, not that I'm "absolutely right". I might be right, but I might as have some wrong assumptions. Our task is to succeed, not to comfort me.
- At the end of each plan, give me a list of unresolved questions to answer, if any. Make the questions extremely concise. Sacrifice grammar for the sake of concision.
- When making plans try to limit the code changes shown; do NOT puke the whole diff during the planning phase.
- Limit the AI-slop comments to absolutel minimum; code should be self-descriptive, no need to add `# this thing does x` above `def function_that_does_x`.

## Code Philosophy

When designing and building software, I keep in mind lessons from legendary engineers who've thought deeply about these problems:

**Casey Muratori**
- Skepticism of "clean code" dogma when it harms performance
- Abstraction layers often cost more than they save
- Data-oriented design; profiling-driven development
- "If you don't know how bad the performance will be from your decisions, you aren't making a trade-off. You're just ignoring a problem."

**Jonathan Blow**
- Modern software is drowning in unnecessary complexity
- Most of what programmers do today is waste-fighting complexity that doesn't need to exist
- Abstractions hide costs and erode understanding across generations

**Terry Davis**
- Radical self-sufficiency: one person should be able to understand the entire system
- Constraints are liberating, not limiting
- Rejection of bloat and dependency culture

**Linus Torvalds**
- Practicality over theory-"when they clash, theory loses"
- The happy path should be clear; edge cases shouldn't clutter core logic
- Good taste in code structure matters

**Synthesis**:
- Simplicity is earned through understanding, not achieved by ignoring complexity.
- Mantras like "make it work, make it right, make it fast" assume you don't yet understand the problem. When you do, these aren't phases - they're simultaneous.
- Abstractions should compress complexity, not hide it.
- Tight feedback loops between design and reality beat upfront planning.

**The goal is code that is**:
- Simple because the problem is deeply understood
- Maintainable because abstractions earn their keep
- Fast because performance was a design constraint, not an afterthought

## Code Style

- Prefer early returns over deep nesting

```
# Bad:
if x:
    # Some logic
    if y:
        # Some logic
        if z:
            # Some logic
            return True
return False

# Good:
if not x:
    return False

if not y:
    return False

if not z:
    return False

return True

# Equally good:
if not x:
    return validate_y_and_z(y, z)
```

This is particularly important when there is logic between conditionals, that becomes unreadable because of nesting.

- Avoid wrapping whole function body in conditionals

```
def some_function(a, b):
    if some_condition:
        return a * 2
    else:
        return b * 2
```

It adds unnecessary nesting and makes the intend less clear. Instead, you can either add the conditional when calling the function, or add separate functions.

## Language specific rules

### Elixir

Follow these Elixir conventions.

#### General

- When writing `@doc` and `@moduledoc`, don't add `Parameters` and `Returns` sections. Only add `Example` section. Examples should be safe to copy and paste, and cannot contain truncated code.
- Don't add specs or docs to private functions.
- When adding code blocks in docstrings, do NOT add `...>` or `iex>` as continuation - just use proper indentation.
- Add imports and aliases on the module level, not on function level.
- Avoid using `only` in imports. Something like `import Ecto.Query, only: [from: 2]` is rarely necessary.

#### Logging

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

#### Phoenix

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

#### Oban

- Jobs should just perform an action(s), and maybe do some results gathering/aggregation. They should NOT hold any feature-specific logic.

#### Ecto

- `Repo.delete_all` can return a result as second element if select is supplied in the delete query.

### Python

Follow these Python conventions.

#### General

- Don't write `dict[str, Any]` type annonations because it's the same as `dict`.
- When writing type annonations, don't import `List`, `Dict`, etc. from `typing` because you can just use `list`, `dict`, etc.

#### Exceptions

- Exceptions messages should never contain dynamic data: `SomeError(f"Object {object_id} not found")` will cause problems for services like Sentry
- Exception messages should be declared before raising:

```python
msg = "Object not found"
raise NotFoundError(msg)
```

#### Django

- Avoid `try` blocks with `except Object.DoesNotExist`; they add nesting for zero value. Instead you can do `.filter(...).first()`.

#### Logging

```python
import structlog

logger = structlog.get_logger(__name__)

# Basic structured logging
logger.info("User logged in", user_id=123, ip="192.168.1.1")

# Multi-line for complex metadata
logger.error(
    "Payment failed",
    user_id=user.id,
    order_id=order.id,
    amount=payment.amount,
    reason=error_reason,
)
```

```python
# Good: Identifiers in metadata, details in message
logger.info(
    f"Payment processed for ${amount} via {method}",
    user_id=user.id,
    order_id=order.id,
)

logger.error(
    f"API request failed with status {status}: {error_message}",
    conversation_id=context.conversation_id,
    user_id=user.id,
)

logger.debug(
    f"Database query completed in {duration}ms returning {count} records",
    table="users",
    user_id=current_user.id,
)
```

```python
# API operations
logger.info(
    f"API {method} {path} completed with status {status} in {duration}ms",
    user_id=current_user.id,
    request_id=request_id,
    method=method,
    endpoint=path,
)

# Database operations
logger.debug(
    f"{operation} query on {table} completed in {duration}ms returning {count} records",
    table=table,
    operation=operation,
    user_id=current_user.id,
)

# Error handling
logger.error(
    f"{service} service unavailable: {error!r}",
    service=service,
    user_id=user.id,
    request_id=request_id,
    retry_count=retry_count,
)

# Business logic
logger.info(
    f"Order {order_id} processed successfully for ${total} via {payment_method}",
    order_id=order.id,
    user_id=order.user_id,
    request_id=request_id,
)
```

#### Testing

- Tests should be classes, with methods representing specific testing scenarion (similar to ExUnit conventions)

```python
def method_to_test():
    if something:
        return True
    return False

class TestMethodToTest:
    def test_returns_true_if_something(): ...
    def test_returns_false_if_not_something(): ...
```
