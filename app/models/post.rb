class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :category
  has_many :reviews
  validates :title, :summary, :body, presence: true

  def self.search(search)
    if search
      where(["title LIKE ?","%#{search}%"])
    else
      all
    end
  end

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
