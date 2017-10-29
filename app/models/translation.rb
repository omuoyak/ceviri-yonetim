class Translation < ApplicationRecord
  belongs_to :tfile
  belongs_to :language
  belongs_to :user
end
