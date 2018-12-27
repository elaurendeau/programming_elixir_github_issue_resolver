defmodule ProgrammingElixirGithubIssueResolver.CLI do
  @moduledoc """
  This module will handle all the command line parsing
"""
  @default_issue_count_parameter 4

  def run(argv) do
    parse_args(argv)
  end

  def parse_args(argv) do
    argv
      |> OptionParser.parse(switches: [help: :boolean], aliases: [h: :help])
      |> _parse_args
  end

  defp _parse_args({[help: true], _, _}) do
    :help
  end

  defp _parse_args{_, [user, project, count], _} do
    {user, project, String.to_integer(count)}
  end

  defp _parse_args{_, [user, project], _} do
    {user, project, @default_issue_count_parameter}
  end

  defp _parse_args(_) do
    :help
  end

end
