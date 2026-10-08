FROM node:22-bookworm-slim

# Install essential tools for the AI agent (git, curl, ripgrep)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ripgrep \
    && rm -rf /var/lib/apt/lists/*

# Install OpenCode globally
RUN npm install -g opencode-ai

# Set the working directory
WORKDIR /workspace

# OpenCode listens on 4096 by default; expose it
EXPOSE 4096

# Start the OpenCode server.
# --hostname 0.0.0.0 is REQUIRED so Railway's proxy can reach it.
CMD ["opencode", "serve", "--hostname", "0.0.0.0", "--port", "4096"]
