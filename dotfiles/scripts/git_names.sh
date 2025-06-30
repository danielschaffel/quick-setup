#
# # Check if directory argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory>"
    echo "Example: $0 /path/to/your/projects"
    exit 1
fi

SEARCH_DIR="$1"

# Check if the provided directory exists
if [ ! -d "$SEARCH_DIR" ]; then
    echo "Error: Directory '$SEARCH_DIR' does not exist."
    exit 1
fi

echo "Git repositories found:"
echo "======================"

#  Loop through all directories in the specified path
for dir in "$SEARCH_DIR"*/; do
    echo $dir
	# Check if it's actually a directory
	if [ -d "$dir" ]; then
		# Check if it contains a .git directory (is a git repo)
		if [ -d "$dir/.git" ]; then
			# Change to the git repository directory
			cd "$dir" || continue
			# Get the repository name from git remote origin URL
			repo_name=$(git config --get remote.origin.url 2>/dev/null | sed 's/.*\///' | sed 's/\.git$//')
			# If no remote origin, fall back to directory name
			if [ -z "$repo_name" ]; then
				repo_name=$(basename "$dir")
				echo "• $repo_name (no remote origin)"
			else
				echo "• $repo_name"
			fi

    # Return to the search directory
    cd - > /dev/null
        fi
    fi
done
