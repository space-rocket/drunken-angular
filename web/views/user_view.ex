defmodule DrunkenAngular.UserView do
  use DrunkenAngular.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, DrunkenAngular.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, DrunkenAngular.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      email: user.email,
      hash: user.hash,
      recovery_hash: user.recovery_hash,
      timestamps: user.timestamps}
  end
end
