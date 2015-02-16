json.array!(@images) do |image|
  json.extract! image, :design_id, :image_name, :description, :image_type, :picture_bytes, :picture
  json.url image_url(image, format: :json)
end
