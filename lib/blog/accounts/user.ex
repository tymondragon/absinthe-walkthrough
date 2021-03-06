defmodule Blog.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Blog.{Accounts, Content}

  schema "users" do
    field :name, :string
    field :password_hash, :string
    field :email, :string

    has_many :posts, Content.Post, foreign_key: :author_id
    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
  end

  @doc false
  def changeset(%__MODULE__{} = user, attrs) do
    attrs =
      attrs
      |> Map.put(:password_hash, Comeonin.Argon2.hashpwsalt(attrs.password))

    user
    |> cast(attrs, [:name, :password_hash, :email])
    |> validate_required([:name, :password_hash, :email])
  end
end
