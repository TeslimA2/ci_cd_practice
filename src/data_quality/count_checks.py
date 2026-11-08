def count_missing_values(values):
    """Return the number of None values in an iterable."""
    return sum(value is None for value in values)


def duplicate_count(values):
    """Return the number of values occurring beyond their first occurrence."""
    seen = set()
    duplicates = 0

    for value in values:
        if value in seen:
            duplicates += 1
        else:
            seen.add(value)

    return duplicates
