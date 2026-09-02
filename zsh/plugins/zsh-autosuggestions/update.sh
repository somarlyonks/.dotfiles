#!/bin/sh

set -eu

repo_url="https://github.com/zsh-users/zsh-autosuggestions"
archive_url="$repo_url/archive/refs/heads/master.tar.gz"
plugin_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
work_dir=$(mktemp -d "${plugin_dir}.update.XXXXXX")
replacement_dir="$work_dir/plugin"
source_dir="$work_dir/source"
archive="$work_dir/zsh-autosuggestions.tar.gz"
backup_dir="${plugin_dir}.backup.$$"

cleanup() {
    status=$?
    trap - 0 HUP INT TERM

    rm -rf "$work_dir"

    if [ -d "$backup_dir" ]; then
        if [ ! -e "$plugin_dir" ]; then
            mv "$backup_dir" "$plugin_dir"
        else
            rm -rf "$backup_dir"
        fi
    fi

    exit "$status"
}

trap cleanup 0
trap 'exit 1' HUP INT TERM

command -v curl >/dev/null 2>&1 || {
    echo "error: curl is required" >&2
    exit 1
}

command -v tar >/dev/null 2>&1 || {
    echo "error: tar is required" >&2
    exit 1
}

if [ -e "$backup_dir" ]; then
    echo "error: temporary backup already exists: $backup_dir" >&2
    exit 1
fi

echo "Downloading zsh-autosuggestions from $repo_url..."
curl --fail --location --silent --show-error --retry 3 \
    --output "$archive" "$archive_url"

mkdir "$source_dir"
tar -xzf "$archive" -C "$source_dir" --strip-components=1

for path in src zsh-autosuggestions.plugin.zsh zsh-autosuggestions.zsh; do
    if [ ! -e "$source_dir/$path" ]; then
        echo "error: downloaded archive is missing $path" >&2
        exit 1
    fi
done

# Build the complete replacement before changing the installed plugin. Copying
# the current directory first preserves this updater and any local extra files.
cp -R "$plugin_dir" "$replacement_dir"
rm -rf "$replacement_dir/src"
cp -R "$source_dir/src" "$replacement_dir/src"
cp "$source_dir/zsh-autosuggestions.plugin.zsh" \
    "$source_dir/zsh-autosuggestions.zsh" "$replacement_dir/"

mv "$plugin_dir" "$backup_dir"
mv "$replacement_dir" "$plugin_dir"
rm -rf "$backup_dir"

echo "zsh-autosuggestions updated successfully."

exit 0
