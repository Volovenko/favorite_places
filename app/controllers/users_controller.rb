# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    if params[:search].present?
      @users = User.search(params[:search])
      render 'show_search'
    else
      @users = users
    end
  end

  def show; end

  def users
    @fav_places = FavPlace.all.includes(place: :author)
    @fav_places_with_author = @fav_places.map do |fav_place|
      fav_place.attributes.merge(
        'place': fav_place.place,
        'author': fav_place.place.author
      )
    end
  @places_raiting = @fav_places_with_author.group(:likeable_id).count.sort_by { |_k, v| v }.reverse
  @top10_users = @places_raiting.uniq { |place| place.author }[0..10].map(&:author)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User was deleted forever'
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
