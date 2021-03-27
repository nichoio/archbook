# Defined in /home/nicho/fish/funcions/fish_prompt.fish @ line 2
function fish_prompt
    # prompt_code $status must be at top to query previous exit status
    set prompt_code $status
    set prompt_user (whoami)
    set prompt_path (dirs)
    set col_bg_user ff9800
    set col_bg_path fff700
    set_color white

    if test $prompt_code -eq 0
        set_color -b 337722
    else
        set_color -b aa2222
    end

    begin
      git branch
    end &> /dev/null

    if test $status -eq 0
        set prompt_branch (git branch --show-current)
        echo " $prompt_code" (set_color -b $col_bg_user)(set_color black) "$prompt_user" (set_color -b $col_bg_path)(set_color black) "$prompt_path" (set_color -b 0073c4)(set_color white) "$prompt_branch >"(set_color -b normal)(set_color normal) " "
    else
        echo " $prompt_code" (set_color -b $col_bg_user)(set_color black) "$prompt_user" (set_color -b $col_bg_path)(set_color black) "$prompt_path>"(set_color -b normal)(set_color normal) " "
    end

    # echo "$prompt_user" (set_color -b ffd52e)(set_color black) "$prompt_path>"(set_color -b normal)(set_color normal) " "
end
