# frozen_string_literal: true

require 'application_system_test_case'

class RelationshipsTest < ApplicationSystemTestCase
  def setup
    user = create(:user)
    sign_in_as user
    @another_user = create(:user, email: 'bar@example.com')
  end

  test 'User can follow and unfollow other user' do
    click_link 'ユーザ'
    assert_selector 'h1', text: 'ユーザ'

    click_link '詳細', href: user_path(@another_user)
    assert_text 'bar@example.com'
    assert_text '0 フォロワー'
    assert_button 'フォローする'

    click_button 'フォローする'
    assert_text '1 フォロワー'
    assert_no_button 'フォローする'
    assert_button 'フォロー解除する'

    click_button 'フォロー解除する'
    assert_text '0 フォロワー'
  end
end
