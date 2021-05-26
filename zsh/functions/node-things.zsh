function zap-node-modules () {
  if [ -z "$1" ]; then
    maxdepth=2
  else
    maxdepth=$1
  fi

  echo find . -type d -maxdepth "$maxdepth" -name 'node_modules' 
}
