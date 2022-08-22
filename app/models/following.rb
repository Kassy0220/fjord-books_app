# frozen_string_literal: true

class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User', inverse_of: :active_followings
  belongs_to :followed, class_name: 'User', inverse_of: :passive_followings

  validates :follower_id, presence: true, uniqueness: { scope: :followed_id }
  validates :followed_id, presence: true
end
