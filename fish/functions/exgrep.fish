function exgrep --wraps=grep
    grep $argv --exclude-dir={node_modules,dist,__pycache__,test\*,.git\*} --exclude={package-lock.json, .git\*,\*ignore,\*.md,\*.rst,\*.jpg,\*.jpeg,\*.png,\*.gif,\*.svg}
end
