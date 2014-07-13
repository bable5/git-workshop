# Git Configuration

![Git Logo](assets/git-logo.png)


## Telling git who you are

```bash
$> git config --global --list

$> git config --global user.name "John Doe"
$> git config --global user.email "johndoe@gmail.com"
```


## Setting up the environment

```bash
$> git config --global core.editor /path/to/editor
$> git config --global merge.tool /path/to/diff/tool
$> git config --global color.ui auto
```


## Git user config file

* $HOME/.gitconfig
* Can edit this file directly

```bash
[user]
    name = Sean Mooney
    email = bable4@gmail.com
```

<aside class="notes">
Example config file.
<br />
[section_name]
    property = value
</aside>


## Aliases

* Command aliases go in the <code>alias</code> section


## Task: Add some aliases

```bash
[alias]
    stat = status
    co = checkout
```

<aside class="notes">
Remind people they can add aliases as the workshop progresses.
</aside>
