json.array!(@attachments) do |attachment|
  json.extract! attachment, :design_id, :file_name, :path_name, :description, :file_type, :downloads, :content_type, :updated_at, :contents_bytes, :contents, :view_bytes, :view
  json.url attachment_url(attachment, format: :json)
end
