# Staging

## Interactive Add

````bash
$> git add -i
````

## Patch Add

````bash
$> git add --patch
````

## Edit a hunk

````bash
$> git add --patch

[HUNK]
e

````

# Changing Commits

## Amend a commit

````bash
$> git commit --amend
````

## Fix a commit

````bash
$> git commit --fixup=<treeish>
$> git rebase -i --autosquash <upstream-treeish>
````

# Rebase

## Rules

1. You do not rebase upstream commits.
2. You <em> do not</em> rebase upstream commits.
3. If something goes wrong <code>$> rebase --abort</code>
4. Rebasing continues until all the patches have been applied.


## What is it?

* Allows you to change the parent commit of a sub-tree
* e.g.

````bash
         A--B--C (topic)
        /
    D---E---F--G (master)

    $> git rebase master topic

                 A'--B'--C' (topic)
                /
    D---E---F--G (master)
````

## Syntax

```bash
    $> git rebase <treeish-root>
```

# A Rebasing Workflow

## Advantages

* Use <code>fetch</code> and <code>rebase</code> instead of pull.
* Prevents unnecessary merges when multiple people are pushing commits to the same shared repository.
* Allows conflicts to be addressed in the commit that causes them, not the merge.
* Makes history look nice.

## Instead of

````bash
    $> git commit
    $> git pull
    ... git automatically merges ...
    $> git push
````

## which leads to a history that looks like:

````bash
    *   af6fb5e | Merge branch 'master' of ../example-git-hist (HEAD, master) [S
    |\
    | *   a6ad928 | Merge branch 'master' of /home/smooney/Documents/sai/example
    | |\
    | * | 65da3b9 | add file 2
    * | | 2107bdd | Add file3
    | |/
    |/|
    * | 8bcbc54 | change 2
    |/
    * 30ae4ef | Change1
````

## It could look like

````bash
    * 65da3b9' | Add File 4
    |
    * 2107bdd' | Add file 3
    |
    * 8bcbc54 | Change 2
    |
    * 30ae4ef | Change 1
````

## How do we get this?

* Rebase on the upstream version before pushing new patches

````bash
    $> git fetch origin
    $> git rebase origin/master
    $> git push
````

## Conflicts

* Git rebase forces you to handle any merge conflicts in the commit that caused it
* This means that once you fix the commit (relative to master) it never happened.
* Why drag around merge conflicts when they were only because you had not updated soon enough


