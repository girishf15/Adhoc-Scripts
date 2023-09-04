# this script can be used when to execute any scripts/commands on remote server using ssh

"""
Installation Process
pip install parallel-ssh
"""

from pssh.clients import ParallelSSHClient
from pssh.config import HostConfig

hosts = ['192.xx.xx.xx', '192.xx.xx.xx']

host_config = [
    HostConfig(port=22, user='root',
               password='Giri@#'),
    HostConfig(port=22, user='root',
               password='Giri@#')
]
client = ParallelSSHClient(hosts, host_config=host_config)

output = client.run_command("uname")
for host_output in output:
    for line in host_output.stdout:
        print(line)
    exit_code = host_output.exit_code
