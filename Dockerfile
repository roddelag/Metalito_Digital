# Stage 1: Building the code
FROM node:20 AS builder

WORKDIR /app

# Copy package.json and package-lock.json/yarn.lock files
COPY package*.json yarn.lock* ./

# Install dependencies
RUN npm install --frozen-lockfile

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .


RUN npm ci

# Build the Next.js app
RUN npm run build

# Stage 2: Run the built app
FROM node:20

WORKDIR /app

# Copy the necessary files from the builder stage
COPY --from=builder /app/next.config.mjs ./
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules

# Expose the port the app runs on
EXPOSE 3000

# Run the app
CMD ["npm", "start"]
