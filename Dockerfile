FROM ubuntu

MAINTAINER dave_zing

RUN apt-get update
RUN apt upgrade
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN pip install Flask 

RUN apt-get update && apt-get install -y git


ENV FLASK_APP=flaskr
ENV FLASK_ENV=development
RUN mkdir /home/src

RUN mkdir /home/src/app
WORKDIR /home/src/app


RUN git clone https://github.com/lidorg-dev/nitzanim-ex.git /home/src/app

EXPOSE 5000

RUN cd /home/src/app && pip install --editable . && flask init-db  

CMD [ "flask", "run","--host","0.0.0.0","--port","5000"]

