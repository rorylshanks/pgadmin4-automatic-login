#!/bin/sh
set -eo pipefail
# Environment variables to be set by the user
export DATABASE_HOST=${DATABASE_HOST:-postgres}
export DATABASE_PORT=${DATABASE_PORT:-5432}
export DATABASE_USERNAME=${DATABASE_USERNAME:-postgres}
export DATABASE_PASSWORD=${DATABASE_PASSWORD:-password}

# Set configuration to disable server mode and master password requirement
export PGADMIN_DEFAULT_EMAIL=${PGADMIN_DEFAULT_EMAIL:-fake@fake.com}
export PGADMIN_DEFAULT_PASSWORD=${PGADMIN_DEFAULT_PASSWORD:-fake}
export PGADMIN_CONFIG_SERVER_MODE=False
export PGADMIN_CONFIG_MASTER_PASSWORD_REQUIRED=False
export PGADMIN_SERVER_JSON_FILE=/var/lib/pgadmin/servers.json

# Generate the servers.json file for automatic database connection setup
cat > /var/lib/pgadmin/servers.json <<EOF
{
    "Servers": {
        "1": {
            "Name": "${DATABASE_HOST}",
            "Group": "Servers",
            "Host": "${DATABASE_HOST}",
            "Port": ${DATABASE_PORT},
            "MaintenanceDB": "postgres",
            "Username": "${DATABASE_USERNAME}",
            "Password": "${DATABASE_PASSWORD}",
            "PassFile": "/var/lib/pgadmin/pgpass"
        }
    }
}
EOF

echo "${DATABASE_HOST}:${DATABASE_PORT}:*:${DATABASE_USERNAME}:${DATABASE_PASSWORD}" > /var/lib/pgadmin/pgpass
chmod 600 /var/lib/pgadmin/pgpass
# Call the original entrypoint to ensure pgAdmin is started properly
exec /entrypoint.sh
