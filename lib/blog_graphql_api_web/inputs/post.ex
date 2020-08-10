defmodule BlogGraphqlApiWeb.Inputs.Post do
  use Absinthe.Schema.Notation

  input_object :create_post_input do
    field :author, :string |> non_null
    field :description, :string |> non_null
    field :title, :string |> non_null
    field :likes, :integer
    field :author_id, :id |> non_null
  end

  input_object :update_post_input do
    field :author, :string
    field :description, :string
    field :title, :string
    field :likes, :integer
    field :author_id, :id
  end
end
