set -g fish_greeting

fish_add_path /opt/homebrew/bin
fish_add_path (go env GOPATH)/bin
fish_add_path ~/bin
fish_add_path ~/.local/bin
fish_add_path $HOME/.cargo/bin

# Editor
set -Ux EDITOR nvim
alias vi="nvim"

# pnpm
set -Ux PNPM_HOME "$HOME/Library/pnpm"
fish_add_path $PNPM_HOME

# output from: fnm env --use-on-cd
set -gx PATH "/Users/lschouten/.local/state/fnm_multishells/80240_1754761133813/bin" $PATH;
set -gx FNM_MULTISHELL_PATH "/Users/lschouten/.local/state/fnm_multishells/80240_1754761133813";
set -gx FNM_VERSION_FILE_STRATEGY "local";
set -gx FNM_DIR "/Users/lschouten/.local/share/fnm";
set -gx FNM_LOGLEVEL "info";
set -gx FNM_NODE_DIST_MIRROR "https://nodejs.org/dist";
set -gx FNM_COREPACK_ENABLED "false";
set -gx FNM_RESOLVE_ENGINES "true";
set -gx FNM_ARCH "arm64";
function _fnm_autoload_hook --on-variable PWD --description 'Change Node version on directory change'
    status --is-command-substitution; and return
    if test -f .node-version -o -f .nvmrc -o -f package.json
    fnm use --silent-if-unchanged
end

end

_fnm_autoload_hook
