# webserver set up
--------------------
## Docker環境
```shell
1. https://adersaytech.com/tutorial/kb-article/enable-hyper-v-on-windows-home.html
2. 開啟或關閉 Windows 功能 -> Hyper-V打勾

3. 下載Docker Desktop
    https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module

4. Docker Desktop setting->General->取消勾選Use the WSL 2 based engine

5. 設定環境配置CPU,memory
```
--------------------
## Step
```shell
1. clone web、api to app folder, then build web and install api

2. change all code.bakerychu.com to your domain
   
3. 第一次 : docker-compose -f docker-compose.yml up --build   #4mins
   以後   : docker-compose -f docker-compose.yml up -d

4. edit apache-config

5. 獲取憑證
    certbot certonly --webroot -w /var/www -d your_domain
    測試用
    certbot certonly --webroot -w /var/www -d coding.cs.pu.edu.tw --dry-run
    http://coding.cs.pu.edu.tw/.well-known/acme-challenge/GcpqL2lS1WVPiNmuSKsbKqphre74Zav5lZx8Mb1aW1Q 
    ![image](https://user-images.githubusercontent.com/58775534/236414891-6c697141-045a-448d-8533-b503c11975cd.png)

6. enjoy
```
--------------------

## Dockerfile常用指令
```shell
1.當cached時
ARG CACHEBUST=1
RUN ls -l 
--------------------
## 指令
1. 進入Container bash
docker exec -ti docker_webserver-web-1 bash
docker exec -ti docker_webserver-db-1 bash

2. clear cache
   docker image prune
```
