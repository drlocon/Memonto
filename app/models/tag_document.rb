# == Schema Information
#
# Table name: tag_documents
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  document_id :integer          not null
#  tag_id      :integer          not null
#
class TagDocument < ApplicationRecord
  belongs_to :document
  belongs_to :tag
end
