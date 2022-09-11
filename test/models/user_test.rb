# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @alpha = users(:alpha)
    @bravo = users(:bravo)
  end

  test "#name_or_email should return email when unnamed user" do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email
  end

  test "#name_or_email should return name when named user" do
    user = User.new(email: 'foo@example.com', name: 'Foo')
    assert_equal 'Foo', user.name_or_email
  end

  test "#follow should enable user to follow other user" do
    assert_difference '@alpha.followings.size', 1 do
      @alpha.follow @bravo
      @alpha.followings.reload
    end
  end

  test "#unfollow should enable user to unfollow other user" do
    @alpha.follow @bravo
    assert_difference '@alpha.followings.size', -1 do
      @alpha.unfollow @bravo
      @alpha.followings.reload
    end
  end
  
  test "#following? should return true when user is following other user" do
    assert_not @alpha.following?(@bravo)
    @alpha.follow @bravo
    assert @alpha.following?(@bravo)
  end

  test "#followed_by? should return true when user is followed by other user" do
    assert_not @alpha.followed_by?(@bravo)
    @bravo.follow @alpha
    assert @alpha.followed_by?(@bravo)
  end
end
