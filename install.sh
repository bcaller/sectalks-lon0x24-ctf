#!/usr/bin/env bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user

# aws s3 cp s3://bc-ctf/ctf.zip ctf.zip
# unzip ctf.zip

(
cd http-status-code;
STATUS_CODE_FLAG="flag{d0wn_tH3_r4bb1t_wH0l3}" ./run-docker.sh 44020
)

(
cd padding-oracle;
ORACLE_KEY="2J2HYJzwNB2HbVc6jS4q2Cm2" ORACLE_FLAG="flag{innuendo_denominator_unmasked}" ./run-docker.sh 44021
)

(
cd redos;
REDOS_FLAG="flag{stilted_hitchhik3r_yells}" REGEX_ID=0 MAXCHARS=300 ./run-docker.sh 44022
REDOS_FLAG="flag{div1ded_bloods_z1ng}" REGEX_ID=1 MAXCHARS=4321 ./run-docker.sh 44023
)

rm ctf.zip