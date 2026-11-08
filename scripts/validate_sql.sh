#!/usr/bin/env bash
set -u

failure=0
file_count=0

while IFS= read -r -d '' file; do
    file_count=$((file_count + 1))
    printf 'Validating %s\n' "$file"

    last_line=$(grep -v '^[[:space:]]*$' "$file" | tail -n 1)
    if ! printf '%s\n' "$last_line" | grep -Eq ';[[:space:]]*$'; then
        printf 'ERROR: %s does not end with a semicolon.\n' "$file" >&2
        failure=1
    fi

    if grep -Eq 'TODO|DEBUG' "$file"; then
        printf 'ERROR: %s contains a TODO or DEBUG marker.\n' "$file" >&2
        failure=1
    fi

    if grep -Eqi 'SELECT[[:space:]]+\*' "$file"; then
        printf 'ERROR: %s contains SELECT *.\n' "$file" >&2
        failure=1
    fi
done < <(find sql -type f -name '*.sql' -print0)

if [ "$file_count" -eq 0 ]; then
    printf '%s\n' "ERROR: no SQL files found under sql/." >&2
    exit 1
fi

if [ "$failure" -ne 0 ]; then
    printf '%s\n' "SQL validation failed." >&2
    exit 1
fi

printf 'SQL validation passed for %s file(s).\n' "$file_count"
exit 0
