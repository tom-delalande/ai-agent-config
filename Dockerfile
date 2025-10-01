FROM ubuntu:25.10

RUN apt update
RUN apt upgrade -y
RUN apt install -y \
    curl \
    git \
    nodejs \
    npm \
    bash

RUN npm install -g @openai/codex
RUN npm install -g @github/copilot

WORKDIR /dev

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["sleep infinity"]
