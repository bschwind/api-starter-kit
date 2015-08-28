if [ ! -d ".git" ]; then
    echo "no git repository found"
fi

if [ $DEPLOY != "true" ]; then
    echo "this step is only valid for deploys"
fi

git config --global user.email pleasemailus@wercker.com
git config --global user.name "wercker"
echo "configured git"

if git diff --exit-code --quiet terraform.tfstate ; then
    echo "Not committing terraform.tfstate, nothing changed"
else
    echo "terraform.tfstate changed - committing"
    git status
    git add terraform.tfstate
    echo "Committing with message: Update terraform.tfstate - Deploy by $WERCKER_STARTED_BY [ci skip]"
    git commit -m "Update terraform.tfstate - Deploy by $WERCKER_STARTED_BY [ci skip]"
    git status
    git push -v $GIT_REMOTE HEAD:$WERCKER_GIT_BRANCH
fi
