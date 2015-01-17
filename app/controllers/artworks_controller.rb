class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]

  # GET /artworks
  # GET /artworks.json
  def index
    @artworks = Artwork.all
  end

  # GET /artworks/1
  # GET /artworks/1.json
  def show
  end

  # GET /artworks/new
  def new
    @artwork = Artwork.new
    if params[:action] == "new"
      @artwork.descriptions.new
      @artwork.artwork_symbols.new
      @artwork.iconographic_attributes.new
      @artwork.engravings.new
      @artwork.donor = Donor.new
      @artwork.origin = Origin.new
      @artwork.passage = Passage.new
      @artwork.phylactery_billboard = PhylacteryBillboard.new
      @artwork.scene = Scene.new
      @artwork.place = Place.new
      @artwork.school = School.new
      @artwork.source = Source.new
      @artwork.story_type = StoryType.new
      @artwork.type = Type.new
    end
  end

  # GET /artworks/1/edit
  def edit

  end

  # POST /artworks
  # POST /artworks.json
  def create

    @artwork = Artwork.new

    @artwork.save
    if !artwork_params[:avatar].nil?
      @artwork.update_attribute(:avatar, artwork_params[:avatar])
    end

    respond_to do |format|
      if @artwork.save
        if @artwork.update(artwork_params)
          format.html { redirect_to @artwork, notice: 'Artwork was successfully created.' }
          format.json { render :show, status: :created, location: @artwork }
        else
          format.html { render :new }
          format.json { render json: @artwork.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /artworks/1
  # PATCH/PUT /artworks/1.json
  def update

    custom_artwork_params = artwork_params

    delete_attributes(params, custom_artwork_params)

    if params[:id] == 'send_image'
      send_image
    else
      respond_to do |format|
        if @artwork.update(custom_artwork_params)
          format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }
          format.json { render :show, status: :ok, location: @artwork }
        else
          format.html { render :edit }
          format.json { render json: @artwork.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def send_image
    artwork_id = params[:artwork][:id]
    artwork = Artwork.find(artwork_id)
    send_file Rails.public_path.to_s << artwork.avatar.url.to_s.split('?')[0]
  end

  # DELETE /artworks/1
  # DELETE /artworks/1.json
  def destroy
    @artwork.destroy
    respond_to do |format|
      format.html { redirect_to artworks_url, notice: 'Artwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_artwork
    if params[:id]!='send_image'
      @artwork = Artwork.find(params[:id])
    else
      @artwork = Artwork.find(params[:artwork][:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def artwork_params
    params.require(:artwork).permit(:passage_id, :place_id, :scene_id, :source_id, :origin_id, :donor_id,
                                    :phylactery_billboard_id, :story_type_id, :school_id, :author, :activity, :biographic_data, :signed, :synthesis,
                                    :biographic_comment, :annotation, :avatar, :sub_image, :comment,
                                    :latitude_origin,:latitude_current,:longitude_origin,:longitude_current, :type_id,
                                    descriptions_attributes:[:id,:description,:_destroy],
                                    iconographic_attributes_attributes:[:id,:name,:_destroy],
                                    artwork_symbols_attributes:[:id,:name,:_destroy],
                                    engravings_attributes:[:id,:name,:_destroy],
                                    donor_attributes:[:id,:name,:_destroy],
                                    origin_attributes:[:id,:name,:_destroy],
                                    passage_attributes:[:id,:name,:_destroy],
                                    phylactery_billboard_attributes:[:id,:name,:_destroy],
                                    scene_attributes:[:id,:name,:_destroy],
                                    place_attributes:[:id,:name,:_destroy],
                                    scene_attributes:[:id,:name,:_destroy],
                                    school_attributes:[:id,:name,:_destroy],
                                    source_attributes:[:id,:name,:_destroy],
                                    story_type_attributes:[:id,:name,:_destroy],
                                    type_attributes:[:id,:name,:_destroy]
    )
  end

  def build_artwork

  end

  # Get all the categories for selection
  def set_categories
    @categories = Category.all
    @categories_first_level = []
    @categories_for_dropdown = []
    @categories.each do |i|
    if(i.parent)
      @categories_for_dropdown = @categories_for_dropdown << [i.name,i.id,{:class => i.parent.id}]
    else
      @categories_first_level = @categories_first_level << [i.name,i.id]
    end
  end

  end

  #Elimina los atributos marcados desde la vista de edición
  def delete_attributes(params_hash, custom_artwork_params)
    if params_hash[:delete_passage]
      custom_artwork_params.delete :passage_id
      @artwork.passage = nil
    end

    if params_hash[:delete_place]
      custom_artwork_params.delete :place_id
      @artwork.place = nil
    end

    if params_hash[:delete_scene]
      custom_artwork_params.delete :scene_id
      @artwork.scene = nil
    end

    if params_hash[:delete_type]
      custom_artwork_params.delete :type_id
      @artwork.type = nil
    end

    if params_hash[:delete_source]
      custom_artwork_params.delete :source_id
      @artwork.source = nil
    end

    if params_hash[:delete_origin]
      custom_artwork_params.delete :origin_id
      @artwork.origin = nil
    end

    if params_hash[:delete_donor]
      custom_artwork_params.delete :donor_id
      @artwork.donor = nil
    end

    if params_hash[:delete_phylactery_billboard]
      custom_artwork_params.delete :phylactery_billboard_id
      @artwork.phylactery_billboard = nil
    end

    if params_hash[:delete_story_type]
      custom_artwork_params.delete :story_type_id
      @artwork.story_type = nil
    end

    if params_hash[:delete_school]
      custom_artwork_params.delete :school_id
      @artwork.school = nil
    end
  end

end
