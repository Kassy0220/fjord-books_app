# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  max_paginates_per 10
end
