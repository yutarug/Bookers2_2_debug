class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.book_comments.new(comment_params)
    @comment.book_id = params[:book_id]
    @comment.save
    @book = @comment.book
    @comment_new = BookComment.new
    # redirect_to books_path
  end

  def destroy
    @comment = BookComment.find(params[:id])
    @comment.destroy
    @book = @comment.book
    @comment_new = BookComment.new
    # redirect_to books_path
  end

  private
  def comment_params
    params.require(:book_comment).permit(:body)
  end
end
