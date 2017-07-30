class Translation < ApplicationRecord
  belongs_to :owner
  belongs_to :contributors
  belongs_to :original_content
  belongs_to :translated_contents
end
