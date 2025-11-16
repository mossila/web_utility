#!/bin/bash
# filepath: /Users/mossila/Developer/web_utility/generate_emails.sh

OUTPUT_FILE="/Users/mossila/Developer/web_utility/input/email_list_100k.txt"

# Arrays of valid email patterns
VALID_DOMAINS=("gmail.com" "yahoo.com" "outlook.com" "company.org" "hotmail.com" "domain.co.uk" "test.net" "mail.com" "service.com" "work.io" "platform.com" "app.net" "solutions.io" "tools.com" "hub.org" "cloud.io" "stream.co" "tech.net" "network.io" "portal.com")
VALID_NAMES=("john.doe" "sarah.smith" "michael.brown" "emma.wilson" "david.taylor" "james.anderson" "lisa.thomas" "robert.jackson" "william.white" "christopher.harris" "patricia.martin" "daniel.thompson" "jennifer.garcia" "matthew.robinson" "anthony.clark" "barbara.rodriguez" "mark.lewis" "donald.lee" "elizabeth.walker" "steven.hall")

# Arrays of invalid email patterns
INVALID_EMAILS=(
    "test@mailcom"
    "test@mail .com"
    "#n/a"
    "test_123@mail_com"
    "invalidmail@"
    "test @mail.com"
    "test..email@mail.com"
    "@mail.com"
    "test@.com"
    "usermail.com"
    "test user@mail.com"
    "test@mail..com"
    "#N/A"
    "test@mailcm"
    "@test"
    "invalid..email@domain.com"
    "test mail@gmail.com"
    "test@mail,com"
    "test@@mail.com"
    "a b@mail.com"
    "test@domain"
    "testmailcom"
    "t@mail.c"
    "test@ gmail.com"
    "test@mail .org"
    "#invalid#"
    ".test@mail.com"
    "test@-mail.com"
    "test@mail-.com"
    "test@mail@com"
    "spaces in@mail.com"
    "test@mail!com"
    "#error"
    "#invalid"
)

# Separators array (space, tab, newline)
SEPARATORS=(" " "	" "
")

# Create or clear the output file
> "$OUTPUT_FILE"

# Generate 100,000 emails
for ((i=1; i<=100000; i++)); do
    # Randomly choose between valid (70%) or invalid (30%)
    if (( RANDOM % 10 < 7 )); then
        # Valid email
        NAME_INDEX=$((RANDOM % ${#VALID_NAMES[@]}))
        DOMAIN_INDEX=$((RANDOM % ${#VALID_DOMAINS[@]}))
        EMAIL="${VALID_NAMES[$NAME_INDEX]}${i}@${VALID_DOMAINS[$DOMAIN_INDEX]}"
    else
        # Invalid email
        INVALID_INDEX=$((RANDOM % ${#INVALID_EMAILS[@]}))
        EMAIL="${INVALID_EMAILS[$INVALID_INDEX]}"
    fi
    
    # Add random separator
    SEP_INDEX=$((RANDOM % ${#SEPARATORS[@]}))
    SEPARATOR="${SEPARATORS[$SEP_INDEX]}"
    
    printf "%s%s" "$EMAIL" "$SEPARATOR" >> "$OUTPUT_FILE"
done

echo "✓ Generated 100k emails in: $OUTPUT_FILE"
