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
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } #今週
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } # 前週
  
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) } # 2日前
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) } # 3日前
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) } # 4日前
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) } # 5日前
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) } # 6日前

  # タグ機能の設定
  def save_tags(savedocument_tags)
    # 現在存在するタグの取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 新旧タグの定義
    old_tags = current_tags - savedocument_tags
    new_tags = savedocument_tags - current_tags
    # 古いタグを削除する
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end
    # 新しいタグを保存する
    new_tags.each do |new_name|
      document_tag = Tag.find_or_create_by(name:new_name)
      self.tags << document_tag
    end
  end

  # お気に入り機能の設定
  def favorited_by?(end_user)
    favorites.where(end_user_id: end_user.id).exists?
  end

  # キーワード検索の設定
  def self.word_search(search)
    if search != ""
      Document.where('content LIKE(?)', "%#{search}%")
    else
      Document.all
    end
  end

  # タグ検索の設定
  def self.tag_search(search_tag)
    Document.where(tag_id: search_tag)
  end
end
