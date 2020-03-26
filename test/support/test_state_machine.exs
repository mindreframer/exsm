defmodule ExsmTest.TestStateMachine do
  use Exsm,
    field: :my_state,
    states: ["created", "partial", "completed", "canceled"],
    transitions: %{
      "created" => ["partial", "completed"],
      "partial" => "completed",
      "*" => "canceled"
    }

  def before_transition(struct, "partial") do
    # Code to simulate and force an exception inside a
    # guard function.
    if Map.get(struct, :force_exception) do
      Exsm.non_existing_function_should_raise_error()
    end

    Map.put(struct, :missing_fields, true)
  end

  def after_transition(struct, "completed") do
    Map.put(struct, :missing_fields, false)
  end

  def persist(struct, next_state) do
    # Code to simulate and force an exception inside a
    # guard function.
    if Map.get(struct, :force_exception) do
      Exsm.non_existing_function_should_raise_error()
    end

    Map.put(struct, :my_state, next_state)
  end
end
