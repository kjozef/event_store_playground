defmodule EventStoreTest.Application do
  use Application

  def start(_type, _args) do
    children = [
      EventStoreTest,
      SubscriberA,
      SubscriberB
    ]

    opts = [strategy: :one_for_one, name: EventStoreTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
