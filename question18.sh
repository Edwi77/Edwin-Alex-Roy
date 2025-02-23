git branch -a

git checkout main
#!/bin/bash

# Identify all branches
git branch -a

# Switch to main branch
git checkout main

# Merge all branches starting with 'ready' into main
for branch in $(git branch | grep 'ready'); do
    git merge --no-ff $branch
done

# Resolve any merge conflicts manually if necessary
git status
git add .
git commit -m "Resolved merge conflicts"

# Delete merged 'ready' branches
for branch in $(git branch | grep 'ready'); do
    git branch -d $branch
done

# Update 'update' branches with latest main changes
for branch in $(git branch | grep 'update'); do
    git checkout $branch
    git merge main
done
