FROM node:20-alpine AS builder
WORKDIR /app

# Install dependencies first for better layer caching
COPY react-frontend/package*.json ./
RUN npm ci

# Build static files
COPY react-frontend/ ./
RUN npm run build

FROM nginx:1.27-alpine

# Vite is configured with outDir=build
COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
