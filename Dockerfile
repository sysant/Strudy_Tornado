FROM registry.cn-hangzhou.aliyuncs.com/san2005/public:python_3.8-alpine
WORKDIR ShuangSeQiu
ADD . .
RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/;pip3 install --no-cache-dir  -r requirements.txt
EXPOSE 10800
COPY ./ShuangSeQiu/qiu.py /ShuangSeQiu
COPY ./ShuangSeQiu/templates /ShuangSeQiu/templates
COPY ./ShuangSeQiu/static /ShuangSeQiu/static
COPY ./ShuangSeQiu/log /ShuangSeQiu/log

#CMD ["python", "./qiu.py"]
ENTRYPOINT ["python", "qiu.py"
