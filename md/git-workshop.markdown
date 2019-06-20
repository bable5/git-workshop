# Terminology

![Git logo](assets/git-logo.png)


## SHA-1

* <code>17b1e2aaab76104972a1af593b5e5c4e10bdeee8</code>
* <em>Everything</em> in git has a SHA-1
* The SHA-1 is used to refer to everything

<aside class="notes">
<ul>
<li>SHA-1 is 40 character string</li>
<li>Unique (hand wave hash collisions</li>
<li>Can refer to a SHA-1 by first 4-6 characters</li>
</aside>


## DAG

* Git history forms a graph
* No cycles
* Can always go back in history


## Repo

* Any folder with a .git directory and associated files
* Nothing special.

<aside class="notes">
<ul>
<li>Doesn't need a dedicated server</li>
<li>Can always start local and share or not</li>
</ul>
</aside>



# Git Commands

![Git logo](assets/git-logo.png)


<table>
<tr>
<td>init</td><td>add</td><td>commit</td>
</tr>
</tr>
<td>branch</td><td>merge</td><td>pull</td>
</tr>
<tr>
<td>fetch</td><td>rebase</td><td>log</td>
</tr>
<td>remote</td><td>cherry-pick</td><td>reset</td>
</table>



# Git Basics

![Git logo](assets/git-logo.png)


## Creating a Repo

```bash
$> git init
```

<aside class="notes">
<ul>
<li> A git repo is just folder.</li>
</ul>


## Exercise: Create a repo

* Make a directory to hold your repo
* `cd` into the directory and run
```bash
$> git init
$> ls -a
```
* What did `git init` do?


```bash
$> tree .
```

![Git Tree](assets/tree-git-init.png)

<aside class="notes">
Talk about
<ul>
<li> HEAD </li>
<li> objects </li>
</ul>
</aside>


## Git Areas

![](assets/local-operations.png)


## What has changed?

```bash
$> git status
```


## Adding changes

* Git tracks <em>content</em> not files
    * Cannot commit an empty directory
* Stage changes for commit with:
```bash
$> git add <filename>
```


## Commiting changes

* Only <em>content</em> in the staging area is committed.
* Can split up changes across multiple commits.


* Bring up an editor for the commit message

```bash
$> git commit
```


* Create a commit with a short message

```bash
$> git commit -m "commit message"
```


## Commit Messages

* Git commits are more stylized the usual

```bash
Short subject (~80 characters)

* Markdown style
* detailed
* list of changes
```

<aside class="notes">
Why mention? Because lots of tools assume messages look like this and display accordingly.
<br />
Markdown not required, but lots of servers will display commit messages better if you use it.
</aside>


## Exercise

* Make a file, README.md and add some text to it.
* Stage README.md for commit
* Create a new commit


## Exercise: What has changed?

* Change two files
* Stage the changes from one of the files
* Run:

```bash
$> git diff
$> git diff --cached
```

What's the difference between the outputs?


## Remove staged changes

```bash
$> git reset HEAD <filename>
```



# Examining history

![Git logo](assets/git-logo.png)


## Refering to commits

* Treeish Things
    * SHA-1
    * Branch Name
    * Refspec
        * treeish^
        * treeish~3


## git log


```bash
$> git log
$> git log --oneline
```
<aside class="notes">
This is everything
</aside>


```bash
git log -5 <treeish>
```
<aside class="notes">
Last 5 commits. Lots flags for log. Refer
</aside>


```bash
git log --graph --oneline
```
<aside class="notes">
Mention adding this one to their aliases as a 'hist'
</aside>


## git show

* Shows the log message and changes for a commit

```bash
$> git show
$> git show --oneline
```


## Exercise

* Explore the history of a repo

```bash
$> git clone https://github.com/bable5/git-workshop.git
```

* Look at recent commits
* Look at the log message and changes for a specific commit



# Working with branches

![Git logo](assets/git-logo.png)


## Branching and merging

* Branches are lightweight and local
    * Just a pointer to a commit
* Switching between branches is easy
    * Change where HEAD points
* <code>master</code> is nothing special


## Create a branch

```bash
$> git branch <branchname>
```

```bash
$> git branch <branchname> <start-point>
```

![new branch](assets/create-branch.png)

<small>http://git-scm.com/book/en/</small>


## Switching to a branch

```bash
$> git checkout <treeish>
```

* Checkout makes the working directory look like the specified commit.
* Will leave un-committed changes to the working directory


## Commiting to a branch

![commit](assets/branch-commit.png)

<small>http://git-scm.com/book/en/</small>


## Exercise

* Create a new branch
* Checkout the branch
* Make a commit
* Switch back to master


## Merging

* Brings two seperate branches together
* Should always have local changes committed before merging

![hotfix](assets/hotfix.png)

<aside class="notes">
Suppose a hot fix for prod needs to happen.
How do that?
</aside>

```bash
$> git branch master hotfix
$> git checkout hotfix
...
$> git commit -m "Fix prod"
```


## Fast-forward Merge

![fast-forward merge](assets/hotfix-merge.png)

<small>http://git-scm.com/book/en/</small>

<aside class="notes">
Remotes and non-fastforwd merges when pushing
</aside>

```bash
$> git checkout master
$> git merge hotfix
```


## Non-fastforward Merge

![commit](assets/iss53merge.png)

<small>http://git-scm.com/book/en/</small>

```bash
$> git merge iss53
```

<aside class="notes">
<li> Touch on fast-forward merges and pushing</li>
</aside>


## Merge conflicts

* Resolve the conflicts
* Add the resolved files to the index
* Run:

```bash
$> git commit
```


## Aborting a merge

* If the merge goes badly...

```bash
$> git commit --abort
```

<aside class="notes">
Resets the working directory to the commit before the merge started.
</aside>


## Deleting branches

* Delete a fully merged branch

```bash
$> git -d branch-name
```

* Force a delete

```bash
$> git -D branch-name
```



# Working with others

![Git logo](assets/git-logo.png)


## Overview

* Cloning a repo
* Commiting vs. Sharing
* Refering to remotes
* Adding a new remote
* Pushing and Pulling
* Tracking branches
    * Meaning
    * Pushing/Pulling from a remote
    * Choosing which remote to push/pull from


## Cloning

```bash
$> git clone <src-repo> <dest-name>
```

* Cloning from a folder or a server is exactly the same.


## Fetch

* Grabs changes from a remote.
* The changes have to be merged into a local branch

<aside class="notes">
Talk about where the changes live.
</aside>


## Push

* Sends changes to a remote

```bash
$> git push <remote-name>
```

```bash
$> git push <remote-name> <my-branch>:<remote-branch>
```


## Pull

* Equivalent of a fetch followed by a merge

```bash
$> git pull <remote-name>
```


## Remotes

* Any other repo is refered as a remote
* Can have multiple remotes and chose which one you push and pull from

```bash
$> git remote add <name> <path-to-remote>
```


## Exercise

* Clone an existing repo
* Add a new remote
* Pull changes from a remote


## Local vs. Remote Branches

* All branches are local!
* Remote branches just refer to a branch name your repo thinks also exists on the remote



# Rebasing

![Git logo](assets/git-logo.png)


## Changing history

* Rebasing changes the parent of commit or series of commits
* Only rebase commits you haven't shared!


![Before Rebase](assets/rebase-init.png)

```bash
$> git checkout experiment
$> git rebase master
```

![After Rebase](assets/rebase-final.png)

<small>http://git-scm.com/book/</small>


![Merged Rebase](assets/rebase-merged.png)

```bash
$> git checkout master
$> git merge experiment
```



# Intermediate commands

![Git logo](assets/git-logo.png)


## Adding changes

```bash
$> git add -i
$> git add --patch <filename>
```


## Commiting

Add some new content, or fix the commit message for the HEAD commit.

```bash
$> git commit --amend
```


Create a commit that will <em>fixup</em> another commit.

```bash
$> git commit --fixup=<treeish>
$> git rebase -i --autosquash <treeish>
```


## Checkout

```bash
$> git co <sha-1> <filename>
```

<aside class="notes">
<ul>
<li>Can check out a file you don't have from another branch</li>
</ul>
</aside>


## Rebase interactive

```bash
$> git rebase -i <commit>
```

Allows you to reorder, combine, delete, or edit each commit.


## Exercise:

* Change the order of commits
* Remove a commit from the histery
* Edit a commit message
* Combine two commits together
