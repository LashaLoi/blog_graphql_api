defmodule BlogGraphqlApi.UserTest do
  use BlogGraphqlApi.DataCase

  alias BlogGraphqlApi.User

  describe "author" do
    alias BlogGraphqlApi.User.Author

    @valid_attrs %{age: 42, first_name: "some first_name", last_name: "some last_name"}
    @update_attrs %{age: 43, first_name: "some updated first_name", last_name: "some updated last_name"}
    @invalid_attrs %{age: nil, first_name: nil, last_name: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_author()

      author
    end

    test "list_author/0 returns all author" do
      author = author_fixture()
      assert User.list_author() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert User.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = User.create_author(@valid_attrs)
      assert author.age == 42
      assert author.first_name == "some first_name"
      assert author.last_name == "some last_name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, %Author{} = author} = User.update_author(author, @update_attrs)
      assert author.age == 43
      assert author.first_name == "some updated first_name"
      assert author.last_name == "some updated last_name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_author(author, @invalid_attrs)
      assert author == User.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = User.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> User.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = User.change_author(author)
    end
  end
end
