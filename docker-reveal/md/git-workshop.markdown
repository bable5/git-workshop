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


