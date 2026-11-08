#!/usr/bin/env bash

set -u

mkdir -p output

sql_report=${1:-downloaded-artifacts/sql-report/validation-summary.txt}
summary_file=output/pipeline-summary.txt

if [ ! -f "$sql_report" ]; then
    printf 'ERROR: SQL report not found at %s\n' "$sql_report" >&2
    exit 1
fi

{
    printf '%s\n' "Pipeline validation completed."
    printf '%s\n' ""
    printf '%s\n' "SQL validation:"
    cat "$sql_report"
    printf '%s\n' ""
    printf '%s\n' "Python test matrix completed successfully."
} > "$summary_file"

printf 'Created %s\n' "$summary_file"
