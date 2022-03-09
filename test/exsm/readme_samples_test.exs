defmodule Exsm.ReadmeSamplesTest do
  use ExUnit.Case

  defmodule YourProject.UserStateMachine do
    use Exsm,
      field: :state,
      states: ["created", "partial", "completed", "canceled", "paused", "restarted"],
      transitions: %{
        "created" => ["partial", "completed"],
        "partial" => "completed",
        "completed" => "restarted",
        "*" => "canceled"
      }
  end

  alias YourProject.UserStateMachine

  describe "hello" do
    test "works" do
      user = %{state: "created"}
      assert Exsm.transition_to(user, UserStateMachine, "partial") == {:ok, %{state: "partial"}}
    end

    test "fails on undeclared transitions" do
      user = %{state: "created"}

      assert Exsm.transition_to(user, UserStateMachine, "restarted") ==
               {:error, "Transition from \"created\" to \"restarted\" isn't declared"}
    end
  end
end
