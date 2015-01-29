json.array!(@chats) do |chat|
  json.extract! chat, :id, :name, :message, :like, :photo, :created_at
  json.url chat_url(chat, format: :json)
end
