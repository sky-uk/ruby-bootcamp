class DogPicturesController < ApplicationController
  before_action :set_dog_picture, only: [:show, :edit, :update, :destroy]

  # GET /dog_pictures
  # GET /dog_pictures.json
  def index
    @dog_pictures = DogPicture.all
  end

  # GET /dog_pictures/1
  # GET /dog_pictures/1.json
  def show
  end

  # GET /dog_pictures/new
  def new
    @dog_picture = DogPicture.new
  end

  # GET /dog_pictures/1/edit
  def edit
  end

  # POST /dog_pictures
  # POST /dog_pictures.json
  def create
    @dog_picture = DogPicture.new(dog_picture_params)

    respond_to do |format|
      if @dog_picture.save
        format.html { redirect_to @dog_picture, notice: 'Dog picture was successfully created.' }
        format.json { render :show, status: :created, location: @dog_picture }
      else
        format.html { render :new }
        format.json { render json: @dog_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dog_pictures/1
  # PATCH/PUT /dog_pictures/1.json
  def update
    respond_to do |format|
      if @dog_picture.update(dog_picture_params)
        format.html { redirect_to @dog_picture, notice: 'Dog picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @dog_picture }
      else
        format.html { render :edit }
        format.json { render json: @dog_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dog_pictures/1
  # DELETE /dog_pictures/1.json
  def destroy
    @dog_picture.destroy
    respond_to do |format|
      format.html { redirect_to dog_pictures_url, notice: 'Dog picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog_picture
      @dog_picture = DogPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_picture_params
      params.require(:dog_picture).permit(:url, :name)
    end
end
