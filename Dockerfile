FROM debian:jessie-slim

# docker build -t vanessa/pull-request-action .

LABEL "com.github.actions.name"="Pull Request on Branch Push"
LABEL "com.github.actions.description"="Create a pull request when a branch is created or updated"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="yellow"

RUN apt-get update && apt-get install -y jq curl wget git
RUN wget https://github.com/github/hub/releases/download/v2.8.4/hub-linux-amd64-2.8.4.tgz && \
    tar -xzvf hub-linux-amd64-2.8.4.tgz
ENV PATH ${PATH}:/hub-linux-amd64-2.8.4/bin
COPY pull-request.sh /pull-request.sh

RUN chmod u+x /pull-request.sh
ENTRYPOINT ["/pull-request.sh"]
