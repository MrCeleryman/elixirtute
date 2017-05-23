unless(DanielApi.EventQueries.any) do
	DanielApi.EventQueries.create(DanielApi.Events.changeset(%DanielApi.Events{}, %{date: "2017-08-23 09:00:00", title: "Winter Codefest", location: "Queensland"}))
	DanielApi.EventQueries.create(DanielApi.Events.changeset(%DanielApi.Events{}, %{date: "2017-08-03 00:00:00", title: "Dans Birthday", location: "Everywhere"}))
end
