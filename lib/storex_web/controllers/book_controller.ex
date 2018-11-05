defmodule StorexWeb.BookController do
  use StorexWeb, :controller
  alias Storex.Store

  def index(conn, params) do
    render conn, "index.html", books: Store.pick_books(params["pick"])
  end

  def show(conn, %{"id" => book_id, "date" => date}) do
    render conn, "show.html", book: Store.get_book(book_id), date: date
  end
end
