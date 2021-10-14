defmodule Inmana.Supplies.Create do
  alias Inmana.{Repo, Supply}

  alias Inmana.Repo
  alias Inmana.Supply

  def call(params) do
    params
    |> Supply.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Supply{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
