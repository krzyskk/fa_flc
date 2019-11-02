json.extract! task, :id, :name, :description, :start_time, :end_time, :color, :priority, :done, :day_id, :finished_at, :created_at, :updated_at
json.url task_url(task, format: :json)
