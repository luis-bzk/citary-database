## Database - README

<h1 align="center"><b>My Appointment</b></h1>
<h2 align="center"><b>PostgreSQL Database</b></h2>

<p align="center">PostgreSQL database container for storing appointments and user data</p>

- [Database - README](#database---readme)
- [Overview](#overview)
- [Technologies Used](#technologies-used)
- [Deployment](#deployment)
- [Configuration](#configuration)
- [Persistent Storage](#persistent-storage)
- [Kubernetes Usage](#kubernetes-usage)
- [Accessing the Database](#accessing-the-database)
- [Contributing](#contributing)
- [License](#license)

## Overview

This is the database service for the **My Appointment** project. It uses a custom PostgreSQL Docker image and provides persistent storage via Kubernetes volumes.

## Technologies Used

- [PostgreSQL 15+](https://www.postgresql.org/)
- [Docker](https://www.docker.com/)
- [Kubernetes](https://kubernetes.io/)

## Deployment

This image is used in the central Kubernetes deployment:

```bash
make build-database
make deploy-database
```

## Configuration

Default configuration:

```
POSTGRES_DB=my_database_pg
POSTGRES_USER=root
POSTGRES_PASSWORD=root
```

Injected via Kubernetes secrets and config maps.

## Persistent Storage

Database uses a `PersistentVolume` and `PersistentVolumeClaim`:

- Volume: 2Gi
- Mounted at: `/var/lib/postgresql/data`

To reset DB storage:
```bash
make reset-db
```

## Kubernetes Usage

Use the central Kubernetes directory to manage lifecycle:

```bash
make deploy-database     # Only deploys DB
make restart-database    # Delete + redeploy
make logs-db             # View DB logs
```

## Accessing the Database

To connect:
```bash
kubectl exec -it deployment/postgres -- psql -U root -d my_database_pg
```

Or port-forward:
```bash
kubectl port-forward service/postgres 5432:5432
```

## Contributing

Fork the repo, clone, and submit improvements for Docker or K8s deployment.

## License

MIT

