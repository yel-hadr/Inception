FROM alpine:3.14

RUN apk update && apk --no-cache add redis

# Expose port 6379 for Redis
HEALTHCHECK --start-period=15s --timeout=10s --interval=10s --retries=3 CMD ["redis-cli", "ping"]
EXPOSE 6379

CMD [ "redis-server" , "--daemonize" , "no"  , "--protected-mode" , "no" ]

