# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        if [ ${config:e} = "zsh" ] ; then
            . $config
        fi
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [[ -f $config && ${config:e} = "zsh" ]]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        if [ ${config:e} = "zsh" ] ; then
            . $config
        fi
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# zplugs
source ~/.zplug/init.zsh
zplug "agkozak/zsh-z"
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/vi-mode",   from:oh-my-zsh
# zplug "plugins/themes",   from:oh-my-zsh
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load


# trigger a ch dir so it can read environment files
# for python (./bin/activate) and node (.zshrc) environments
cd .

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/marcus/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
nvm use default

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/cds/work/ganache/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/cds/work/ganache/node_modules/tabtab/.completions/electron-forge.zsh

#cargo related
# /Users/cds/.cargo/bin
# Add cargo-installed binaries to the path
export CARGO_HOME="$HOME/.cargo"
export PATH="$PATH:$CARGO_HOME/bin"

# use bat for man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# pg notes
echo pg_ctl -D /usr/local/var/postgres start


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
