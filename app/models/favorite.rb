class Favorite < ApplicationRecord
  belongs_to :end_users
  belongs_to :documents
end
