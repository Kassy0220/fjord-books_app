# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :icon

  validate :validate_file_type

  def validate_file_type
    return unless icon.attached?

    valid_file_types = %w(image/jpeg image/png image/gif)
    if !valid_file_types.include?(icon.blob.content_type)
      errors.add(:icon, I18n.t('errors.messages.invalid_file_type'))
    end
  end
end
