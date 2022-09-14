# frozen_string_literal: true

FactoryBot.define do
  factory :book, class: 'Book' do
    sequence(:title) { |n| "サンプル本No.#{n}" }
  end
end
