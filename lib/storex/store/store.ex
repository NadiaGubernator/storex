defmodule Storex.Store do
  alias Storex.Repo
  alias Storex.Store.Book

  def pick_books(pick) do
    case pick do
    "even" -> Enum.filter(list_books(), fn book -> rem(String.to_integer(book.id), 2) == 0 end)
    "odd" -> Enum.reject(list_books(), fn book -> rem(String.to_integer(book.id), 2) == 0 end)
    _ -> list_books()
    end
  end

  def get_book(id) do
    Repo.get(Book, id)
  end

  def create_book(attrs) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  defp list_books() do
    Repo.all(Book)
  end
end
