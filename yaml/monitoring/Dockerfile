FROM docker:24.0.6-cli

# Installe bash et curl
RUN apk add --no-cache bash curl

# Copie le script
COPY collector.sh /collector.sh
RUN chmod +x /collector.sh

CMD ["/collector.sh"]
