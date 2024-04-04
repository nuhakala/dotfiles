inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
added=""
deleted=""

if [ "$inside_git_repo" ]; then
    diff_result=$(git diff --numstat "$1")
    # diff_result2=$(echo ${diff_result} | tr "\t" "\n")
    added=$(echo ${diff_result} | tr " " "\n" | head -1)
    deleted=$(echo ${diff_result} | tr " " "\n" | tail -2 | head -1)
fi

if [ $2 = "add" ]; then
    echo ${added}
elif [ $2 = "delete" ]; then
    echo ${deleted}
fi
