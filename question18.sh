#!/bin/bash

# Step 1: Identify all branches
git branch -r

git branch -a

# Step 2: Merge all branches starting with 'ready' into 'main'
for branch in $(git branch --list 'ready*'); do
    git checkout main
    git merge $branch
done

# Step 3: Resolve any merge conflicts manually (if needed)
# If conflicts occur, resolve them manually in the editor and run:
# git add <resolved-files>
# git commit -m "Resolved merge conflicts"

# Step 4: Delete merged 'ready' branches
for branch in $(git branch --list 'ready*'); do
    git branch -d $branch
    git push origin --delete $branch
done

# Step 5: Update all branches starting with 'update' to have latest changes from 'main'
for branch in $(git branch --list 'update*'); do
    git checkout $branch
    git merge main
    git push origin $branch
done

# Switch back to main branch
git checkout main
