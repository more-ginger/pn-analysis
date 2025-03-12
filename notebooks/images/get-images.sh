#!/bin/bash

# Check if a CSV file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <csv_file>"
    exit 1
fi

CSV_FILE="$1"
BASE_URL="https://www.nytimes.com/"
# Create the directory if it doesn't exist
mkdir -p "../../data/images/nyt/"

# Read CSV file line by line, skipping the header
{ read; while IFS=, read -r clean_id image_url; do
    # Remove potential quotes around fields
    clean_id=$(echo "$clean_id" | tr -d '"')
    image_url=$(echo "$image_url" | tr -d '"')
    
    #Construct the full URL
    full_url="$BASE_URL$image_url"

    # Extract the file extension from the image URL
    file_extension="${image_url##*.}"

    # Define the output file name using clean_id
    output_file="${clean_id}.${file_extension}"
    
    # Download the image into the directory
    echo "Downloading $full_url into folder"
    wget -q "$full_url" -O "../../data/images/nytimes/$output_file"

done; } < "$CSV_FILE"