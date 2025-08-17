set -g fish_greeting

fish_add_path /opt/homebrew/bin
fish_add_path (go env GOPATH)/bin
fish_add_path ~/bin
fish_add_path ~/.local/bin

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

set -eg FZF_DEFAULT_OPTS
set -eU FZF_DEFAULT_OPTS
# set -Ux FZF_DEFAULT_OPTS "\
# --color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
# --color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
# --color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
# --color=selected-bg:#494D64 \
# --color=border:#6E738D,label:#CAD3F5"
set -Ux FZF_DEFAULT_OPTS "\
--color=bg:-1,bg+:0,fg:15,fg+:15 \
--color=hl:4,hl+:1,info:13,prompt:13,spinner:5,marker:4,pointer:3,header:1 \
--color=border:8,label:15,selected-bg:8 \
--border=rounded"
