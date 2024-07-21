To set up your PostgreSQL database and pgAdmin using Docker Compose, follow these step-by-step instructions:

Step 1: If you haven't already, install Docker and Docker Compose on your system:
    Install Docker
    Install Docker Compose

Step 2: Create a Docker Compose YAML file
    Create a file named docker-compose.yml and paste the provided YAML configuration into it.

Step 3: Configure PostgreSQL
In the docker-compose.yml file, you can customize PostgreSQL settings under the postgreservice section:
    POSTGRES_DB: The name of the default database.
    POSTGRES_USER: The username for the PostgreSQL user.
    POSTGRES_PASSWORD: The password for the PostgreSQL user.

Step 4: Configure pgAdmin
In the docker-compose.yml file, you can customize pgAdmin settings under the pgadminservice section:
    PGADMIN_DEFAULT_EMAIL: The email for the default pgAdmin user.
    PGADMIN_DEFAULT_PASSWORD: The password for the default pgAdmin user.
    PGADMIN_LISTEN_PORT: The port on which pgAdmin will listen. (In this case, it's mapped to host port 8080.)

Step 5: Create Necessary Folders
Create the following folders in the same directory as your docker-compose.yml file:
    Design_Project (This is specified in the volumes section and will store initialization scripts for PostgreSQL.)
    Design_Project (This is specified in the volumes section and will store data for PostgreSQL.)

Step 6: Run Docker Compose
Open a terminal or command prompt, navigate to the directory containing your docker-compose.yml file, and run the following command:

bash
docker-compose up -d
This command will download the necessary Docker images, create containers based on the configuration, and start the services in the background.

Step 7: Access PostgreSQL and pgAdmin
    PostgreSQL:
        Host: localhost (or the IP address of your machine)
        Port: 5432
        Database: healthcare_db (or the name you specified)
        Username: admin (or the username you specified)
        Password: secret (or the password you specified)

    pgAdmin:
        Access the pgAdmin web interface by visiting http://localhost:8080 in your web browser.
        Login with the email and password you specified in the configuration.

Step 8: Stop and Remove Containers
When you're done, you can stop and remove the containers using:

bash
docker-compose down

Congratulations! 
You now have a PostgreSQL database and pgAdmin running in Docker containers. 
Adjust the configuration based on your needs, and feel free to explore more advanced Docker Compose settings as you become more familiar with Docker.
