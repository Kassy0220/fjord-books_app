# frozen_string_literal: true

FactoryBot.define do
  factory :report, class: 'Report' do
    association :user
    title { '最初の日報' }
    content { '日報初投稿です！！！' }
  end
end
