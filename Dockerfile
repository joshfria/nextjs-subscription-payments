FROM node:18-alpine
ENV NEXT_TELEMETRY_DISABLED=1
WORKDIR /app

# Copy package files and install dependencies
COPY package.json ./
RUN npm install

# Copy application code
COPY . .

# Build the application
RUN npm run build

# Set production environment
ENV NODE_ENV=production
ENV PORT=3000


EXPOSE 3000

# Start the application
CMD ["npm", "start"]
