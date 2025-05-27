#vim .bashrc
#export PATH=$PATH:/usr/local/bin/
#source .bashrc


curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.25.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kops

export KOPS_STATE_STORE=s3://vishnu.dxc.k8s
kops create cluster --name rahams.k8s.local --zones us-east-1a --master-count=1 --master-size t3.medium --master-volume-size 30 --node-count=3 --node-size t3.micro --node-volume-size 30
kops update cluster --name rahams.k8s.local --yes --admin
