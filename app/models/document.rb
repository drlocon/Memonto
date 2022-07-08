class Document < ApplicationRecord
  belongs_to :end_users
  
  has_many :tag_documents, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
