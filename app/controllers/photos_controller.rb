class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create 
    #puts "What is going on here?"
    @place = Place.find(params[:place_id])
    puts photos_params.merge(user: current_user)
    # puts @place.inspect
    #puts "params", photos_params
    #puts @place.photos.inspect
    #Photo.create(photos_params)
    @place.photos.create(photos_params.merge(user: current_user))
    #puts "We shall see if this appears"
    redirect_to place_path(@place)

  end 


  private

  def photos_params 
    params.require(:photo).permit(:caption, :picture, :user_id, :place_id)
  end  
end
