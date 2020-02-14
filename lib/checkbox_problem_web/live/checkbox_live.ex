defmodule CheckboxProblemWeb.CheckboxLive do
  use Phoenix.LiveView

  alias CheckboxProblem.Checkboxes
  alias CheckboxProblem.Checkboxes.Checkbox
  alias CheckboxProblemWeb.Router.Helpers, as: Routes

  def render(assigns) do
    CheckboxProblemWeb.CheckboxView.render("example.html", assigns)
  end

  def mount(%{"id" => checkbox_id}, _session, socket) do
    changeset = Checkboxes.get_checkbox!(checkbox_id) |> Checkboxes.change_checkbox()
    {:ok, socket |> assign(changeset: changeset)}
  end

  def mount(_params, _session, socket) do
    changeset = Checkboxes.change_checkbox(%Checkbox{})
    {:ok, socket |> assign(changeset: changeset)}
  end

  def handle_event("change", %{"checkbox" => values}, socket) do
    changeset = socket |> Map.fetch!(:assigns) |> Map.fetch!(:changeset)

    changeset = Checkbox.changeset(changeset, values)

    {:noreply, socket |> assign(changeset: changeset)}
  end

  def handle_event("save", %{"checkbox" => %{"id" => ""} = values}, socket) do
    case Checkboxes.create_checkbox(values) do
      {:ok, _checkbox} ->
        {:stop,
         socket
         |> put_flash(:info, "Checkbox created successfully.")
         |> redirect(to: Routes.page_path(socket, :index))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply,
         socket
         |> assign(changeset: changeset)}
    end
  end

  def handle_event("save", %{"checkbox" => %{"id" => checkbox_id} = values}, socket) do
    checkbox = Checkboxes.get_checkbox!(checkbox_id)

    case Checkboxes.update_checkbox(checkbox, values) do
      {:ok, _checkbox} ->
        {:stop,
         socket
         |> put_flash(:info, "Checkbox updated successfully.")
         |> redirect(to: Routes.page_path(socket, :index))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply,
         socket
         |> assign(changeset: changeset)}
    end
  end
end
