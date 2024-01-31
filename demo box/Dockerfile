# multi stage build

FROM ubuntu as buid

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_21.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
RUN apt-get install typescript

WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install
RUN tsc -p .  #build


# stage 2

FROM node as runner

WORKDIR /app

copy --from=build app/ .

ENTRYPOINT [ "node", 'index.js' ]


