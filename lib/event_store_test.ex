defmodule EventStoreTest do
  use EventStore, otp_app: :event_store_test

end


defmodule SubscriberA do
  use GenServer

  alias EventStoreTest

  @name __MODULE__

  def start_link(_) do
    GenServer.start_link(@name, [])
  end

  def init(_) do
    {:ok, subscription} = EventStoreTest.subscribe_to_stream("identities", "subscriber_a", self())

    IO.inspect(subscription)
    {:ok, %{subscription: subscription}}
  end

  def handle_info({:subscribed, _pid}, state), do: {:noreply, state}
  def handle_info(events, %{subscription: subscription} = state) do
    IO.inspect(events, label: "SIEMA A")

    EventStore.ack(subscription, events)

    {:noreply, state}
  end
end

defmodule SubscriberB do
  use GenServer

  alias EventStoreTest

  @name __MODULE__

  def start_link(_) do
    GenServer.start_link(@name, [])
  end

  def init(_) do
    {:ok, subscription} = EventStoreTest.subscribe_to_stream("identities", "subscriber_b", self())

    IO.inspect(subscription)

    {:ok, %{subscription: subscription}}
  end

  def handle_info({:subscribed, _pid}, state), do: {:noreply, state}
  def handle_info(events, %{subscription: subscription} = state) do
    IO.inspect(events, label: "SIEMA B")

    EventStore.ack(subscription, events)

    {:noreply, state}
  end
end

defmodule SomeEvent do
  defstruct [:a]
end
