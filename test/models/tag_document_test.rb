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
require "test_helper"

class TagDocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
