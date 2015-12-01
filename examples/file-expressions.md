# File Expressions Reference

Expressions that are used to evaluate the status of files

| Expression | is true if... |
|---------------------------------------:| ------------------------------------------|
| file1 -ef file2 | file1 and file 2 have the same inode numbers(they refer to the same file by hard linking |
|---------------------------------------:| ------------------------------------------|
| file1 -nt file2 | file1 is newer than file2 |
|---------------------------------------:| ------------------------------------------|
| file1 -out file2 | file1 is older than file2 |
|---------------------------------------:| ------------------------------------------|
| -b file                                | file exists and is a block-special (device) file
|---------------------------------------:| ------------------------------------------|
| -c file                                | file exists and is a character-special (device) file
|---------------------------------------:| ------------------------------------------|
| -d | is a directory
|---------------------------------------:| ------------------------------------------|
| -e | file exists |
|---------------------------------------:| ------------------------------------------|
| -f | file exists and is a regular file.
|---------------------------------------:| ------------------------------------------|
| -g                                    :| file exists and is set-group-ID
|---------------------------------------:| ------------------------------------------|
| -G                                    :| file exists and is owned by the effective group-ID
|---------------------------------------:| ------------------------------------------|
| -k file                               :| file exists and has its "sticky bit" set.
|---------------------------------------:| ------------------------------------------|
| -L file                               :| file exists and is a symbolic link.
|---------------------------------------:| ------------------------------------------|
| -o file                               :| file exists and is owned by the effectiv user ID.
|---------------------------------------:| ------------------------------------------|
| -p file                               :| file exists and is a named pipe.
|---------------------------------------:| ------------------------------------------|
| -r file                               :| file exists and is readable (has readable permission for the effective user).
|---------------------------------------:| ------------------------------------------|
| -s file                               :| file exists and has a length greater than zero.
|---------------------------------------:| ------------------------------------------|
| -S file                               :| file exists and is a network socket.
|---------------------------------------:| ------------------------------------------|
| -t fd                                 :| fd is a file descriptor directed to/from the terminal. This can be used to determine whether standard input/output/error is being redirected.
|---------------------------------------:| ------------------------------------------|
| -u file                               :| file exists and is setuid
|---------------------------------------:| ------------------------------------------|
| -w file                               :| file exists and is writable (has write permission for the effective user).
|---------------------------------------:| ------------------------------------------|
| -x file                               :| file exists and is executable (for the effective user).
