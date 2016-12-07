defmodule Meetsense.GatheringController do
  use Meetsense.Web, :controller

  alias Meetsense.Gathering

  def index(conn, _params) do
    gatherings = Repo.all(Gathering)
    render(conn, "index.html", gatherings: gatherings)
  end

  def new(conn, _params) do
    changeset = Gathering.changeset(%Gathering{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"gathering" => gathering_params}) do
    changeset = Gathering.changeset(%Gathering{}, gathering_params)

    case Repo.insert(changeset) do
      {:ok, _gathering} ->
        conn
        |> put_flash(:info, "Gathering created successfully.")
        |> redirect(to: gathering_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    gathering = Repo.get!(Gathering, id)
    render(conn, "show.html", gathering: gathering)
  end

  def edit(conn, %{"id" => id}) do
    gathering = Repo.get!(Gathering, id)
    changeset = Gathering.changeset(gathering)
    render(conn, "edit.html", gathering: gathering, changeset: changeset)
  end

  def update(conn, %{"id" => id, "gathering" => gathering_params}) do
    gathering = Repo.get!(Gathering, id)
    changeset = Gathering.changeset(gathering, gathering_params)

    case Repo.update(changeset) do
      {:ok, gathering} ->
        conn
        |> put_flash(:info, "Gathering updated successfully.")
        |> redirect(to: gathering_path(conn, :show, gathering))
      {:error, changeset} ->
        render(conn, "edit.html", gathering: gathering, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gathering = Repo.get!(Gathering, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(gathering)

    conn
    |> put_flash(:info, "Gathering deleted successfully.")
    |> redirect(to: gathering_path(conn, :index))
  end
end
