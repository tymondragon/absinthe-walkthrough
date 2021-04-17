defmodule BlogWeb.Resolvers.Content do
  def list_posts(%Blog.Accounts.User{} = author, args, _resolution) do
    {:ok, Blog.Content.list_posts(author, args)}
  end

  def list_posts(_parent, _arg, _resolution) do
    {:ok, Blog.Content.list_posts()}
  end
end
