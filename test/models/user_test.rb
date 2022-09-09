# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#name_or_email should return email when unnamed user" do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email
  end

  test "#name_or_email should return name when named user" do
    user = User.new(email: 'foo@example.com', name: 'Foo')
    assert_equal 'Foo', user.name_or_email
  end

  test "#follow should enable user to follow other user" do
    alpha = User.create!(email: 'alpha@example.com', password: 'password')
    bravo = User.create!(email: 'bravo@example.com', password: 'password')
    assert_difference 'alpha.followings.size', 1 do
      alpha.follow bravo
      alpha.followings.reload
    end
  end

  test "#unfollow should enable user to unfollow other user" do
    alpha = User.create!(email: 'alpha@example.com', password: 'password')
    bravo = User.create!(email: 'bravo@example.com', password: 'password')
    alpha.follow bravo
    assert_difference 'alpha.followings.size', -1 do
      alpha.unfollow bravo
      alpha.followings.reload
    end
  end
end
