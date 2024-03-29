BRANCH="$PROJECT_MAIN_BRANCH"

if [[ -z "$BRANCH" ]]; then
    BRANCH=$(git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//")
    #$(git merge-base --fork-point $(git branch -l master main | sed 's/^* //') $(git rev-parse HEAD))
fi

if [[ "$1" == "list" ]]; then
    git --no-pager diff --name-only --diff-filter=ACMR --relative $BRANCH...$(git branch --show-current)
elif [[ "$1" == "diff" ]]; then
    git --no-pager diff --diff-filter=ACMR --relative $BRANCH...$(git branch --show-current) "$2"
fi
