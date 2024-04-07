FROM dpage/pgadmin4:latest

# Copy the custom entrypoint script into the container
COPY custom_entrypoint.sh /custom_entrypoint.sh

# Set the custom script as the entrypoint
ENTRYPOINT ["/custom_entrypoint.sh"]