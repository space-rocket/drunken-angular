defmodule DrunkenAngular.Router do
  use Addict.RoutesHelper
  use DrunkenAngular.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser # Use the default browser stack

    get "/", DrunkenAngular.PageController, :index
    get "/show", DrunkenAngular.PageController, :show
    get "/forbidden", DrunkenAngular.PageController, :forbidden

    get "/sign-in", DrunkenAngular.SignInController, :index
    get "/register", DrunkenAngular.SignUpController, :index

    get "/bingo", DrunkenAngular.BingoController, :index
    get "/blog", DrunkenAngular.BlogController, :index
    get "/style-guide", DrunkenAngular.StyleGuideController, :index
    get "/contact", DrunkenAngular.ContactController, :index
    
    resources "/api/posts", DrunkenAngular.PostController, except: [:new, :edit]
    resources "/api/artists", DrunkenAngular.ArtistController, except: [:new, :edit]
    resources "/api/phrases", DrunkenAngular.PhraseController, except: [:new, :edit]
    resources "/api/users", DrunkenAngular.UserController, except: [:new, :edit]

    addict :routes,
      logout: [path: "/logout", controller: DrunkenAngular.UserController, action: :signout],
      recover_password: "/password/recover",
      reset_password: "/password/reset"
  end

  scope "/phrases", DrunkenAngular do
    pipe_through :api

    resources "/phrases", PhrasesController
  end

end
