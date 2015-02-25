json.array!(@tasks) do |task|
  json.extract! task, :id, :taskLoc, :taskDesc
  json.url task_url(task, format: :json)
end
