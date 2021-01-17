ymd () {
    # customize these (FAKER: `npm install -g faker-cli`)
    local FAKER=~/.nvm/versions/node/v10.20.1/bin/faker-cli
    local date_prefix="$(date +%Y.%m.%d)"

    local name
    if (( # == 0 )); then
      name="${1:-$(${FAKER} --lorem slug | tr -d '"')}"
    else
      name="$1"
    fi
    local fn="${date_prefix}-${name}"
    if [ -f "${fn}" ]; then
        echo "Warning: \"${name}\" already exists!"
    fi
    touch "$fn"
    ls -l "$fn"
    vi "$fn"
}

