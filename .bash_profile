# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file
