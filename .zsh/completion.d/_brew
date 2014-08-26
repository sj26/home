#compdef brew
# ------------------------------------------------------------------------------
# Description
# -----------
#
#  Completion script for brew (https://github.com/mxcl/homebrew).
#
#  Source: https://github.com/mxcl/homebrew/blob/master/Library/Contributions/brew_zsh_completion.zsh
#
# ------------------------------------------------------------------------------
# Authors
# -------
#
#  * kulakowski (https://github.com/kulakowski)
#  * Gabe Berke-Williams (https://github.com/gabebw)
#  * James Conroy-Finn (https://github.com/jcf)
#  * Daniel Schauenberg (https://github.com/mrtazz)
#  * Adam Vandenberg (https://github.com/adamv)
#  * Erik Kastner (https://github.com/kastner)
#  * Katsunori Kanda (https://github.com/potix2)
#
# ------------------------------------------------------------------------------
# Completion for Homebrew-Cask added by:
#  * Miles Bradshaw (https://github.com/mbgearhead)
#
# ------------------------------------------------------------------------------


_brew_all_formulae() {
  formulae=(${(f)"$(_call_program formulae brew search 2>/dev/null)"})
}

_brew_installed_formulae() {
  installed_formulae=(${(f)"$(_call_program formulae brew list 2>/dev/null)"})
}

_brew_installed_taps() {
  installed_taps=(${(f)"$(_call_program formulae brew tap 2>/dev/null)"})
}

_brew_outdated_formulae() {
  outdated_formulae=(${(f)"$(_call_program formulae brew outdated 2>/dev/null)"})
}

_brew_all_casks() {
  casks=(${(f)"$(_call_program casks brew cask search 2>/dev/null)"})
}

_brew_installed_casks() {
  installed_casks=(${(f)"$(_call_program casks brew cask list 2>/dev/null)"})
}

local -a _1st_arguments
_1st_arguments=(
  'audit:check formulae for Homebrew coding style violations'
  'cask:install native osx apps'
  'cat:display formula file for a formula'
  'cleanup:uninstall unused and old versions of packages'
  'create:create a new formula'
  'deps:list dependencies and dependants of a formula'
  'doctor:audits your installation for common issues'
  'diy:automatically determine the installation prefix for non-Homebrew software'
  'edit:edit a formula'
  'fetch:download the source packages for the given formulae'
  'home:visit the homepage of a formula or the brew project'
  'info:information about a formula'
  'install:install a formula'
  'link:link a formula'
  'list:list files in a formula or not-installed formulae'
  'log:git commit log for a formula'
  'missing:check all installed formulae for missing dependencies.'
  'options:display install options specific to formula'
  'outdated:list formulae for which a newer version is available'
  'prune:remove dead links'
  'remove:remove a formula'
  'search:search for a formula (/regex/ or string)'
  'server:start a local web app that lets you browse formulae (requires Sinatra)'
  'tap:tap a new formula repository from GitHub, or list existing taps'
  'test:a few formulae provide a test method'
  'unlink:unlink a formula'
  'untap:remove a tapped repository'
  'unpin:unpin specified formulae'
  'update:freshen up links'
  'upgrade:upgrade outdated formulae'
  'uses:show formulae which depend on a formula'
  'versions:list previous versions of formulae'
)

local -a cask _cask_arguments
_cask_arguments=(
  'home:opens the homepage of the cask of the given name'
  'alfred:used to modify Alfreds scope to include the Caskroom'
  'edit:edits the cask of the given name'
  'search:searches all known casks'
  'audit:verifies installability of casks'
  'install:installs the cask of the given name'
  'info:displays information about the cask of the given name'
  'create:creates a cask of the given name and opens it in an editor'
  'checklinks:checks for bad cask links'
  'uninstall:uninstalls the cask of the given name'
  'list:lists installed casks'
)

local _alfred_arguments
_alfred_arguments=(
  'status:reports whether Alfred is linked'
  'link:adds Caskroom to alfred search paths'
  'unlink:removes Caskroom from Alfred search paths'
)

local expl
local -a formulae installed_formulae installed_taps outdated_formulae casks installed_casks

_arguments \
  '(-v)-v[verbose]' \
  '(--cellar)--cellar[brew cellar]' \
  '(--config)--config[brew configuration]' \
  '(--env)--env[brew environment]' \
  '(--repository)--repository[brew repository]' \
  '(--version)--version[version information]' \
  '(--prefix)--prefix[where brew lives on this system]' \
  '(--cache)--cache[brew cache]' \
  '*:: :->subcmds' && return 0

if (( CURRENT == 1 )); then
  _describe -t commands "brew subcommand" _1st_arguments
  return
fi

case "$words[1]" in
  search|-S)
    _arguments \
      '(--macports)--macports[search the macports repository]' \
      '(--fink)--fink[search the fink repository]' \
      '1: :->forms' &&  return 0

      if [[ "$state" == forms ]]; then
        _brew_all_formulae
        _wanted formulae expl 'all formulae' compadd -a formulae
      fi ;;
  list|ls)
    _arguments \
      '(--unbrewed)--unbrewed[files in brew --prefix not controlled by brew]' \
      '(--pinned)--pinned[list all versions of pinned formulae]' \
      '(--versions)--versions[list all installed versions of a formula]' \
      '1: :->forms' &&  return 0

      if [[ "$state" == forms ]]; then
        _brew_installed_formulae
        _wanted installed_formulae expl 'installed formulae' compadd -a installed_formulae
      fi ;;
  install|home|homepage|log|info|abv|uses|cat|deps|edit|options)
    _brew_all_formulae
    _wanted formulae expl 'all formulae' compadd -a formulae ;;
  remove|rm|uninstall|unlink|cleanup|link|ln|pin|unpin|test)
    _brew_installed_formulae
    _wanted installed_formulae expl 'installed formulae' compadd -a installed_formulae ;;
  upgrade)
    _brew_outdated_formulae
    _wanted outdated_formulae expl 'outdated formulae' compadd -a outdated_formulae ;; 
  untap)
    _brew_installed_taps
    _wanted installed_taps expl 'installed taps' compadd -a installed_taps ;;
  cask)
	if (( CURRENT == 2 )); then
	  _describe -t commands "cask subcommand" _cask_arguments
	  return
	fi
	case "$words[2]" in
	  alfred)
	    if (( CURRENT == 3 )); then
          _describe -t commands "alfred subcommand" _alfred_arguments
	      return
	    fi
	    case "$words[3]" in
		  status)
		    ;;
		  link)
		    ;;
		  unlink)
            ;;
	    esac ;;
      audit|checklinks|edit|home|info|install|search)
		_brew_all_casks
		_wanted casks expl 'all casks' compadd -a casks ;;
      list|uninstall)
	    _brew_installed_casks
	    _wanted installed_casks expl 'installed casks' compadd -a installed_casks ;;
	esac
esac

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et

