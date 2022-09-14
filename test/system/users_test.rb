# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  def setup
    @user = create(:user)
    sign_in_as @user
  end

  test 'User can add avatar image to profile' do
    click_link 'アカウント編集'
    assert_selector 'h2', text: 'アカウント編集'
    assert_not @user.avatar.attached?

    attach_file 'ユーザ画像', Rails.root.join('test/factories/files/avatar-1.png')
    fill_in '現在のパスワード', with: 'password'
    click_button '更新'
    assert @user.reload.avatar.attached?
    assert_selector "img[src$='avatar-1.png']"
  end
end
