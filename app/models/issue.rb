class Issue < ApplicationRecord
  belongs_to :repository
  belongs_to :user
end
