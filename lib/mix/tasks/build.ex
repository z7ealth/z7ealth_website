defmodule Mix.Tasks.Z7ealthWebsite.Build do
  use Mix.Task

  @shortdoc "Build website"
  @moduledoc @shortdoc

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

    Mix.Task.run("tableau.build")

    File.cp_r(source, destination)
  end
end
