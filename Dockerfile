FROM oven/bun:debian

WORKDIR /opt/server

COPY engine/ .

RUN bun install --frozen-lockfile

# Pack data is pre-built in the repo, skip Java build step
ENV BUILD_STARTUP=false
ENV WEB_PORT=8888

EXPOSE 8888/tcp

CMD ["bun", "run", "src/app.ts"]
