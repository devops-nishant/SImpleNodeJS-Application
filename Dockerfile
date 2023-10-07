# Step 1: Use an official Node.js base image with a specific version as your starting point.
# This image provides the Node.js runtime and npm package manager.
FROM node:14-alpine

# Step 2: Set the working directory inside the container.
# This is where your application code will be placed.
WORKDIR /app


# Step 3: Copy package.json and package-lock.json (if available) to the working directory.
# This allows us to install application dependencies separately from the code.
COPY package*.json ./

# Step 4: Install application dependencies.
# This step ensures that all required Node.js packages are installed inside the container.
RUN npm install


# Step 5: Copy the rest of your application files to the working directory.
# This includes your source code, configuration files, and assets.
COPY . .

# Step 6: Expose the port your Node.js application will listen on.
EXPOSE 3000

# Step 7: Define the command to start your Node.js application.
CMD ["npm", "run", "start"]