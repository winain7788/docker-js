# Build stage
FROM node:8-alpine as build-stage

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY /gitlab/* /app/

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN mkdir /root/.ssh && \
    chmod 600 id_rsa && \
    cp id_rsa id_rsa.pub known_hosts /root/.ssh
RUN git clone --single-branch your-git-url

WORKDIR /app/your-repository
RUN yarn upgrade 
RUN yarn
RUN yarn run build
RUN yarn run generate

COPY entrypoint.sh /app/
RUN chmod a+x /app/entrypoint.sh
RUN ls -l /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]

