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
  has_many :tags, through: :tag_documents
  has_many :favorites, dependent: :destroy

  # feelingのenum設定
  enum feeling: { happy: 0, anger: 1, sorrow: 2, normal: 3, tired: 4 }
  
  # バリデーションの設定
  validates :content, presence: true
  
  # タグ機能の設定
  def save_tags(savedocument_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savedocument_tags
    new_tags = savedocument_tags - current_tags
      
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end
      
    new_tags.each do |new_name|
      document_tag = Tag.find_or_create_by(name:new_name)
      self.tags << document_tag
    end
  end
end
