use-truffle-core () {
    alias truffle=~/work/truffle/packages/core/cli.js
}

use-truffle-core-debug () {
    alias truffle=node\ --inspect-brk\ ~/work/truffle/packages/core/cli.js
}

use-truffle-bundle () {
    alias truffle=node\ ~/work/truffle/packages/truffle/build/cli.bundled.js
}

truffle-link () {
  echo "usage: from root folder\n\tyarn-link pkg1 pkg2 pkg3"
  for pkg in "$@";  do
    cd packages/$pkg ; yarn unlink ; yarn link ; cd -
  done
}

truffle-ulink () {
  echo "usage: from root folder\n\tyarn-link pkg1 pkg2 pkg3"
  for pkg in "$@";  do
    cd packages/$pkg ; yarn unlink ; cd -
  done
}
