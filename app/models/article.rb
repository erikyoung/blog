class Article < ApplicationRecord
	belongs_to :user, dependent: :destroy
	validates :title, presence: true
	has_many :comments, dependent: :destroy
	has_many :taggings
	has_many :tags, through: :taggings
	def self.search(search)
		where("title || body ILIKE ?", "%#{search}%")
	end
end
