class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new

    if params[:flickr_id]
      @flickr_id = flickr_params

      @photos = flickr.people.getPublicPhotos :user_id => @flickr_id
    end
  end

  private

  def flickr_params
    params[:flickr_id]
  end
end
