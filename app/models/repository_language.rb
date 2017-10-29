class RepositoryLanguage < ApplicationRecord
  belongs_to :language
  belongs_to :repository
end
