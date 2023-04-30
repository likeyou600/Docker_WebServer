# webserver set up
--------------------
## Step
1. clone build web api to app folder

2. docker-compose -f docker-compose.yml up --build
or
2. docker-compose -f docker-compose.yml up -d

3. edit certbot email domain

4. wslconfig setting memory
[wsl2]
memory=4GB

--------------------
ARG CACHEBUST=1
RUN ls -l 
