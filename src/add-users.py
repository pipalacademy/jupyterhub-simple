import sys
import crypt
import os

usersfile = sys.argv[1]

default_shell = "/bin/bash"

if not os.path.exists(usersfile):
    print(usersfile, "No users.txt file found. Ignoring...", file=sys.stderr)
    sys.exit(0)

for line in open(usersfile):
    username, pw = line.strip().split(":", 1)
    cryptpw = crypt.crypt(pw)
    os.system(f"useradd -m -s '{default_shell}' -p '{cryptpw}' {username}")
    os.system("chown -R {0}:{0} /home/{0}".format(username))
    print("Added user", username)
