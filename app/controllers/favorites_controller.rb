class FavoritesController < ApplicationController
  before_action :authenticate_user!
  # POST /books/:book_id/favorites
  # POST /favorites.json
  def create
    # if !Favorite.find_by(book_id: params[:book_id], user_id: current_user.id).exists?
      @favorite = current_user.favorites.new(:book_id => params[:book_id])
      @favorite.save
      #redirect_to books_path
    
  end


  # DELETE /books/:book_id/favorites/
  def destroy
    # if Favorite.find(book_id: params[:book_id], user_id: current_user.id).exists?
      @favorite = Favorite.find_by(user_id: current_user, book_id: params[:book_id])
      @favorite.destroy
      #redirect_to books_path
  end
end
