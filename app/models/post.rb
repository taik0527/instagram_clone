# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_one :activity, as: :subject, dependent: :destroy

  validates :body, presence: true, length: { maximum: 1000 }
  validates :images, presence: true

  scope :body_contain, ->(word) { where('posts.body LIKE ?', "%#{word}%") }
  scope :username_contain, ->(word) { joins(:user).where('username like ?', "%#{word}%") }
  scope :comment_body_contain, ->(word) { joins(:comments).where('comments.body like ? ', "%#{word}%") }
end
