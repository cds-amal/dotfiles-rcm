# URL encode something and print it.
function url-encode; {
    setopt extendedglob
    echo "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
}

# Search google for the given keywords.
function google; {
    open -a /Applications/Google\ Chrome.app "http://www.google.com/search?q=`url-encode "${(j: :)@}"`"
}

#vi: ft=zsh
