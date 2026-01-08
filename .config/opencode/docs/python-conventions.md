Follow these Python conventions.

## General

- Don't write `dict[str, Any]` type annonations because it's the same as `dict`.
- When writing type annonations, don't import `List`, `Dict`, etc. from `typing` because you can just use `list`, `dict`, etc.

## Exceptions

- Exceptions messages should never contain dynamic data: `SomeError(f"Object {object_id} not found")` will cause problems for services like Sentry
- Exception messages should be declared before raising:

```python
msg = "Object not found"
raise NotFoundError(msg)
```

## Django

- Avoid `try` blocks with `except Object.DoesNotExist`; they add nesting for zero value. Instead you can do `.filter(...).first()`.

## Logging

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

## Testing

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
