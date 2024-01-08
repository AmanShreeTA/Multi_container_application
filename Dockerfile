FROM node:slim

WORKDIR /app

COPY node/package.json .

RUN npm install

COPY node .

EXPOSE 3000

CMD ["node", "Myserver.js"]

