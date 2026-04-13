## Using DBeaver Community as the front-end to openGauss

### Step 1 - Start OpenGauss
```Powershell
# Start the existing container
docker start opengauss

# Verify it's running,
docker ps

# Change from root to omm user
docker exec -it opengauss bash
su - omm

gsql -d postgres
CREATE USER ogc WITH PASSWORD 'Zxcv@123';
GRANT CREATE ON SCHEMA public TO ogc;
GRANT USAGE ON SCHEMA public TO ogc;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO ogc;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO ogc;
\c ad1
ALTER DATABASE ad1 OWNER TO ogc;
```

### OpenGauss Driver for DBeaver
```XML
<!-- https://mvnrepository.com/artifact/org.opengauss/opengauss-jdbc -->
<dependency>
<groupId>org.opengauss</groupId>
<artifactId>opengauss-jdbc</artifactId>
<version>5.0.1-og</version>
<scope>provided</scope>
</dependency>
```

### Frequently Used Docker Commands
```Powershell
# At “omm” cmd prompt:
gsql -r

\l                        # List available databases
\c postgres               # Switch connection to a database named ‘ad1’
\dv                       # List of view
\df                       # List of function
\dtable+ pg_statistic     # Describe a table
\d db4ai.snapshot         # Describe database objects
\db+                      # List of tablespaces
\dn                       # List of schemas
\dS+                      # List of tables, views, and sequences (press “q” to quit more display)

\c ad1                    # Switch connection to a database with the name of ‘d one’
\dt                       # 0.5 mark: successful list of tables in database
SELECT * FROM users;

\h                        # (for help with SQL commands. Press “q” to quit more display)
\?                        # (for help with psql commands. Press “space bar” to see more display)
\q                        # To quit openGauss (Then, type ‘exit’ twice to exit both omm and root user)

# Stop the container (graceful shutdown)
docker stop opengauss   # The docker server is stopping.

# Verify it is stopped
docker ps -a   # Status should show: Exited (0)
```
