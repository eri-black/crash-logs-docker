#!/usr/bin/env python3

import pexpect
import sys
import shutil

log_name = sys.argv[1]
ip = sys.argv[2]
port = sys.argv[3]

shutil.copyfile(f'/opt/logs/{log_name}', f'/opt/logs/{log_name}_old')

s = pexpect.spawn(f'telnet {ip} {port}', timeout=None)
s.logfile = open(f'/opt/logs/{log_name}', 'ab')
s.expect('ogin:')
s.sendline('admin')
s.expect('assword:')
s.sendline('password')

#s.logfile.close()