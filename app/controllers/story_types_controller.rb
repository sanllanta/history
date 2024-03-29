class StoryTypesController < ApplicationController
  before_action :set_story_type, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /story_types
  # GET /story_types.json
  def index
    @story_types = StoryType.all
  end

  # GET /story_types/1
  # GET /story_types/1.json
  def show
  end

  # GET /story_types/new
  def new
    @story_type = StoryType.new
  end

  # GET /story_types/1/edit
  def edit
  end

  # POST /story_types
  # POST /story_types.json
  def create
    @story_type = StoryType.new(story_type_params)

    respond_to do |format|
      if @story_type.save
        format.html { redirect_to @story_type, notice: 'Story type was successfully created.' }
        format.json { render :show, status: :created, location: @story_type }
      else
        format.html { render :new }
        format.json { render json: @story_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /story_types/1
  # PATCH/PUT /story_types/1.json
  def update
    respond_to do |format|
      if @story_type.update(story_type_params)
        format.html { redirect_to @story_type, notice: 'Story type was successfully updated.' }
        format.json { render :show, status: :ok, location: @story_type }
      else
        format.html { render :edit }
        format.json { render json: @story_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /story_types/1
  # DELETE /story_types/1.json
  def destroy
    @story_type.destroy
    respond_to do |format|
      format.html { redirect_to story_types_url, notice: 'Story type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story_type
      @story_type = StoryType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_type_params
      params.require(:story_type).permit(:name)
    end
end
