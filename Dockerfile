FROM python:3.6.8
WORKDIR ShuangSeQiu
ADD . .
RUN pip3 install --no-cache-dir  -r requirements.txt
EXPOSE 10800
COPY ./ShuangSeQiu/qiu.py /ShuangSeQiu
COPY ./ShuangSeQiu/templates /ShuangSeQiu/templates
COPY ./ShuangSeQiu/static /ShuangSeQiu/static
COPY ./ShuangSeQiu/log /ShuangSeQiu/log

#CMD ["python", "./qiu.py"]
ENTRYPOINT ["python", "qiu.py"]
