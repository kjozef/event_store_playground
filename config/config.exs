import Config

config :event_store_test, EventStoreTest,
  serializer: EventStore.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "eventstore",
  hostname: "localhost"

config :event_store_test, EventStoreTest,
  pool_size: 10,
  queue_target: 50,
  queue_interval: 1_000,
  schema: "schema_name"

config :event_store_test, event_stores: [EventStoreTest]
