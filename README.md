Copy all the dot files from this repository into your home directory. Note that this will override your dot file in your home directory.

```
cd bash_setup && cp ./{.bash*,.git-prompt.sh,.gitconfig,.vimrc} ~/
```
Add `source ~/.bashrc` in `~/.profile`

#### Configure keybindings for left/right arrows: https://stackoverflow.com/a/23963086/6463555

Set `OVERRIDDEN_HOME_DIR_BASH` to any directory to override home dir in the configs. This is helpful if you want to keep your history, alias files, etc. separate from other users on a shared machine. You don't need to copy the files to the home dir if youset the env var. However, you would need to source the `.bashrc` manually for every login.

```
root@pod-655ff4c-cds34$ export OVERRIDDEN_HOME_DIR_BASH=$PWD

root@pod-655ff4c-cds34$ echo $PWD
/workspace/rsaim/bash_setup

root@pod-655ff4c-cds34$ source .bashrc
HOME_DIR_BASH=/workspace/rsaim/bash_setup

> root @ root@pod-655ff4c-cds34 /workspace/rsaim/bash_setup 20:37:46
```

