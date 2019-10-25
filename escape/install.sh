route add -host 169.254.169.254 reject
echo "${ESCAPE_FLAG:-flag{c0ntainers_AR3nt_VMs\}}" > /flag.txt
yum -y update
yum -y install xinetd docker python36
cp xinetd.conf /etc/xinetd.d/escape
cp run.py /run.py
chmod +x /run.py
service docker start
docker build -t escape -f Dockerfile.escape .
service xinetd start
