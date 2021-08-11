class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :media
  belongs_to :preference
  belongs_to :user
  has_one_attached :image
  has_many :likes
  
  with_options presence: true do
    with_options numericality: {other_than: 1 , message: "can't be blank"} do
      validates :media_id
      validates :genre_id
      validates :preference_id
    end
    validates :title, length: {maximum: 40}
    validates :description, length: {maximum: 1000}
  end
end
