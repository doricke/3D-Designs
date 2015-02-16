json.array!(@papers) do |paper|
  json.extract! paper, :design_id, :link_id, :authors, :title, :reference
  json.url paper_url(paper, format: :json)
end
