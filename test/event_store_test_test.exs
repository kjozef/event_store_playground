defmodule EventStoreTestTest do
  use ExUnit.Case
  doctest EventStoreTest

  test "greets the world" do
    assert EventStoreTest.hello() == :world
  end
end
