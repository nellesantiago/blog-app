json.extract! entry, :id, :title, :content, :user, :created_at, :updated_at
json.url entry_url(entry, format: :json)
