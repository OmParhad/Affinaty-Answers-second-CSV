# S&P 500 Companies — Shell Script

A simple Bash script that downloads the S&P 500 companies dataset from GitHub, extracts the company name, headquarters location, and founding year, and displays the companies sorted by founding year.

## Task

Given the following CSV file:

https://raw.githubusercontent.com/datasets/s-and-p-500-companies/refs/heads/main/data/constituents.csv

Write a shell script that:

1. Downloads the CSV file.
2. Extracts:
   - Company name
   - Headquarters location
   - Founding year
3. Sorts the companies by founding year.
4. Prints the results in a readable format.

## Requirements

- Bash
- `curl`
- Python 3
- Git Bash / Linux / macOS shell environment

## Files

```text
AffinityCSV/
├── companies.sh
└── README.md
