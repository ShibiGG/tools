#!/bin/bash

# List of domains to check
domains=(

)

# List of correct CNAMEs, converted to lowercase for case-insensitive comparison
correct_cnames=(

)

for domain in "${domains[@]}"; do
    # Query the CNAME for the domain, remove trailing dot, and convert to lowercase
    cname=$(dig +short CNAME $domain | sed 's/\.$//' | awk '{print tolower($0)}')
    
    # Check if the cname exists in the correct_cnames array
    if echo "${correct_cnames[@]}" | grep -qw "$cname"; then
        echo "$domain - Correct"
    else
        echo "$domain - Invalid"
    fi
done
