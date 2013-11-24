json.array!(@backlogs) do |backlog|
  json.extract! backlog, :title, :description, :project_id
  json.url backlog_url(backlog, format: :json)
end
