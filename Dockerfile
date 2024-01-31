FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_21.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

# type 1 solution

RUN mkdir mynodeapp
RUN cd mynodeapp

# COPY package.json package.json
# COPY package-lock.json package-lock.json

COPY . /mynodeapp/

RUN cd mynodeapp && npm install

COPY index.js index.js

ENTRYPOINT [ "node", "mynodeapp/index.js" ]

# type 2 solution : all the commands written below the workdir are executed in specified working directory

# WORKDIR /mynodeapp

# RUN npm install

# COPY index.js index.js

# ENTRYPOINT [ "node", "index.js" ]