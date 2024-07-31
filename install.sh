#!/bin/bash

# Directory where the scripts are located
SCRIPTS_DIRECTORY="./scripts"

# Get the list of scripts in the directory
scripts=$(ls "$SCRIPTS_DIRECTORY")

# Array to store the scripts the user wants to execute
scripts_to_run=()

# Iterate over each script and ask the user if they want to execute it
for script in $scripts; do
    echo -n "Do you want to execute the script: '$script'? (y/n) "
    read -r response
    if [[ "$response" == "y" || "$response" == "Y" ]]; then
        scripts_to_run+=("$SCRIPTS_DIRECTORY/$script")
    fi
done

echo ""
echo ""

# Check if there are scripts to execute
if [ ${#scripts_to_run[@]} -eq 0 ]; then
    echo "No scripts were selected for execution."
    exit 0
fi

bash "base.sh"

# Execute the selected scripts
for script in "${scripts_to_run[@]}"; do
    echo "Executing $script..."
    bash "$script"
    echo "$script executed."
    echo ""
    echo ""
done

source ~/.profile

# if [ -f ~/.zshrc ]; then
#     source ~/.zshrc
# else
#     source ~/.bashrc
# fi

echo "All selected scripts have been executed."