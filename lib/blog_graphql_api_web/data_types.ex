defmodule BlogGraphqlApiWeb.DataTypes do
  use Absinthe.Schema.Notation

  input_object :post_input do
    field :author, :string |> non_null
    field :description, :string |> non_null
    field :title, :string |> non_null
    field :likes, :integer |> non_null
  end

  input_object :update_post_input do
    field :author, :string
    field :description, :string
    field :title, :string
    field :likes, :integer
  end

  object :post do
    field :id, :id
    field :author, :string
    field :description, :string
    field :title, :string
    field :likes, :integer
  end
end
