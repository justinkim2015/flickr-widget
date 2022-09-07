require 'flickr'

class StaticPagesController < ApplicationController

  def index
    begin
      flickr = Flickr.new

      unless params[:id].nil?
        @photos = flickr.photos.search :user_id => params[:id]
      end
    rescue StandardError => error_info
      flash[:alert] = "#{error_info.message}. Please try again..."
      redirect_to root_path
    end
  end

end
