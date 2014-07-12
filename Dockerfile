FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y nodejs npm nodejs-legacy

RUN npm updage -g npm
RUN npm install -g grunt-cli

ADD . /git-workshop

WORKDIR /git-workshop/slides
RUN npm install

EXPOSE 8000

#ENTRYPOINT ["grunt", "serve"]
CMD ["grunt", "serve"]

