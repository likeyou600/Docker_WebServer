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
vue:
src/main.js
src/router/index.js
vue.config.js

3. 第一次 : docker-compose -f docker-compose.yml up --build   #4mins
   以後   : docker-compose -f docker-compose.yml up -d
   新版 docker compose 沒有-

4. edit apache-config

5. 獲取憑證(利用certboy)
    根據不同網域商 修改credentials.ini
    chmod 600

    google domain
    使用https://github.com/aaomidi/certbot-dns-google-domains 
    certbot certonly --authenticator 'dns-google-domains' --dns-google-domains-credentials '/var/www/credentials.ini' --server 'https://acme-v02.api.letsencrypt.org/directory' --dns-google-domains-zone 'bakerychu.com' -d 'bakerychu.com' -d '*.bakerychu.com' --register-        unsafely-without-email

    godaddy 此處取得key https://developer.godaddy.com/keys
    使用https://github.com/miigotu/certbot-dns-godaddy
    certbot certonly --authenticator dns-godaddy --dns-godaddy-credentials '/var/www/credentials.ini' \
    --server 'https://acme-v02.api.letsencrypt.org/directory' \
    -d 'XXX.com' --register-unsafely-without-email
    並放入crontab 此指令 :  certbot renew --quiet

    測試用
    certbot certonly --webroot -w /var/www -d coding.cs.pu.edu.tw --dry-run
    http://coding.cs.pu.edu.tw/.well-known/acme-challenge/GcpqL2lS1WVPiNmuSKsbKqphre74Zav5lZx8Mb1aW1Q 
    ![image](https://user-images.githubusercontent.com/58775534/236414891-6c697141-045a-448d-8533-b503c11975cd.png)

    若需要刪除舊有的
    certbot delete --cert-name XXX

5. 獲取憑證(遠振)
    先在docker web server 生成key csr 或者透過遠振官網產生csr與key
    openssl genpkey -algorithm RSA -out /var/www/key/private-key.key
    openssl req -new -key /var/www/key/private-key.key -out /var/www/key/new-csr-file.csr

    把csr貼上遠振網站 獲得憑證
    X.509 Certificate
    Intermediate Certificate
    Root Certificate

    SSLCertificateFile : 三個合成fullchain.pem
    SSLCertificateKeyFile : server產生key

6. 
設定linux環境下 定期備份docker mariadb資料
crontab -e

0 6 * * * sh /home/Docker_WebServer/backup_db.sh

sudo service cron reload
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
   docker system prune -a
```
