# == Schema Information
#
# Table name: documents
#
#  id          :integer          not null, primary key
#  content     :text             not null
#  feeling     :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  end_user_id :integer          not null
#
class Document < ApplicationRecord
  belongs_to :end_user

  has_many :tag_documents, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # feelingのenum設定
  enum feeling: { happy: 0, anger: 1, sorrow: 2, normal: 3, tired: 4 }
  
  # バリデーションの設定
  validates :content, presence: true
end
