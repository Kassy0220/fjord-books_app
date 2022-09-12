# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  def setup
    visit new_user_session_path
    fill_in 'Eメール', with: 'alpha@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  test 'User can write daily report' do
    click_link '日報'
    assert_selector 'h1', text: '日報'

    click_link '新規作成'
    assert_selector 'h1', text: '日報の新規作成'

    fill_in 'タイトル', with: 'Railsのテスト'
    fill_in '内容', with: '操作をシミュレートするシステムテストは面白いです！'
    click_button '登録する'
    assert_selector 'h1', text: '日報の詳細'
    assert_text '日報が作成されました。'
    assert_text 'Railsのテスト'
    assert_text '操作をシミュレートするシステムテストは面白いです！'
    assert_text 'Alpha'
  end
end

