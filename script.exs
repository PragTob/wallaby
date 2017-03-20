{:ok, server} = Wallaby.TestServer.start
Application.put_env(:wallaby, :base_url, server.base_url)

IO.puts "lol"


use Wallaby.DSL

{:ok, session} = Wallaby.start_session

session = visit(session, "forms.html")

IO.puts "fill_in start"
{time, _} = :timer.tc fn -> fill_in(session, Query.text_field("name"), with: "Chris") end
IO.puts "Finale fill in time #{time / 1000} ms"

Wallaby.end_session(session)
