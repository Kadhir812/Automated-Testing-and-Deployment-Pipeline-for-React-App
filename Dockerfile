# Use the official Node.js LTS image
FROM node:20.11.0

# Set the working directory inside the container
WORKDIR /app

# Copy only package.json and package-lock.json first to leverage Docker layer caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port used by Vite dev server
EXPOSE 5173

# Set the default command to run the development server
CMD ["npm", "run", "dev"]
