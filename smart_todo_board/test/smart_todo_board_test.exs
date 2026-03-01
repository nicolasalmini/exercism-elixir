defmodule SmartTodoBoardTest do
  use ExUnit.Case
  doctest SmartTodoBoard

  test "greets the world" do
    assert SmartTodoBoard.hello() == :world
  end
end
