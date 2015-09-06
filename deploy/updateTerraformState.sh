if [ ! -d ".git" ]; then
    echo "no git repository found"
fi

if [ $DEPLOY != "true" ]; then
    echo "this step is only valid for deploys"
fi

git config --global user.email pleasemailus@wercker.com
git config --global user.name "wercker"

export GITHUB_PUSH_KEY_PATH=`mktemp`
privateKey=$(eval echo "\$${GITHUB_PUSH_KEY}_PRIVATE")
echo -e "$privateKey" > $GITHUB_PUSH_KEY_PATH
eval `ssh-agent -s`
ssh-add $GITHUB_PUSH_KEY_PATH

echo "configured git"

if git diff --exit-code --quiet terraform.tfstate ; then
    echo "Not committing terraform.tfstate, nothing changed"
else
    echo "terraform.tfstate changed - committing"
    env
    git pull --ff-only origin $WERCKER_GIT_BRANCH
    git add terraform.tfstate
    echo "Committing with message: Update terraform.tfstate - Deploy by $WERCKER_STARTED_BY [ci skip]"
    git commit -m "Update terraform.tfstate - Deploy by $WERCKER_STARTED_BY [ci skip]"
    git status

    # Show last 3 commits
    git log -n 3
    git push -v origin HEAD:$WERCKER_GIT_BRANCH
fi
