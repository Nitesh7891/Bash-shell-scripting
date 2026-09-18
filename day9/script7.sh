#!/bin/bash

<<Comment
Calculate a person's age in years, months, and days from their DOB.
Comment

DOB="2004-08-10"
TODAY=$(date '+%Y-%m-%d')

DOB_YEAR=$(date -d "$DOB" +%Y)
DOB_MONTH=$(date -d "$DOB" +%-m)
DOB_DAY=$(date -d "$DOB" +%-d)

CURRENT_YEAR=$(date +%Y)
CURRENT_MONTH=$(date +%-m)
CURRENT_DAY=$(date +%-d)

# Calculate initial difference
YEARS=$((CURRENT_YEAR - DOB_YEAR))
MONTHS=$((CURRENT_MONTH - DOB_MONTH))
DAYS=$((CURRENT_DAY - DOB_DAY))

# If days are negative, borrow from previous month
if [ "$DAYS" -lt 0 ]; then
    MONTHS=$((MONTHS - 1))

    PREVIOUS_MONTH=$(date -d "$TODAY -1 month" +%Y-%m-01)
    DAYS_IN_PREVIOUS_MONTH=$(date -d "$PREVIOUS_MONTH +1 month -1 day" +%-d)

    DAYS=$((DAYS + 10#$DAYS_IN_PREVIOUS_MONTH))
fi


if [ "$MONTHS" -lt 0 ]; then
    YEARS=$((YEARS - 1))
    MONTHS=$((MONTHS + 12))
fi

echo "Date of Birth : $DOB"
echo "Today         : $TODAY"
echo "Age: $YEARS years, $MONTHS months, $DAYS days"
