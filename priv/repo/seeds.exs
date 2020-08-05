# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BlogGraphqlApi.Repo.insert!(%BlogGraphqlApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias BlogGraphqlApi.Blog.Post
alias BlogGraphqlApi.Repo

%Post{
  author: "Alex",
  description: "Elixir dipe dive",
  likes: 999,
  title: "Into Elixir"
}
|> Repo.insert!()

%Post{
  author: "Sasha",
  description: "Best user expiriance for web designers",
  likes: 123,
  title: "Web Design"
}
|> Repo.insert!()
