class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new
 
    if flickr_params.present?
      @flickr_id = flickr_params
      @photos = flickr.photos.search :user_id => @flickr_id
    end
  end

  private

  def flickr_params
    params[:flickr_id]
  end
end
