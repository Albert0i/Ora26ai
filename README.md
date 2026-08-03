### Oracle AI Database 26ai Free

Ora26ai is a containerized project built on **Oracle Database Free 26ai (full image)**.  
It provides a reproducible environment with persistent storage, vector capability, and automation helpers via `docker-compose` and `Makefile`.

#### I. Project Structure

```
Ora26ai/
├── docker-compose.yml   # Service definition
├── Makefile             # Automation helper
├── .env                 # Configuration parameters
└── oradata/             # Persistent storage (created manually)
```


#### II. Prerequisites

- Docker Engine ≥ 20.10  
- Docker Compose plugin ≥ 2.0  
- GNU Make (Linux/macOS; Windows via WSL or Git Bash)  


#### III. Configuration

All important parameters are stored in `.env`:

```env
# Oracle Database image
ORACLE_IMAGE=container-registry.oracle.com/database/free:latest

# Container name
ORACLE_CONTAINER=ora26ai-db

# Ports
ORACLE_PORT_LISTENER=1521
ORACLE_PORT_EMEXPRESS=5500

# Database settings
ORACLE_PWD=MyStrongPass123
ORACLE_CHARACTERSET=AL32UTF8

# Directories
DATA_DIR=./oradata
```

You can edit `.env` directly or run:

```bash
make config
```


#### IV. Setup Steps
##### 1. Clone the repository
```bash
git clone <your-repo-url> Ora26ai
cd Ora26ai
```

##### 2. Create the data folder
```bash
mkdir -p ./oradata
```

##### 3. Set permissions
Ensure Docker can write to the folder:

```bash
sudo chown -R 54321:54321 ./oradata
```

- `54321` is the default Oracle user inside the container.  
- Adjust ownership if your host requires different UID/GID.  

##### 4. Start the stack
```bash
make up
```

##### 5. Verify logs
```bash
make logs
```

#### V. Makefile Targets

- `make up` → start all services  
- `make down` → stop and remove services  
- `make restart` → restart services  
- `make ps` → show running containers  
- `make logs` → tail logs  
- `make prune` → clear logs from `DATA_DIR`  
- `make config` → edit `.env`  
- `make exec` → open shell inside the Oracle container  


#### IV. Connection Details

- **Host**: `localhost`  
- **Port**: `1521` (listener)  
- **Service name**: `FREEPDB1`  
- **User**: `SYSTEM` / `PDBADMIN`  
- **Password**: value of `ORACLE_PWD` in `.env`  


#### VII. Notes

- Use the **full image** (`ORACLE_IMAGE=.../free:latest`) to enable vector capability.  
- Data persists in `./oradata` even if the container is removed.  
- Password must be ≥12 chars, with uppercase, lowercase, and digit.  


#### VIII. License
Oracle Database Free 26ai is provided under the **Oracle Free Use Terms and Conditions**.  
See: [Oracle Database Free](https://www.oracle.com/database/free/)

> Oracle AI Database 26ai Free lets you use up to 2 CPUs, 2 GB of RAM, and 12 GB of storage for your data—all wrapped up in a simple, ready-to-go package. 


#### IX. Bibliography 
1. [Oracle Database XE](https://www.oracle.com/database/technologies/appdev/xe.html)
2. [Oracle AI Database Free](https://www.oracle.com/database/free/)
3. [Oracle AI Database 26ai Free Container Image Documentation](https://container-registry.oracle.com/ords/f?p=113:4:101267054238122:::4:P4_REPOSITORY,AI_REPOSITORY,AI_REPOSITORY_NAME,P4_REPOSITORY_NAME,P4_EULA_ID,P4_BUSINESS_AREA_ID:1863,1863,Oracle%20Database%20Free,Oracle%20Database%20Free,1,0&cs=3Dza398kgnsVjPJxjBoDqAiUpP29VlkV0aZ5RoA0RGJpFqmxJg4o2g7xFKr3NcFHd_uNEdF0nX7fJxqVHtMKIwQ)
4. [Oracle AI Database Free – Quick Start](https://www.oracle.com/database/free/get-started/#linux8)
5. [Oracle AI Database 26ai Powers the AI for Data Revolution](https://www.oracle.com/news/announcement/ai-world-database-26ai-powers-the-ai-for-data-revolution-2025-10-14/)
6. [Oracle Container Registry](https://container-registry.oracle.com/ords/f?p=113:10::::::)
7. [Oracle AI Database Free Installation Guide](https://docs.oracle.com/en/database/oracle/oracle-database/26/xeinw/installing-oracle-database-xe.html)
8. [Oracle AI Database Client Installation Guide](https://docs.oracle.com/en/database/oracle/oracle-database/26/ntcli/installing-the-oracle-database-client-software.html#GUID-F6B104C6-7A02-4909-9C95-BDED6AF60EAA)
9. [Installation and Getting Started Video](https://www.youtube.com/watch?v=YwcicSS9DOY)
10. [The Book of Disquiet by Fernando Pessoa](https://dn720004.ca.archive.org/0/items/english-collections-1/Book%20of%20Disquiet%2C%20The%20-%20Fernando%20Pessoa.pdf)


#### X. 


### EOF 
