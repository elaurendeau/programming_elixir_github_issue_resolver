defmodule ProgrammingElixirGithubIssueResolver.GithubIssues do

  def fetch(user, project, token) do
    issue_url(user, project)
    |> _query(token)
    |> _process_response
  end

  defp _query(url, token) do
    headers = ["Authorization": "token #{token}", "Accept": "Application/json; Charset=utf-8"]
    options = [ssl: [{:versions, [:'tlsv1.2']}], recv_timeout: 500]
    HTTPoison.get(url, headers, options)
  end

  def issue_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end

  defp _process_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    body
    |> IO.inspect
    |> IO.inspect
  end

  defp _process_response(_) do
    IO.puts("this isn't working!")
    []
  end
end
