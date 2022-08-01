# == Schema Information
#
# Table name: documents
#
#  id          :integer          not null, primary key
#  content     :text             not null
#  feeling     :integer          default("happy"), not null
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

  # 分析機能の設定
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) }
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) }
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) }
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) }
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) }

  scope :current_happy, -> { where(feeling: 0, created_at: Time.zone.now.beginning_of_month..Time.now.end_of_month) }
  scope :current_angry, -> { where(feeling: 1, created_at: Time.zone.now.beginning_of_month..Time.now.end_of_month) }
  scope :current_sorrow, -> { where(feeling: 2, created_at: Time.zone.now.beginning_of_month..Time.now.end_of_month) }
  scope :current_normal, -> { where(feeling: 3, created_at: Time.zone.now.beginning_of_month..Time.now.end_of_month) }
  scope :current_tired, -> { where(feeling: 4, created_at: Time.zone.now.beginning_of_month..Time.now.end_of_month) }

  # タグ機能の設定
  def save_tags(savedocument_tags)
    current_tags = tags.pluck(:name) unless tags.nil?
    old_tags = current_tags - savedocument_tags
    new_tags = savedocument_tags - current_tags
    old_tags.each do |old_name|
      tags.delete Tag.find_by(name: old_name)
    end
    new_tags.each do |new_name|
      document_tag = Tag.find_or_create_by(name: new_name)
      tags << document_tag
    end
  end

  # お気に入り機能の設定
  def favorited_by?(end_user)
    favorites.where(end_user_id: end_user.id).exists?
  end

  # キーワード検索の設定
  def self.word_search(search)
    if search != ""
      Document.where("content LIKE(?)", "%#{search}%")
    else
      Document.all
    end
  end

  # タグ検索の設定
  def self.tag_search(search_tag)
    Document.where(tag_id: search_tag)
  end
end
