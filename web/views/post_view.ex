defmodule DrunkenAngular.PostView do
  use DrunkenAngular.Web, :view

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, DrunkenAngular.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, DrunkenAngular.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      name: post.name}
  end
end
