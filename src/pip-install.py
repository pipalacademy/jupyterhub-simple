import sys
import os

requirements_file = sys.argv[1]

if not os.path.exists(requirements_file):
    print(requirements_file, f"requirements.txt {requirements_file} not found, exiting...", file=sys.stderr)
    sys.exit(0)

os.system(f"python3 -m pip install --upgrade -r {requirements_file}")
