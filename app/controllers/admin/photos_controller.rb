module Admin 
  class PhotosController < AdminController
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    
    def index
      @photos = Photo.most_recent
    end

    def show
    end

    def new
      @photo= Photo.new
    end

    def edit
    end

    def create
      @photo = Photo.new(photo_params)

      respond_to do |format|
        if @photo.save
          format.html { redirect_to author_post_path(@photo), notice: 'Photo was successfully created.' }
          format.json { render :show, status: :created, location: @photo }
        else
          format.html { render :new }
          format.json { render json: @photo.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /photos/1
    # PATCH/PUT /photos/1.json
    def update
      respond_to do |format|
        if @photo.update(photo_params)
          format.html { redirect_to author_post_path(@photo), notice: 'Photo was successfully updated.' }
          format.json { render :show, status: :ok, location: @photo }
        else
          format.html { render :edit }
          format.json { render json: @photo.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /photos/1
    # DELETE /photos/1.json
    def destroy
      @photo.destroy
      respond_to do |format|
        format.html { redirect_to admin_photos_url, notice: 'Picture was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_photo
        @photo = Photo.friendly.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def photo_params
        params.require(:photo).permit(:title, :body, :description, :photo_url_original)
      end
  end

end
