echo "fetching rust-tests..."
[ ! -d "$HOME/rust-tests" ] && git clone https://github.com/01-edu/rust-tests.git "$HOME/rust-tests" >/dev/null 2>&1

rm -rf "$HOME/rust-tests"
git clone https://github.com/01-edu/rust-tests.git "$HOME/rust-tests" >/dev/null 2>&1

rm -rf "$HOME/rust-tests/solutions"
ln -fns "$HOME/piscine-rust" "$HOME/rust-tests/solutions" #force removal of existing 'solutions' directory, n: ensures it replaces the link without touching the target directory.

#no duplicate aliases
grep -qxF 'alias t="bash $HOME/rust-tests/tests/test_exercises.sh -v"' $HOME/.shell_common || echo 'alias t="bash $HOME/rust-tests/tests/test_exercises.sh -v"' >> $HOME/.shell_common

# echo "installing rustrover..."
# wget -q -O $HOME/rustrover.tar.gz https://download-cdn.jetbrains.com/rustrover/RustRover-2025.1.5.tar.gz
# mkdir -p $HOME/rustrover
# tar -xzf $HOME/rustrover.tar.gz -C $HOME/rustrover --strip-components=1 >/dev/null 2>&1 #remove the top-level folder so 'bin' directly inside 'rustrover'

# grep -qxF 'alias rr="nohup $HOME/rustrover/bin/rustrover.sh > /dev/null 2>&1 & disown"' $HOME/.shell_common || echo 'alias rr="nohup $HOME/rustrover/bin/rustrover.sh > /dev/null 2>&1 & disown"' >> $HOME/.shell_common
echo "Done!"