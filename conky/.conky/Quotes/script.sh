#!/bin/bash
QUOTE_FILE="$HOME/.conky/Quotes/quotes.txt"
OUTPUT_FILE="$HOME/.conky/Quotes/current.txt"

QUOTE=$(shuf -n 1 "$QUOTE_FILE")
echo -n "${QUOTE}" | fold -s -w 35 > "$OUTPUT_FILE"


