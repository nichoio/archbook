# Defined in /home/nicho/fish/funcions/fish_prompt.fish @ line 2
function vims --wraps='vim -S pwd' --description 'open vim session if possible'
    set pwd (pwd)
    set upath (string replace -a '/' '_' "$pwd")
    set session_path "$HOME/.vim/sessions/$upath.vim"

    if test -e $session_path
        vim -S $session_path
    else
        vim
    end
end
