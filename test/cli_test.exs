defmodule CliTest do
  use ExUnit.Case

  alias ProgrammingElixirGithubIssueResolver.CLI, as: CLI

  @moduletag :capture_log

  doctest CLI

  test ":help returned when passing -h or --help" do
    assert CLI.parse_args(["-h", "anything"]) == :help
    assert CLI.parse_args(["--help", "anything"]) == :help
  end

  test "user, project and count returned normally" do
    assert CLI.parse_args(["user", "project", "token", "404"]) == {"user", "project", "token", 404}
  end

  test "user, project return normally with a default issue count" do
    assert CLI.parse_args(["user", "project", "token"]) == {"user", "project", "token", 4}
  end

  test "invalid will return help" do
    assert CLI.parse_args(["user"]) == :help
  end
end
