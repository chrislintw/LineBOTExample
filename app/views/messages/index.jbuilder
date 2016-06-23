json.array! @requests do |request|
  json.id request.id
  json.sender request.sender
  json.content request.content
  json.created_at request.created_at
end