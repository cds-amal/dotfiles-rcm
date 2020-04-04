
# Search google for the given keywords.
function explain; {
    open -a /Applications/Google\ Chrome.app "http://explainshell.com/explain?cmd=`urlencode "${(j: :)@}"`"
}

#vi: ft=zsh
