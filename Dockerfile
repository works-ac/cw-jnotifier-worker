FROM node:20-alpine

ARG PORT=3031

WORKDIR /apps
COPY package.json .
COPY package-lock.json .
COPY tsconfig.json .

RUN npm ci

COPY . .

RUN npm run build
RUN rm -rf src tsconfig.json sonar-project.properties .gitignore README.md CHANGELOG.md

EXPOSE ${PORT}
CMD [ "npm","start" ]