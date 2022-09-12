# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  def setup
    sign_in_as users(:alpha)
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

  test 'User can edit report' do
    click_link '日報'
    click_link '編集'
    assert_selector 'h1', text: '日報の編集'
    assert_field 'タイトル', with: '最初の日報'
    assert_field '内容', with: '日報初投稿です！！！'

    fill_in 'タイトル', with: '二日目の日報'
    fill_in '内容', with: '二日目の日報です'
    click_button '更新する'
    assert_selector 'h1', text: '日報の詳細'
    assert_text '日報が更新されました'
    assert_text '二日目の日報'
    assert_text '二日目の日報です'
  end

  test 'User can delete report' do
    click_link '日報'
    assert_text '最初の日報'

    accept_confirm do
      click_link '削除'
    end
    assert_text '日報が削除されました。'
    assert_no_text '最初の日報'
  end
end
