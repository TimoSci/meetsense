# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Meetsense.Repo.insert!(%Meetsense.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Meetsense.Repo
alias Meetsense.User
alias Meetsense.UserGathering
alias Meetsense.Gathering
alias Meetsense.Votable
alias Meetsense.Vote

Repo.insert!(%User {name: 'timo'})
Repo.insert!(%User {name: 'josua'})
Repo.insert!(%User {name: 'code monkey'})

Repo.insert!(%Gathering {name: 'Bowling'})
Repo.insert!(%Gathering {name: 'Bowling'})
Repo.insert!(%Gathering {name: 'Bowling'})

