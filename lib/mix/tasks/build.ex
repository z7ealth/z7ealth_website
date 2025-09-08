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
      File.rm_rf!(destination)
    end

    Mix.Task.run("tableau.build")

    File.cp_r(source, destination)
  end
end
