一. 说明
学习tonado结合前端渲染;
后端处理生成指定双色球注数;
前端展示生成的双色球;
添加对静态页的渲染
本地机器需要python 3.6.8 +

二.docker部署运行
pip install -r requirements.txt

docker build -t qiu .
mkdir -pv /tmp/qiu
docker run -d -p 10800:10800 -v /tmp/qiu/:/ShuangSeQiu/log/ qiu

三. 本地部署运行
cd Strudy_Tornado/ShuangSeQiu 
./start.sh start

四. k8s部署
已经完成了镜像构建和存储到自己的镜像仓库(如:阿里) 再执行
cd k8s_deployment
sh creat_ali_secret.sh
kubect apply -f *.yaml

访问端口号IP(node ip ):10800
