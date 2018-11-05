defmodule Storex.Store.Book do
  use Ecto.Schema
  import Ecto.Changeset


  schema "store_books" do
    field :description, :string
    field :image_url, :string
    field :price, :decimal
    field :title, :string

    timestamps()
  end

  @doc false
  @max_price 9999

  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :description, :price, :image_url])
    |> validate_required([:title, :description, :price, :image_url])
    |> validate_max_price()
  end

  defp validate_max_price(changeset) do
    price = get_change(changeset, :price)

    if Decimal.cmp(price, @max_price) == :gt do
      add_error(changeset, :price, "Price is not valid")
    end

    changeset
  end
end
