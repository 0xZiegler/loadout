#manual wipe out
history -c                     # clear in-RAM history list
shred -u ~/.bash_history 2>/dev/null   # overwrite + unlink on disk
shred -u ~/.zsh_history 2>/dev/null    # (if you use zsh)
shred -u ~/.local/share/fish/fish_history 2>/dev/null
cat /dev/null > ~/.lesshst 2>/dev/null # pager history
history -c

#wipe firefox
profile=$(ls -d ~/.mozilla/firefox/*.default* | head -1)

# erase the main history & downloads DB
shred -u "$profile/places.sqlite" "$profile/places.sqlite-wal" "$profile/places.sqlite-shm"

# session & closed-tab snapshots
rm -rf "$profile/sessionstore-backups"

# cached favicons & other minor DBs
shred -u "$profile/favicons.sqlite" 2>/dev/null

# clear form data & recent logins (optional)
shred -u "$profile/formhistory.sqlite" "$profile/logins.json" 2>/dev/null

privacy_check() {
  echo "TracerPid -> $(grep TracerPid /proc/$$/status | awk '{print $2}')"
  echo "auditd     -> $(pgrep -x auditd >/dev/null && echo running || echo none)"
  echo "tlog/snoop -> $(pgrep -f -c 'tlog|snoopy') process(es)"
  echo "ptrace_scope -> $(cat /proc/sys/kernel/yama/ptrace_scope)"
}
