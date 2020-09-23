FROM docker:latest

RUN apk update
RUN apk add curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod u+x kubectl && mv kubectl /bin/kubectl
RUN apk update \
 && apk add jq \
&& rm -rf /var/cache/apk/*
COPY operator.sh /usr/local/bin/operator.sh
RUN chmod 755  /usr/local/bin/operator.sh
CMD ["/usr/local/bin/operator.sh"]
