json.array!(@notes) do |note|
  json.extract! note, :id, :text, :color, :status
  json.url note_url(note, format: :json)
end
