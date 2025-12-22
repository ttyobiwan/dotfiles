Follow these Python conventions:

- Don't write `dict[str, Any]` type annonations because it's the same as `dict`.
- When writing type annonations, don't import `List`, `Dict`, etc. from `typing` because you can just use `list`, `dict`, etc.
- Exceptions messages should never contain dynamic data: `SomeError(f"Object {object_id} not found")` will cause problems for services like Sentry
- Exception messages should be declared before raising:

```python
msg = "Betslip not found"
raise BetslipNotFoundError(msg)
```

- In Django, avoid `try` blocks with `except Object.DoesNotExist`; they add nesting for zero value.
