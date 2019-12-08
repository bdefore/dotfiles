# http://blog.macromates.com/2008/working-with-history-in-bash/
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=1000000
shopt -s histappend

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done
