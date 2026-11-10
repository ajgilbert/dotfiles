#!/usr/bin/env bash
# Generate bash completions for pixi-installed tools into the user completion
# directory, where bash-completion loads them on demand. Re-run after upgrades.
set -u
dir="${XDG_DATA_HOME:-$HOME/.local/share}/bash-completion/completions"
mkdir -p "$dir"

gen() {  # gen <tool> <args...>
  local tool=$1; shift
  if command -v "$tool" >/dev/null 2>&1; then
    "$tool" "$@" > "$dir/$tool" && echo "wrote $dir/$tool"
  else
    echo "skipping $tool (not found)" >&2
  fi
}

gen gh completion -s bash
gen pixi completion --shell bash
gen starship completions bash
gen delta --generate-completion bash
