#!/usr/bin/env python3

import pexpect
from flask import Flask

api = Flask(__name__)
s = 0

@api.route('/start/')
def start_log():
    global s
    s = pexpect.spawn('telnet 100.110.0.109 51001')
    s.sendline('')
    s.expect('ogin:')
    s.sendline('admin')
    s.expect('assword:')
    s.sendline('password')    
    return 'start telnet, stop logging...\n'

@api.route('/stop/')
def stop_log():   
    global s
    s.sendcontrol(']')
    s.expect('>')
    s.sendline('quit')
    s.close()
    del s
    return "stop telnet, start logging...\n"

if __name__ == "__main__":
    api.run(debug=True,  host="0.0.0.0")