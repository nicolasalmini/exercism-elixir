defmodule StudyingStuffTest do
  use ExUnit.Case
  doctest StudyingStuff

  test "greets the world" do
    assert StudyingStuff.hello() == :world
  end
end
