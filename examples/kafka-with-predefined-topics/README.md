# Kafka with predefined topics

We setup a Kafka instance.
Inside, we also create topics, ready to be used.

## Images

| Image | Version |
| :-- | :-- |
| `apache/kafka` | `4.1.1` |
| `provectuslabs/kafka-ui` | `latest` |

## Benefits to our setup

- Ready to use.
- Kafka instance.
- Intuitive UI.
- Pre-defined topics, created automatically.

## How to

### Setup

Run the compose file:

```bash
docker compose up -d
```

### Connect

Go to <http://localhost:8080>.

## Third-party notices

- kafka-ui (Apache 2.0) — see [licenses/LICENSE__provectus__kafka-ui](./licenses/LICENSE__provectus__kafka-ui)

  Used to add an intuitive UI for managing clusters, brokers, topics etc.
