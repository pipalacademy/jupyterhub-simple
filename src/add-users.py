import sys
import crypt
import os

usersfile = sys.argv[1]

if not os.path.exists(usersfile):
    print(usersfile, "not found, existing...", file=sys.stderr)
    sys.exit(0)

for line in open(usersfile):
    username, pw = line.strip().split(":", 1)
    cryptpw = crypt.crypt(pw)
    os.system("useradd -m -p '{}' {}".format(cryptpw, username))
    os.system("chown -R {0}:{0} /home/{0}".format(username))
    print("Added user", username)
