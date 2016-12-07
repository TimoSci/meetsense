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

# Repo.delete_all User

Repo.insert!(%User {name: "timo"})
Repo.insert!(%User {name: "josua"})
Repo.insert!(%User {name: "code monkey"})
Repo.insert!(%User {name: "jim"})

# Repo.delete_all Gathering

Repo.insert!(%Gathering {name: "Bowling"})
Repo.insert!(%Gathering {name: "Dinner"})
Repo.insert!(%Gathering {name: "Birthday Party"})

# Repo.delete_all UserGathering

Repo.insert!(%UserGathering {user_id: 1, gathering_id: 1})
Repo.insert!(%UserGathering {user_id: 2, gathering_id: 1})
Repo.insert!(%UserGathering {user_id: 3, gathering_id: 1})
Repo.insert!(%UserGathering {user_id: 4, gathering_id: 1})

# Repo.delete_all Votable

Repo.insert!(%Votable {name: "Monday", gathering_id: 1})
Repo.insert!(%Votable {name: "Tuesday", gathering_id: 1})
Repo.insert!(%Votable {name: "Wednesday", gathering_id: 1})
Repo.insert!(%Votable {name: "Thursday", gathering_id: 1})
Repo.insert!(%Votable {name: "Friday", gathering_id: 1})

# Repo.delete_all Vote

Repo.insert!(%Vote {votable_id: 1, user_id: 1, value: 1})
Repo.insert!(%Vote {votable_id: 1, user_id: 2, value: 1})
Repo.insert!(%Vote {votable_id: 1, user_id: 3, value: 0})
Repo.insert!(%Vote {votable_id: 1, user_id: 4, value: 0})
Repo.insert!(%Vote {votable_id: 2, user_id: 1, value: 1})
Repo.insert!(%Vote {votable_id: 2, user_id: 2, value: -1})
Repo.insert!(%Vote {votable_id: 2, user_id: 3, value: 0})
Repo.insert!(%Vote {votable_id: 2, user_id: 4, value: 1})
Repo.insert!(%Vote {votable_id: 3, user_id: 1, value: 0})
Repo.insert!(%Vote {votable_id: 3, user_id: 2, value: 0})
Repo.insert!(%Vote {votable_id: 3, user_id: 3, value: -1})
Repo.insert!(%Vote {votable_id: 3, user_id: 4, value: 1})
Repo.insert!(%Vote {votable_id: 4, user_id: 1, value: -1})
Repo.insert!(%Vote {votable_id: 4, user_id: 2, value: 1})
Repo.insert!(%Vote {votable_id: 4, user_id: 3, value: -1})
Repo.insert!(%Vote {votable_id: 4, user_id: 4, value: -1})
Repo.insert!(%Vote {votable_id: 5, user_id: 1, value: 0})
Repo.insert!(%Vote {votable_id: 5, user_id: 2, value: -1})
Repo.insert!(%Vote {votable_id: 5, user_id: 3, value: -1})
Repo.insert!(%Vote {votable_id: 5, user_id: 4, value: -1})
