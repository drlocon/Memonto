class Tag < ApplicationRecord
  has_many :tag_documents, dependent: :destroy
end
