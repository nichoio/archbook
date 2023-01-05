alias dobash='(){ docker run -u root -it --rm --entrypoint= $1 /bin/bash ;}'
alias dosh='(){ docker run -u root -it --rm --entrypoint= $1 /bin/sh ;}'
alias doils='docker image ls'

alias kall='(){kubectl api-resources --verbs=list --namespaced -o name  | xargs -n 1 kubectl get --show-kind --ignore-not-found --all-namespaces}'
alias kally='(){kubectl api-resources --verbs=list --namespaced -o name  | xargs -n 1 kubectl get --ignore-not-found --all-namespaces -o yaml}'
alias kalln='(){kubectl api-resources --verbs=list --namespaced -o name  | xargs -n 1 kubectl get --show-kind --ignore-not-found  -n $1}'
alias kallny='(){kubectl api-resources --verbs=list --namespaced -o name  | xargs -n 1 kubectl get --show-kind --ignore-not-found  -n $1 -o yaml}'

function helpu() {  # Unpacks given Helm chart to a new folder under current directory.
    if [ "$1" = "" ]
    then
      echo "must provide at least one argument: CHART-URL [CHART-NAME]"
      return 1
    fi

    # TODO: add ability to add --version
    helm repo add somechart $1

    if [ "$2" != "" ]
    then
        helm repo update && helm pull somechart/$2 --untar
    else
        helm repo update && helm pull somechart --untar
    fi

    helm repo remove somechart
}

alias tf='terraform'

# extend omz lib's grep alias
# grep + ignore several dirs. grep can still be applied to excluded dirs manually
alias grep='grep -in --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.terraform,test,tests}'
alias cgrep='grep -C 2'
alias ccgrep='grep -C 5'
