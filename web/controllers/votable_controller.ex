defmodule Meetsense.VotableController do
  use Meetsense.Web, :controller

  alias Meetsense.Votable

  def index(conn, _params) do
    votables = Repo.all(Votable)
    render(conn, "index.html", votables: votables)
  end

  def new(conn, _params) do
    changeset = Votable.changeset(%Votable{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"votable" => votable_params}) do
    changeset = Votable.changeset(%Votable{}, votable_params)

    case Repo.insert(changeset) do
      {:ok, _votable} ->
        conn
        |> put_flash(:info, "Votable created successfully.")
        |> redirect(to: votable_path(conn, :index))
      #  |> redirect(to: root_path(conn))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    votable = Repo.get!(Votable, id)
    render(conn, "show.html", votable: votable)
  end

  def edit(conn, %{"id" => id}) do
    votable = Repo.get!(Votable, id)
    changeset = Votable.changeset(votable)
    render(conn, "edit.html", votable: votable, changeset: changeset)
  end

  def update(conn, %{"id" => id, "votable" => votable_params}) do
    votable = Repo.get!(Votable, id)
    changeset = Votable.changeset(votable, votable_params)

    case Repo.update(changeset) do
      {:ok, votable} ->
        conn
        |> put_flash(:info, "Votable updated successfully.")
        |> redirect(to: votable_path(conn, :show, votable))
      {:error, changeset} ->
        render(conn, "edit.html", votable: votable, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    votable = Repo.get!(Votable, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(votable)

    conn
    |> put_flash(:info, "Votable deleted successfully.")
    |> redirect(to: votable_path(conn, :index))
  end
end
