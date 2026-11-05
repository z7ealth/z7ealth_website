defmodule Mix.Tasks.Z7ealthWebsite.Build do
  use Mix.Task

  @shortdoc "Build the website into docs/ (GitHub Pages)"
  @moduledoc """
  #{@shortdoc}. Run it with `MIX_ENV=prod mix z7ealth_website.build`: it
  builds the pages, the Tailwind CSS and the JS bundle into `_site/`, then
  replaces everything in `docs/` but `CNAME` with it.
  """

  @doc false
  def run(_argv) do
    source =
      "./_site"

    destination = "./docs"

    if File.exists?(destination) do
      destination
      |> File.ls!()
      |> Enum.each(fn file ->
        path = Path.join(destination, file)

        if file != "CNAME" do
          File.rm_rf!(path)
        end
      end)
    end

    File.rm_rf!(source)
    Mix.Task.run("tableau.build")
    Mix.Task.run("tailwind", ["default", "--minify"])
    Mix.Task.run("esbuild", ["default", "--minify"])

    File.cp_r(source, destination)
  end
end
