defmodule BlogGraphqlApiWeb.Inputs.Author do
  use Absinthe.Schema.Notation

  input_object :create_author_input do
    field :first_name, :string |> non_null
    field :last_name, :string |> non_null
    field :age, :integer |> non_null
  end
end
