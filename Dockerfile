# Stage 1: Build the React app
FROM node:20-alpine AS builder

WORKDIR /app

# Copy dependency files first for caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project (includes tsconfig.json, src/, public/, etc.)
COPY . .

# Build the React app
RUN npm run build


# # Stage 2: Production image using Nginx
# FROM nginx:alpine

# # Copy build output from builder
# COPY --from=builder /app/dist /usr/share/nginx/html

# # (Optional) Copy custom nginx config if you want SPA routing support
# # COPY nginx.conf /etc/nginx/conf.d/default.conf

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]
