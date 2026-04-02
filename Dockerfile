# Use lightweight Node image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json
COPY package.json ./

# Install server dependencies (ws only)
# Use npm install to reduce dependency on pnpm, or install required libs directly
RUN npm install ws --silent

# Copy server code
COPY server/ ./server/

# Expose relay port
EXPOSE 8080

# Set default port environment variable
ENV PORT=8080

# Start relay server
CMD ["node", "server/index.js"]
