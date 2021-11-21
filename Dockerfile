FROM node:12-alpine
WORKDIR /GoMyCode
COPY package.json /GoMyCode/
RUN npm install --silent
RUN npm install pm2 -g
COPY . /GoMyCode/
EXPOSE 3000
CMD ["pm2", "start", "npm", "--name", "DockerRunContainer", "--", "start"]
