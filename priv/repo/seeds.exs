# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hw06.Repo.insert!(%Hw06.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Hw06.Repo
alias Hw06.Users.User

Repo.insert!(%User{email: "admin@gmail.com", admin: true, first_name: "Admin", last_name: "User"})
Repo.insert!(%User{email: "user@gmail.com", admin: false, first_name: "Demo", last_name: "User"})