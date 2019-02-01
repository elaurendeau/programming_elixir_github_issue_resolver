defmodule ProgrammingElixirGithubIssueResolver.CLI do
  @moduledoc """
  This module will handle all the command line parsing
  """
  @default_issue_count_parameter 4
  alias ProgrammingElixirGithubIssueResolver.GithubIssues, as: Github

  def run(argv) do
    argv
    |> parse_args
    |> _run
  end

  defp _run({user, project, token, _count}) do
    Github.fetch(user, project, token)
  end

  def parse_args(argv) do
    argv
    |> OptionParser.parse(
         switches: [ help: :boolean ],
         aliases: [ h: :help ]
       )
    |> elem(1)
    |> _parse_args
  end

  defp _parse_args([user, project, token, count]) do
    {user, project, token, String.to_integer(count)}
  end

  defp _parse_args([user, project, token]) do
    {user, project, token, @default_issue_count_parameter}
  end

  defp _parse_args(_) do
    :help
  end


end
