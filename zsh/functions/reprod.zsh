reprod () {
    # customize these (FAKER: `npm install -g faker-cli`)
    local ROOT=~/work/reproduce
    local FAKER=~/.nvm/versions/node/v10.20.1/bin/faker-cli
    local year="$(date +%Y)"
    local month="$(date +%m)"
    local day="$(date +%d)"

    local parent="${ROOT}/${year}/${month}/${day}"

    local name="${1:-$(${FAKER} --lorem slug | tr -d '"')}"

    local dir="${parent}/${name}"
    if [ -d "${dir}" ]; then
        echo "Warning: directory exists for today with name \"${name}\""
    fi

    mkdir -p $dir
    cd $dir
}
