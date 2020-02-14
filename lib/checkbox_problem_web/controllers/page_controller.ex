defmodule CheckboxProblemWeb.PageController do
  use CheckboxProblemWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
