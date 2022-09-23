# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = create(:user)
    @another_user = create(:user, email: 'bar@example.com')
  end

  test '#name_or_email should return email when unnamed user' do
    user = build(:user)
    assert_equal 'foo@example.com', user.name_or_email
  end

  test '#name_or_email should return name when named user' do
    user = build(:user, name: 'Foo')
    assert_equal 'Foo', user.name_or_email
  end

  test '#follow should enable user to follow other user' do
    assert_difference '@user.followings.size', 1 do
      @user.follow @another_user
      @user.followings.reload
    end
  end

  test '#unfollow should enable user to unfollow other user' do
    @user.follow @another_user
    assert_difference '@user.followings.size', -1 do
      @user.unfollow @another_user
      @user.followings.reload
    end
  end

  test '#following? should return true when user is following other user' do
    assert_not @user.following?(@another_user)
    @user.follow @another_user
    assert @user.following?(@another_user)
  end

  test '#followed_by? should return true when user is followed by other user' do
    assert_not @user.followed_by?(@another_user)
    @another_user.follow @user
    assert @user.followed_by?(@another_user)
  end
end
