# ---------- ALIASES ----------

# run shell in container
alias dobash='(){ docker run -u root -it --pull always --rm --entrypoint= $1 /bin/bash ;}'
alias dosh='(){ docker run -u root -it --pull always --rm --entrypoint= $1 /bin/sh ;}'

# run shell in container without pulling (for local images)
alias dobashl='(){ docker run -u root -it --rm --entrypoint= $1 /bin/bash ;}'
alias doshl='(){ docker run -u root -it --rm --entrypoint= $1 /bin/sh ;}'

alias doils='docker image ls'
alias dexec='(){ docker exec -it $1 /bin/bash ;}'

alias kall='(){kubectl api-resources --verbs=list --namespaced -o name  | xargs -n 1 kubectl get --show-kind --ignore-not-found --all-namespaces}'
alias kally='(){kubectl api-resources --verbs=list --namespaced -o name  | xargs -n 1 kubectl get --ignore-not-found --all-namespaces -o yaml}'
alias kalln='(){kubectl api-resources --verbs=list --namespaced -o name  | xargs -n 1 kubectl get --show-kind --ignore-not-found  -n $1}'
alias kallny='(){kubectl api-resources --verbs=list --namespaced -o name  | xargs -n 1 kubectl get --show-kind --ignore-not-found  -n $1 -o yaml}'
alias kname='(){kubectl get po,service,rs,deploy,sts,job,pvc,cm,secret,sa,role,rolebinding,netpol,ing -n $1}'

alias tf='terraform'

# extend omz lib's grep alias
# grep + ignore several dirs. grep can still be applied to excluded dirs manually
alias grep='grep -in --color=auto --exclude="*.bin" --exclude="*.msgpack" --exclude="*.svg" --exclude="*.js.map" --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.terraform,dist,test,tests,node_modules}'
alias cgrep='grep -C 2'
alias ccgrep='grep -C 5'

# retrieve public ipv4 ip address
alias myip='dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com'

# show contents of certificate
alias crtshow='(){openssl x509 -noout -text -in $1}'

# ---------- FUNCTIONS ----------

function jwtd(){
# Decode JSON Web token payload.
# from https://gist.github.com/thomasdarimont/46358bc8167fce059d83a1ebdb92b0e7
    jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "$1"
}

function genpw(){
# Generate string which can be used as password.
# from https://unix.stackexchange.com/a/230676
# exclude chars such as 0,O,o etc. to create easy-to-read passwords
    LC_ALL=C tr -dc 'abcdefghijkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ123456789!"#$%&()*+,-./:;<=>?@[]^_{|}~' </dev/urandom | head -c 13  ; echo
}

function helpu() {
# Download and unpack files of Helm chart in current directory
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

    # cleanup
    helm repo remove somechart
}

function replall() {
    # find and replace all occurrences of arg1 by arg2 across all files in current directory
    # exclude .git folder when replacing. Also, only recommended to use replall on git repos because no backups of edited files are created.
    if [ `uname` = "Darwin" ]
    then
        # see https://stackoverflow.com/questions/19242275
        # and https://stackoverflow.com/questions/4247068
        find . -type d -name .git -prune -o -type f -name "*" -print0 | LC_ALL=C xargs -0 sed -i '' -e "s/$1/$2/g"
    else
        find . -type d -name .git -prune -o -type f -name "*" -print0 | xargs -0 sed -i "s/$1/$2/g"
    fi
}

function s3lastmod(){
# Returns what file of given bucket was last modified and when.
# Useful to understand if a bucket is still actively written to.
# Based on https://stackoverflow.com/a/58451831/6312338
# Usage example (with profile): $ s3lastmod my-bucket my-profile
    if [ "$2" != "" ]
    then
        aws s3api list-objects-v2 --bucket $1 --query 'sort_by(Contents, &LastModified)[-1]' --profile $2
    else
        aws s3api list-objects-v2 --bucket $1 --query 'sort_by(Contents, &LastModified)[-1]'
    fi
}
