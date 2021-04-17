defmodule Blog.Accounts do
  @moduledoc """
  The Blog context.
  """

  alias Blog.{Repo, Accounts}

  def find_user(id) do
    Repo.get(Accounts.User, id)
  end
end
