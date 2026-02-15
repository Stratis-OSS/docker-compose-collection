# Keycloak with GSIS OAuth2.0 providers

We setup a Keycloak of the latest `26.5` version.

This setup utilizes [cti-nts/keycloak-gsis-providers](https://github.com/cti-nts/keycloak-gsis-providers) plugin to add a provider for Greek General Secretariat of Information Systems for Public Administration (GSIS) OAuth2.

For database, we use Postgres.

## Images

| Image | Version |
| :-- | :-- |
| `quay.io/keycloak/keycloak` | `26.5` |
| `postgres` | `latest` |

## Benefits to our setup

- Ready to use.
- Postgres database.
- HTTPS (with self-signed certificate)
- GSIS OAuth2

## How to

### Setup

1. Generate a self-signed certificate for Keycloak:

   > It is important that you run the following command from the folder that our compose lives in.

   ```bash
   mkdir conf && cd conf && \
   openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
     -keyout keycloak.key \
     -out keycloak.crt \
     -subj "/CN=localhost" \
     -addext "subjectAltName = DNS:localhost,IP:127.0.0.1"
   ```

   > For windows, you should probably use WSL.
2. Run the compose file:

   ```bash
   docker compose up -d
   ```

### Connect

1. Go to <https://localhost:8443>.
2. For the admin's credentials, check the `.env` file.

## Third-party notices

- keycloak-gsis-providers (Apache 2.0) — see [licenses/LICENSE__cti-nts__keycloak-gsis-providers](./licenses/LICENSE__cti-nts__keycloak-gsis-providers)

  Used to support **Greek GSIS OAuth2.0 providers** in **Keycloak v26**.
