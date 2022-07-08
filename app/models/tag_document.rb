class TagDocument < ApplicationRecord
  belongs_to :documents
  belongs_to :tags
end
