#  Every instruction in this docker file is considered its own 'step' or 'layer' in the final image.
FROM node:14

WORKDIR /app
# In docker we want to install our dependencies first, so that we can cache the dependencies and not have to reinstall them every time we make a change to our code.
# The first arugument is the file we want to copy and the second argument is the location in the container we want to copy it. which is the current working directory.
COPY package*.json ./

RUN npm install

# copy local files to the local working directory
COPY . .

ENV PORT=8080

EXPOSE 8080

# EXEC form
CMD ["npm", "start"]