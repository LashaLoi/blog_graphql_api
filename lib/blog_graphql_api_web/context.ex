defmodule BlogGraphqlApiWeb.Context do
  @behaviour Plug

  def init(opts), do: opts

  def call(conn, _), do: Absinthe.Plug.put_options(conn, context: build_context())
  defp build_context, do: %{current_user: "Alex Loi"}
end
