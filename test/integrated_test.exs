defmodule IntegratedTest do
  use ExUnit.Case

  alias ProgrammingElixirGithubIssueResolver.CLI, as: CLI

  @moduletag :capture_log

  doctest CLI

  test "invalid will return help" do
    assert CLI.run(["lpil", "mix-test.watch", "key"]) == :help
  end
end
