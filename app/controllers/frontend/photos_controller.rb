module Frontend
  class PhotosController < FrontendController
    before_action only: [:show, :edit, :update, :destroy]
    
    def index
      @photos = Photo.most_recent
    end

    def show
      @photo = Photo.friendly.find(params[:id])
    end    
    

  end
end
