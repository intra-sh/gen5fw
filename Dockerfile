FROM python:3.13-rc-bookworm

RUN apt update && apt install android-sdk-libsparse-utils p7zip-full udisks2 -y

RUN mkdir /app
COPY ./ /app
WORKDIR /app

RUN pip install -r requirements.txt

VOLUME /data

CMD ["/app/docker_entrypoint.sh"]