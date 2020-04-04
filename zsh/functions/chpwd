# when current working directory changes
function chpwd {
    # show dir contents
    ls

    # activate if cwd is a python virtual env
    if [[ -f ./bin/activate ]] ; then
        source ./bin/activate
    fi

    # activate .nvmrc environment
    if [[ -f .nvmrc ]] ; then
    	nvm use
    fi
}

#vi: ft=zsh
