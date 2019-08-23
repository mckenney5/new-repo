new-repo script
================
_./new-repo.sh <repo-name>_

This script creates a new repo on a git server.
You may need to change the variables in the script to reflect how your server is set up.

### Default Variables That You Should Change
`GIT_DIR`     Points to where the server keeps the repos

`GIT_USER`    The username of the git server (_normally_ its just git)

`GIT_GROUP`   The group that the git server belongs to (_normally_ its the same as the user name)

`GIT_END`     The ending of the repo, this is appended to the name (ex foo**.git**)

### Optional Variables That You Should Change
This section is to make adding a remote repo easier by formatting a command that a user
can copy and paste into the client

`GIT_REMOTE_NAME`  The default name that is used in `git remote add <name>`

`GIT_REMOTE_PORT`  The port that your git server runs on (assumes ssh)

### Notes
- All source code in this repository is public domain (see LICENSE)
- I use this repo for my own server, thats why the variables are so specific
- I doubt I will be accepting pull/merge requests for this repo

