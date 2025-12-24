# Stage 1: Build the Next.js standalone app
FROM oven/bun:latest AS frontend-builder

WORKDIR /app

# Copy package files and lock file first (for better caching)
COPY package*.json bun.lock ./
RUN bun install --frozen-lockfile

# Copy all frontend files
COPY . .

# Build argument for Clerk public key
ARG NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY
ENV NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=$NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY

# Note: Docker may warn about "secrets in ARG/ENV" - this is OK!
# The NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY is meant to be public (it starts with pk_)
# It's safe to include in the build as it's designed for client-side use

# Build the Next.js app (creates '.next/standalone' directory)
RUN bun run build

# Stage 2: Create the final container with both Next.js and Python
FROM python:3.12-slim

WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the FastAPI server
COPY api/server.py .

# Copy the Next.js standalone from builder stage
COPY --from=frontend-builder /app/.next/standalone ./nextjs

# Create a startup script to run both servers
RUN echo '#!/bin/sh\nnode nextjs/server.js &\nuvicorn server:app --host 0.0.0.0 --port 8000' > start.sh && chmod +x start.sh

# Expose ports for Next.js (3000) and FastAPI (8000)
EXPOSE 3000 8000

# Start both servers
CMD ["./start.sh"]