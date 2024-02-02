# docker/Dockerfile
# Dockerfile for building the Docker image for the SkyCast Weather Website

# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

# Expose the port the app will run on
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]
