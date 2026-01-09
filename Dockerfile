FROM node:18-alpine

WORKDIR /app

# instaliraj pnpm
RUN npm install -g corepack
RUN corepack enable
RUN corepack prepare pnpm@10.27.0 --activate

# kopiraj dependency fajlove
COPY package.json pnpm-lock.yaml ./

# instaliraj deps
RUN pnpm install --frozen-lockfile

# kopiraj ostatak projekta
COPY . .

# produkcijski build
RUN pnpm build

EXPOSE 3000
CMD ["pnpm", "start"]
