alias dobash='(){ docker run -u root -it --rm --entrypoint= $1 /bin/bash ;}'
alias dosh='(){ docker run -u root -it --rm --entrypoint= $1 /bin/sh ;}'
alias doils='docker image ls'

alias kall='(){kubectl api-resources --verbs=list --namespaced -o name  | xargs -n 1 kubectl get --show-kind --ignore-not-found --all-namespaces}'
alias kally='(){kubectl api-resources --verbs=list --namespaced -o name  | xargs -n 1 kubectl get --ignore-not-found --all-namespaces -o yaml}'
alias kalln='(){kubectl api-resources --verbs=list --namespaced -o name  | xargs -n 1 kubectl get --show-kind --ignore-not-found  -n $1}'
alias kallny='(){kubectl api-resources --verbs=list --namespaced -o name  | xargs -n 1 kubectl get --show-kind --ignore-not-found  -n $1 -o yaml}'

alias tf='terraform'

# extend omz lib's grep alias
alias grep='grep -in --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.terraform}'
alias cgrep='grep -C 2'
alias ccgrep='grep -C 5'
