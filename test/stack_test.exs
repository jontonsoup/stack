ExUnit.start

defmodule StackTest do
  use ExUnit.Case, async: true

  test "it initalizes to nil" do
    {:ok, id} = Stack.start_link()

    value = Stack.pop(id)

    assert is_nil value
  end

  test "it returns nil when empty" do
    {:ok, id} = Stack.start_link()

    for n <- 1..4, do: Stack.push(id, n)
    for n <- 1..4, do: Stack.pop(id)

    value = Stack.pop(id)

    assert is_nil value
  end

  test "it returns the saved number" do
    {:ok, id} = Stack.start_link()
    input_number = 5

    Stack.push(id, input_number)
    value = Stack.pop(id)

    assert input_number == value
  end

  test "it acts as LIFO" do
    {:ok, id} = Stack.start_link()
    input_number = 5

    Stack.push(id, input_number)
    for n <- 1..4, do: Stack.push(id, n)
    for n <- 1..4, do: Stack.pop(id)
    value = Stack.pop(id)

    assert input_number == value
  end
end
