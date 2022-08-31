# frozen_string_literal: true

class Books::CommentsController < CommentsController
  prepend_before_action :set_commentable

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end

  def render_when_unsaved
    @book = @commentable
    # books_controllerでセットされているインスタンス変数(@comment)が、空のコメントとして表示されないようにreloadする
    @comments = @commentable.comments.reload

    render 'books/show'
  end
end
