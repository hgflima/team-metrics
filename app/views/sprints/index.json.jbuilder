json.array!(@sprints) do |sprint|
  json.extract! sprint, :title, :description, :project_id
  json.url sprint_url(sprint, format: :json)
end
