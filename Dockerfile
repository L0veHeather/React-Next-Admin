# Rebuild the source code only when needed
FROM node:20-alpine AS builder
WORKDIR /app

# Copy package files first for better caching
COPY package.json package-lock.json* pnpm-lock.yaml* ./

# Install pnpm and dependencies
RUN corepack enable pnpm && \
    pnpm install --frozen-lockfile || pnpm install

# Copy source code
COPY . .

# Build the application
RUN pnpm build

# Production image, copy all the files and run next
FROM node:20-alpine AS runner
WORKDIR /app

ENV NODE_ENV production

RUN addgroup -g 1001 -S nodejs
RUN adduser -S nextjs -u 1001

# Copy necessary files from builder
COPY --from=builder /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

USER nextjs

EXPOSE 8081

ENV PORT 8081

CMD ["node_modules/.bin/next", "start"]
