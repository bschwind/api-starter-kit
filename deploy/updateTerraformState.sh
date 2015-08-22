if [ ! -d ".git" ]; then
    fail "no git repository found"
fi

if [ $DEPLOY != "true" ]; then
    fail 'this step is only valid for deploys'
fi

# Configure Git.
if [ "$WERCKER_RESULT" = "passed" ]; then
    # Configure git
    git config --global user.email pleasemailus@wercker.com
    git config --global user.name "wercker"
    debug 'configured git'

    # Create the name of the tag
    tagname="deploy-$WERCKER_DEPLOYTARGET_NAME"


    if git diff --exit-code --quiet terraform.tfstate ; then
        info "Not committing terraform.tfstate, nothing changed"
    else
        info "terraform.tfstate changed - committing"
        git add terraform.tfstate
        git commit -m "Update terraform.tfstate - Deploy by $WERCKER_STARTED_BY"
        git push $GIT_REMOTE
    fi
else
    info "skipping git tag because the deploy result is $WERCKER_RESULT"
fi
