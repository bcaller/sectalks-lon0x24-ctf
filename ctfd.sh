sudo yum install -y git
git clone --depth 1 https://github.com/CTFd/CTFd.git
cd CTFd
virtualenv .env
. .env/bin/activate
pip install docker-compose
sed -e 's/8000:8000/44030:8000/' -i docker-compose.yml
docker-compose up -d
