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
    git add terraform.tfstate
    git commit -m "Update terraform.tfstate - Deploy by $WERCKER_STARTED_BY"
    git push -v $GIT_REMOTE
fi
