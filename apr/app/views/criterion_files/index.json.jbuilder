json.array!(@criterion_files) do |criterion_file|
  json.extract! criterion_file, :id, :criterion_detail_id, :name, :attachment
  json.url criterion_file_url(criterion_file, format: :json)
end
