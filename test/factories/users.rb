# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    email { 'foo@example.com' }
    password { 'password' }
  end
end
