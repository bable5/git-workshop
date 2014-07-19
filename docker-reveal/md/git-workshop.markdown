# Terminology 

![Git logo](assets/git-logo.png)


## SHA-1

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

* Make a directory to hold you're repo
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
* Add the resolvd files to the index
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
$> branch -d branch-name
```

* Force a delete

```bash
$> branch -d branch-name
```



# Working with others

![Git logo](assets/git-logo.png)


## Overview

* Cloning a repo
* Refering to remotes
* Adding a new remote
* Commiting vs. Sharing
* Pushing and Pulling
* Tracking branches
    * Meaning
    * Pushing/Pulling from a remote
    * Choosing which remote to push/pull from


## Push


## Pull


## Fetch


## Exercise

* Clone an existing repo
* Add a new remote
* Pull changes from a remote


## Local vs. Remote Branches



# Rebasing

![Git logo](assets/git-logo.png)



# Intermediate commands

![Git logo](assets/git-logo.png)


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

