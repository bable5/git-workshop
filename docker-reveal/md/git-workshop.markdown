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


## Task: Create a repo

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


## Task

* Make a file, README.md and add some text to it.
* Stage README.md for commit
* Create a new commit


## Remove staged changes

```bash
$> git reset HEAD <filename>
```


## Non-fastforward Merge

![Merge two branches]()


## Task: What has changed?

* Change to files
* Stage the changes from one of the files
* Run:

```bash
$> git diff
$> git diff --cached
```

What's the difference between the outputs?


## Git ignore



# Examining history

![Git logo](assets/git-logo.png)


## Refering to commits

* SHA-1
* branch name
* Relative 


## git log


## git show


## Task

* Explore the history of a repo
* Look at recent commits
* Look at the log message and diff for a specific commit



# Working with branches

![Git logo](assets/git-logo.png)


## Branching and merging


* Branches are lightweight and local
* Switching between branches


## Create a branch

```bash
$> git branch <branchname>
```

```bash
$> git branch <branchname> <start-point>
```


## Switching to a branch

```bash
$> git checkout <treeish>
```

* Checkout makes the working directory look like the specified commit.
* Will leave un-committed changes to the working directory


## Task

* Create a new branch
* Checkout the branch
* Make a commit
* Switch back to master


## Merging

* Brings two seperate branches together


## Fastforward Merge


![Fast Forward]()

<aside class="notes">
Remotes and non-fastforwd merges when pushing
</aside>


## Merge conflicts



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


## Task


* Clone an existing existing
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

