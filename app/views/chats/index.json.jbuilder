json.array!(@chats) do |chat|
  json.extract! chat, :id, :name, :message, :like, :photo, :time_stamp
  json.url chat_url(chat, format: :json)
end
