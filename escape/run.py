#!/usr/bin/python3 -u
import os
import pty
import tempfile

print("Creating new mainframe session...")
with tempfile.TemporaryDirectory() as tmpdir:
    os.chown(tmpdir, uid=1234, gid=-1)
    print("Remember to use the exit command to see your results.")
    pty.spawn([
        "docker", "run",
        "--rm",
        "--user", "guest",
        "-it",
        "-v" "{}:/home/guest".format(tmpdir),
        "escape",
        "/bin/bash",
    ])
    print("Contents of your home directory:")
    for filename in os.listdir(tmpdir):
        with open(os.path.join(tmpdir, filename)) as f:
            print("{}:\n{}".format(filename, f.read()))
