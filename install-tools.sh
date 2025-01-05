#!/bin/bash
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

ERROR_LOG="error.log"

run_command() {
    "$@" > /dev/null 2>>"$ERROR_LOG"  # Suppress output, log errors to error.log
    if [ $? -ne 0 ]; then
        echo -e "${RED}❌  Command failed: $1. Please check the error log: $ERROR_LOG.${NC}"
        exit 1  # Stop the script if the command fails
    fi
}

echo -e "${YELLOW}🛠️  Orph is setting up your workspace!${NC}"

echo -e "${GREEN}⚙️  Installing dependencies...${NC}"
run_command bundle install

echo -e "${GREEN}🔑  Installing dotenvx...${NC}"
run_command curl -fsS https://dotenvx.sh | sudo sh

echo -e "${GREEN}🎉  You're all good to go!${NC}"

echo -e "${GREEN}🚀  Starting your server...${NC}"
dotenvx run -f .env.test -- bundle exec rackup  # Show server logs in the console

