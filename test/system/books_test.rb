# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    sign_in_as users(:alpha)
    @book = books(:cherry_book)
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
    books = Book.all
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
    assert_field 'タイトル', with: 'プロを目指す人のためのRuby入門'
    assert_field 'メモ', with: '深い内容まで丁寧に解説してある名著です！'
    assert_field '著者', with: '伊藤淳一'

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
    assert_text 'プロを目指す人のためのRuby入門'

    page.accept_confirm do
      click_link '削除', href: book_path(@book)
    end
    assert_text '本が削除されました'
    assert_no_text 'プロを目指す人のためのRuby入門'
  end
end
