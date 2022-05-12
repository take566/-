
echo %date%
echo %time%

SET yyyy=%date:~0,4%
SET mm=%date:~5,2%
SET dd=%date:~8,2%

SET time2=%time: =0%

SET hh=%time2:~0,2%
SET mn=%time2:~3,2%
SET ss=%time2:~6,2%

SET filename=%yyyy%-%mm%%dd%-%hh%%mn%%ss%
SET LOG=C:\work\log\k8_gitlab_%filename%.txt
cd C:\work\kubernetes\gitlab

minikube config set memory 8192  >> %LOG%
minikube config set cpus 4  >> %LOG%
minikube start  >> %LOG%
minikube ip  >> %LOG%

minikube addons enable ingress  >> %LOG%

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl  >> %LOG%
chmod +x kubectl  >> %LOG%
sudo mv kubectl /usr/local/bin/  >> %LOG%
kubectl get nodes  >> %LOG%
