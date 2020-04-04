# My dotfiles

This project is to manage my zsh based environment.

## Dependencies

[rcm dotfile management suite](https://github.com/thoughtbot/rcm)

    brew tap thoughtbot/formulae
    brew install rcm

## The files

**rcm** uses two folders in your HOME directory to manage your dotfiles.
  1. ~/dotfiles/ :- contains the main settings
  2. ~/dotfiles-local/ :- customizable private settings.

**rcm** creates symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` where to get
it's configuration options. [See rcrc doc](https://github.com/thoughtbot/dotfiles/blob/master/rcrc).

    git clone git://github.com/cds-amal/dotfiles.git ~/dotfiles

## Usage

### Bootstrap (first time only!)

    $ env RCRC=$HOME/dotfiles/rcrc rcup

### Synchronize (with github)

As the dotfiles evolve over time, use git and rcp to keep things in sync.

    $ git pull
    $ rcup -f

This command will create symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` to use standard
configuration options:

* Exclude the `README.md` and `LICENSE` files, which are part of
  the `dotfiles` repository but do not need to be symlinked in.
* Give precedence to personal overrides which by default are placed in
  `~/dotfiles-local`


neovim Configurations
---------------------

Coming soon.


What's in it?
-------------

[tmux](http://robots.thoughtbot.com/a-tmux-crash-course)
configuration:

* Improve color resolution.
* Remove administrative debris (session name, hostname, time) in status bar.
* Set prefix to `Ctrl+s`
* Soften status bar color from harsh green to light gray.

[git](http://git-scm.com/) configuration:

* Adds a `create-branch` alias to create feature branches.
* Adds a `delete-branch` alias to delete feature branches.
* Adds a `merge-branch` alias to merge feature branches into master.
* Adds an `up` alias to fetch and rebase `origin/master` into the feature
  branch. Use `git up -i` for interactive rebases.
* Adds `post-{checkout,commit,merge}` hooks to re-index your ctags.
* Adds `pre-commit` and `prepare-commit-msg` stubs that delegate to your local
  config.
* Adds `trust-bin` alias to append a project's `bin/` directory to `$PATH`.

Shell aliases and scripts:

* `replace foo bar **/*.rb` to find and replace within a given list of files.
* `tat` to attach to tmux session named the same as the current directory.
* `v` for `$VISUAL`.

License
-------

[`LICENSE`](/LICENSE)

Thanks thoughtbot!
------------------

![thoughtbot lovers of open source](http://presskit.thoughtbot.com/images/thoughtbot-logo-for-readmes.svg)

Give their [community](https://thoughtbot.com/community?utm_source=github) some love.
