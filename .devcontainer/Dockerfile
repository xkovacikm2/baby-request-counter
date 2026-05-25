FROM ruby:3

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    git \
    curl \
    postgresql-client \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Configure Selenium to use system Chromium
ENV CHROME_BIN="/usr/bin/chromium" \
    CHROMIUM_BIN="/usr/bin/chromium" \
    SE_CHROME_EXECUTABLE="/usr/bin/chromium"

# Install yarn
RUN npm install -g yarn

# Create vscode user
RUN useradd -m -s /bin/bash vscode && \
    mkdir -p /workspace && \
    chown -R vscode:vscode /workspace

USER vscode
WORKDIR /workspace

# Set up gem installation path for vscode user
ENV GEM_HOME="/home/vscode/.gem" \
    PATH="/home/vscode/.gem/bin:$PATH"

# Install bundler
RUN gem install bundler

CMD ["/bin/bash"]
