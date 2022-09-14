# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    user = create(:user)
    sign_in_as user
    @book = create(:book, title: '鴎', memo: '太宰治の短編小説です。', author: '太宰治')
  end

  test 'visiting the index' do
    books = create_list(:book, 5)
    visit books_url
    assert_selector 'h1', text: '本'
    books.each do |book|
      assert_text book.title
    end
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: '初めての方でもわかりやすい内容です！'
    fill_in '著者', with: '五十嵐邦明'
    click_on '登録する'

    assert_text '本が作成されました'
    assert_text 'Ruby超入門'
    assert_text '初めての方でもわかりやすい内容です！'
    assert_text '五十嵐邦明'
  end

  test 'updating a Book' do
    visit books_url
    click_link '編集', href: edit_book_path(@book)
    assert_field 'タイトル', with: '鴎'
    assert_field 'メモ', with: '太宰治の短編小説です。'
    assert_field '著者', with: '太宰治'

    fill_in 'タイトル', with: 'ブラックジャック'
    fill_in 'メモ', with: '無免許の天才外科医ブラック・ジャックが活躍する医学ドラマです。'
    fill_in '著者', with: '手塚治虫'
    click_on '更新する'
    assert_text '本が更新されました。'
    assert_text 'ブラックジャック'
    assert_text '無免許の天才外科医ブラック・ジャックが活躍する医学ドラマです。'
    assert_text '手塚治虫'
  end

  test 'destroying a Book' do
    visit books_url
    assert_text '鴎'

    page.accept_confirm do
      click_link '削除', href: book_path(@book)
    end
    assert_text '本が削除されました'
    assert_no_text '鴎'
  end
end
