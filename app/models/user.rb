# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_followings, class_name: 'Following', foreign_key: 'follower_id',
                              dependent: :destroy, inverse_of: :follower 
  has_many :passive_followings, class_name: 'Following', foreign_key: 'followed_id',
                              dependent: :destroy, inverse_of: :followed
end
