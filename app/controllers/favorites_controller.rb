class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    micropost.like(current_user)
    flash[:success] = '投稿をお気に入りしました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    micropost.unlike(current_user)
    flash[:success] = '投稿をお気に入りから外しました'
    redirect_back(fallback_location: root_path)
  end
end
