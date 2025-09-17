# Use the official n8n image as the base
#FROM docker.io/n8nio/n8n:1.107.4-arm64
FROM docker.io/n8nio/n8n:1.111.0-arm64

WORKDIR /home/node

COPY --chown=node:node ./workflows ./workflows
COPY --chown=node:node ./credentials ./credentials

RUN n8n import:credentials --input=./credentials/credentials.json
RUN n8n import:workflow --input=./workflows/financial-news-summary.json
