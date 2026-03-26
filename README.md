Copy all the dot files from this repository into your home directory.

**Safe copy (prompts before overwriting):**
```
cd bash_setup && cp -i ./{.bash_profile,.bashrc,.bash_alias,.git-prompt.sh,.gitconfig,.inputrc,.vimrc} ~/
```

**Force copy (overwrites existing files):**
```
cd bash_setup && cp ./{.bash_profile,.bashrc,.bash_alias,.git-prompt.sh,.gitconfig,.inputrc,.vimrc} ~/
```

#### What the dot files do
- `.bash_profile` — sources `~/.bashrc` on login
- `.bashrc` — prompt, history, aliases, completions
- `.inputrc` — fixes Option+Arrow word navigation in terminal (backward-word / forward-word)
- `.bash_alias` — custom aliases
- `.git-prompt.sh` — git branch in prompt
- `.gitconfig` — git settings
- `.vimrc` — vim settings

#### Configure keybindings for left/right arrows: https://stackoverflow.com/a/23963086/6463555

Set `OVERRIDDEN_HOME_DIR_BASH` to any directory to override home dir in the configs. This is helpful if you want to keep your history, alias files, etc. separate from other users on a shared machine. You don't need to copy the files to the home dir if you set the env var. However, you would need to source the `.bashrc` manually for every login.

```
root@pod-655ff4c-cds34$ export OVERRIDDEN_HOME_DIR_BASH=$PWD

root@pod-655ff4c-cds34$ echo $PWD
/workspace/rsaim/bash_setup

root@pod-655ff4c-cds34$ source .bashrc
HOME_DIR_BASH=/workspace/rsaim/bash_setup

> root @ root@pod-655ff4c-cds34 /workspace/rsaim/bash_setup 20:37:46
```
