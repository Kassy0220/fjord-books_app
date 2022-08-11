# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  max_paginates_per 5

  validates :name, presence: true
  validates :post_code, format: { with: /\d{3}-\d{4}/ }, on: :update, allow_blank: true
  validates :biography, length: { maximum: 150 }, on: :update, allow_blank: true
end
