# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  document_id :integer          not null
#  end_user_id :integer          not null
#
class Favorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :document
end
