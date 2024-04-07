<a name="readme-top"></a>

<div align="center">

<h3 align="center">pgAdmin4 Automatic Login</h3>

  <p align="center">
    This repository provides a Docker setup for pgAdmin with automatic database connection configuration and simplified authentication. It's designed to streamline the development and testing process with PostgreSQL.
    <br />
    <br />
    <a href="https://github.com/rorylshanks/pgadmin4-automatic-login/issues">Report Bug</a>
    ·
    <a href="https://github.com/rorylshanks/pgadmin4-automatic-login/issues">Request Feature</a>
  </p>
</div>

<!-- ABOUT THE PROJECT -->
## About The Project

This project hosts a Dockerized setup for pgAdmin that automates the addition of a database host and simplifies the login process, making it easier to get started with PostgreSQL for development and testing purposes. 

Please note this project bypasses a lot of security features that pgAdmin implements and should therefore never be exposed to the public internet.

## Features

- **Automatic Database Connection**: Automatically configures a connection to a PostgreSQL database using environment variables.
- **Simplified Authentication**: Enables logging into pgAdmin without the need for setting up a master password.
- **Environment Variable Configuration**: Allows easy customization of the database connection and pgAdmin authentication through environment variables.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

To get started with this Dockerized pgAdmin setup, you'll need to configure a few environment variables. Here are the variables and their default values:

```
DATABASE_HOST - Hostname or IP Address of the server to add (default postgres)
DATABASE_PORT - Port of the server to add (default 5432)
DATABASE_USERNAME - Username or role name to use to access the server (default postgres)
DATABASE_PASSWORD - Password for user / role (default password)
```

### Using This Docker Setup

1. **Run the Docker Container**: You can run the pre-built Docker image with the following command, making sure to replace the environment variable values as needed.

```bash
docker run -d -p 80:80 -e DATABASE_HOST=your_database_host -e DATABASE_PASSWORD=your_database_password rorylshanks/pgadmin4-auto-login:latest
```

or as a docker-compose.yaml file

```yaml
version: '3.8'

services:
  pgadmin:
    image: rorylshanks/pgadmin4-auto-login:latest
    environment:
      DATABASE_HOST: postgres
      DATABASE_USERNAME: postgres
      DATABASE_PASSWORD: password
    ports:
      - "80:80" # Expose pgAdmin on port 80 of the host
    depends_on:
      - postgres
    restart: always

  postgres:
    image: postgres:latest
    environment:
      POSTGRES_PASSWORD: password
    restart: always
```

Now, pgAdmin should be running and accessible on `http://localhost:80`, with the database connection already configured. There should be no login prompt and the server specified should be automatically available.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments

This project adapts the official pgAdmin Docker setup for easier configuration and setup in development environments.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
