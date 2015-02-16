json.array!(@videos) do |video|
  json.extract! video, :design_id, :video_name, :video_description, :video_category, :video_type, :video_bytes, :movie, :updated_at
  json.url video_url(video, format: :json)
end
