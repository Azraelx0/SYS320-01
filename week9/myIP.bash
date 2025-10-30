# Super simple script to retrieve IP address of host machine
#!/bin/bash
ip addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v 127.0.0.1 | head -n1

