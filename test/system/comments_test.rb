# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  def setup
    sign_in_as users(:alpha)
    @book = books(:cherry_book)
  end

  test 'User can post comment on the book' do
    click_link '詳細', href: book_path(@book)
    assert_text '(コメントはまだありません)'

    fill_in 'comment_content', with: '私もこの本にお世話になりました'
    click_on 'コメントする'
    assert_no_text '(コメントはまだありません)'
    assert_text 'コメントが投稿されました。'
    assert_text '私もこの本にお世話になりました'
    assert_link 'Alpha' # コメント投稿者のリンク
  end
end
