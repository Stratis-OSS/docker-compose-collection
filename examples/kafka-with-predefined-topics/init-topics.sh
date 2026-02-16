#!/usr/bin/env bash
set -e

# This script runs inside the official kafka docker image during first start
# (placed in /docker-entrypoint-inittopics.d/)

if [ -z "$KAFKA_TOPICS" ]; then
  echo "No topics requested → exiting"
  exit 0
fi

echo
echo "======================================================================"
echo "          Creating topics: $KAFKA_TOPICS"
echo "======================================================================"
echo

IFS=',' read -ra TOPIC_ARRAY <<< "$KAFKA_TOPICS"

for topic in "${TOPIC_ARRAY[@]}"; do
  topic=$(echo "$topic" | xargs)  # trim whitespace
  if [[ -z "$topic" ]]; then continue; fi

  echo "→ Creating topic: $topic"
  /opt/kafka/bin/kafka-topics.sh \
    --create --topic "$topic" \
    --bootstrap-server kafka-broker:${KAFKA_INTERNAL_PORT} \
    --command-config <(echo -e "security.protocol=SASL_PLAINTEXT\nsasl.mechanism=PLAIN\nsasl.jaas.config=org.apache.kafka.common.security.plain.PlainLoginModule required username=\"${KAFKA_USERNAME}\" password=\"${KAFKA_PASSWORD}\";") \
    --partitions 1 --replication-factor 1

done

echo "All requested topics created."
echo
