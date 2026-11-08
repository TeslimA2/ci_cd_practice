from data_quality.count_checks import count_missing_values, duplicate_count


def test_count_missing_values_counts_none_values():
    values = [101, None, 103, None]

    assert count_missing_values(values) == 2


def test_count_missing_values_handles_empty_input():
    assert count_missing_values([]) == 0


def test_duplicate_count_counts_repeated_occurrences():
    values = [101, 102, 101, 103, 101]

    assert duplicate_count(values) == 2


def test_duplicate_count_returns_zero_for_unique_values():
    assert duplicate_count([101, 102, 103]) == 0
