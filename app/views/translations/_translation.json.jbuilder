json.extract! translation, :id, :name, :status, :owner_id, :source_url, :contributors_id, :source_lang, :priority, :original_content_id, :translated_contents_id, :created_at, :updated_at
json.url translation_url(translation, format: :json)
