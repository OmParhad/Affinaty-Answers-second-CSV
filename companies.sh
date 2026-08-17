#!/bin/bash

CSV_URL="$1"

if [ -z "$CSV_URL" ]; then
    echo "Usage: ./companies.sh <CSV_URL>"
    exit 1
fi

TEMP_FILE=$(mktemp)

# Download CSV
curl -L "$CSV_URL" -o "$TEMP_FILE"

if [ $? -ne 0 ]; then
    echo "Failed to download CSV."
    rm -f "$TEMP_FILE"
    exit 1
fi

# Use the actual Python installation on your Windows machine
/c/Users/Lenovo/AppData/Local/Programs/Python/Python313/python.exe "$TEMP_FILE" <<'PY'
PY

/c/Users/Lenovo/AppData/Local/Programs/Python/Python313/python.exe - "$TEMP_FILE" <<'PY'
import csv
import sys
import re

csv_file = sys.argv[1]

companies = []

with open(csv_file, newline="", encoding="utf-8-sig") as f:
    reader = csv.DictReader(f)

    for row in reader:
        name = row["Security"].strip()
        location = row["Headquarters Location"].strip()
        founded = row["Founded"].strip()

        # Extract the first 4-digit year
        match = re.search(r"\d{4}", founded)

        if match:
            year = int(match.group())
            companies.append((year, name, location))

# Sort by founding year
companies.sort(key=lambda x: x[0])

print("Company | Location | Founded")
print("-" * 70)

for year, name, location in companies:
    print(f"{name} | {location} | {year}")
PY

rm -f "$TEMP_FILE"