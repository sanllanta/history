class ArtworksController < ApplicationController
  before_filter :authenticate_user!, except:[:index,:show]
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:edit, :new]

  # GET /artworks
  # GET /artworks.json
  def index

    if not params[:search].nil? and not params[:search].to_s.empty?

      artworksTemp = Artwork.b_title(params[:search])
      # s_description = Artwork.s_descriptions(params[:search])
      #
      # s_description.each do |artworkt|
      #   artworksTemp << artworkt
      # end

      s_synthesis = Artwork.b_synthesis(params[:search])

      s_synthesis.each do |artworkt|
        artworksTemp << artworkt
      end

      b_place = Artwork.b_place(params[:search])

      b_place.each do |artworkt|
        artworksTemp << artworkt
      end

      b_category_1 = Artwork.b_category_1(params[:search])

      b_category_1.each do |artworkt|
        artworksTemp << artworkt
      end

      b_category_1 = Artwork.b_category_1(params[:search])

      b_category_1.each do |artworkt|
        artworksTemp << artworkt
      end

      b_category_2 = Artwork.b_category_2(params[:search])

      b_category_2.each do |artworkt|
        artworksTemp << artworkt
      end

      b_category_3 = Artwork.b_category_3(params[:search])

      b_category_3.each do |artworkt|
        artworksTemp << artworkt
      end

      b_category_4 = Artwork.b_category_4(params[:search])

      b_category_4.each do |artworkt|
        artworksTemp << artworkt
      end

      b_category_5 = Artwork.b_category_5(params[:search])

      b_category_5.each do |artworkt|
        artworksTemp << artworkt
      end

      b_comment = Artwork.b_comment(params[:search])

      b_comment.each do |artworkt|
        artworksTemp << artworkt
      end

      b_scene = Artwork.b_scene(params[:search])

      b_scene.each do |artworkt|
        artworksTemp << artworkt
      end

      b_story_types = Artwork.b_story_types(params[:search])

      b_story_types.each do |artworkt|
        artworksTemp << artworkt
      end

      b_author = Artwork.b_author(params[:search])

      b_author.each do |artworkt|
        artworksTemp << artworkt
      end
      p artworksTemp
    end

    if params[:authors] == ('true')
      @authors = Author.all
      @authors = @authors.paginate(:per_page => 20, :page => params[:page])
    else

      #Define la cantidad de obras que se muestran en cada uno de los tipos de vistas
      if not params[:topic].nil?
        p "LLAMA A TODOS"
        artworksTemp = Artwork.where(category_1: params[:topic])
      elsif not params[:author_show].nil?
        artworksTemp = Artwork.where(author_id: params[:author_show])
      elsif not params[:region_show].nil?
        place=Place.where(:name =>params[:region_show])
        artworksTemp = Artwork.where(place_id: place)
      else

        if params[:search].to_s.empty?
          artworksTemp = Artwork.all
        end
      end

      if params[:authors].nil? and not params[:category].nil? and params[:place].nil?
        p "1"
        artworksTemp = artworksTemp.search_category(params[:category])

        @authors = Hash.new
        artworksTemp.each do |artwork|
          author = artwork.author
          if author != nil
            if !@authors[author]
              @authors[author] = author
            end
          end
        end

        @clasifications = Hash.new
        artworksTemp.each do |artwork|
          category = artwork.category_1
          if category != nil
            if !@clasifications[category]
              @clasifications[category] = category
            end
          end
        end

        @places = Hash.new

        artworksTemp.each do |artwork|
          place = artwork.place
          if place != nil
            if !@places[place]
              @places[place] = place
            end
          end
        end

        @artworks = WillPaginate::Collection.create(page, 20, artworksTemp.length) do |pager|
          pager.replace artworksTemp
        end
        if params[:authors] == ('true')
          #@authors = @authors.paginate(:per_page => 8, :page => params[:page])
        end
      elsif params[:authors].nil? and params[:category].nil? and not params[:place].nil?
        p "2"
        artworksTemp = artworksTemp.search_place(params[:place])

        @authors = Hash.new
        artworksTemp.each do |artwork|
          author = artwork.author
          if author != nil
            if !@authors[author]
              @authors[author] = author
            end
          end
        end

        @clasifications = Hash.new
        artworksTemp.each do |artwork|
          category = artwork.category_1
          if category != nil
            if !@clasifications[category]
              @clasifications[category] = category
            end
          end
        end

        @places = Hash.new
        artworksTemp.each do |artwork|
          place = artwork.place
          if place != nil
            if !@places[place]
              @places[place] = place
            end
          end
        end

        @artworks = WillPaginate::Collection.create(page, 20, artworksTemp.length) do |pager|
          pager.replace artworksTemp
        end
        if params[:authors] == ('true')
          #@authors = @authors.paginate(:per_page => 8, :page => params[:page])
        end
      elsif not params[:authors].nil? and params[:category].nil? and params[:place].nil?
        p "3"
        artworksTemp = artworksTemp.search_author(params[:authors])

        @authors = Hash.new
        artworksTemp.each do |artwork|
          author = artwork.author
          if author != nil
            if !@authors[author]
              @authors[author] = author
            end
          end
        end

        @clasifications = Hash.new
        artworksTemp.each do |artwork|
          category = artwork.category_1
          if category != nil
            if !@clasifications[category]
              @clasifications[category] = category
            end
          end
        end

        @places = Hash.new

        artworksTemp.each do |artwork|
          place = artwork.place
          if place != nil
            if !@places[place]
              @places[place] = place
            end
          end
        end

        @artworks = WillPaginate::Collection.create(page, 20, artworksTemp.length) do |pager|
          pager.replace artworksTemp
        end
        if params[:authors] == ('true')
          #@authors = @authors.paginate(:per_page => 8, :page => params[:page])
        end
      elsif not params[:authors].nil? and not params[:category].nil? and params[:place].nil?
        p "4"
        artworksTemp = artworksTemp.search_author(params[:authors])
        artworksTemp = artworksTemp.search_category(params[:category])

        @authors = Hash.new
        artworksTemp.each do |artwork|
          author = artwork.author
          if author != nil
            if !@authors[author]
              @authors[author] = author
            end
          end
        end

        @clasifications = Hash.new
        artworksTemp.each do |artwork|
          category = artwork.category_1
          if category != nil
            if !@clasifications[category]
              @clasifications[category] = category
            end
          end
        end

        @places = Hash.new

        artworksTemp.each do |artwork|
          place = artwork.place
          if place != nil
            if !@places[place]
              @places[place] = place
            end
          end
        end

        @artworks = WillPaginate::Collection.create(page, 20, artworksTemp.length) do |pager|
          pager.replace artworksTemp
        end
        if params[:authors] == ('true')
          #@authors = @authors.paginate(:per_page => 8, :page => params[:page])
        end
      elsif not params[:authors].nil? and not params[:category].nil? and not params[:place].nil?
        p "5"
        artworksTemp = artworksTemp.search_author(params[:authors])
        artworksTemp = artworksTemp.search_category(params[:category])
        artworksTemp = artworksTemp.search_place(params[:place])

        @authors = Hash.new
        artworksTemp.each do |artwork|
          author = artwork.author
          if author != nil
            if !@authors[author]
              @authors[author] = author
            end
          end
        end

        @clasifications = Hash.new
        artworksTemp.each do |artwork|
          category = artwork.category_1
          if category != nil
            if !@clasifications[category]
              @clasifications[category] = category
            end
          end
        end

        @places = Hash.new

        artworksTemp.each do |artwork|
          place = artwork.place
          if place != nil
            if !@places[place]
              @places[place] = place
            end
          end
        end

        @artworks = WillPaginate::Collection.create(page, 20, artworksTemp.length) do |pager|
          pager.replace artworksTemp
        end
        if params[:authors] == ('true')
          #@authors = @authors.paginate(:per_page => 8, :page => params[:page])
        end
      else
        p "6"
        @authors = Hash.new
        artworksTemp.each do |artwork|
          author = artwork.author
          if author != nil
            if !@authors[author]
              @authors[author] = author
            end
          end
        end

        @clasifications = Hash.new
        artworksTemp.each do |artwork|
          category = artwork.category_1
          if category != nil
            if !@clasifications[category]
              @clasifications[category] = category
            end
          end
        end

        @places = Hash.new
        artworksTemp.each do |artwork|
          place = artwork.place
          if place != nil
            if !@places[place]
              @places[place] = place
            end
          end
        end

        p artworksTemp

        @artworks = artworksTemp
        p params[:page].nil?
        page =1
        if not params[:page].nil?
          page = params[:page]
        end
        @artworks = WillPaginate::Collection.create(page, 20, artworksTemp.length) do |pager|
          pager.replace artworksTemp
        end
        if params[:authors] == ('true')

          #@authors = @authors.paginate(:per_page => 8, :page => params[:page])
        end
      end

      if params[:region] == ('true')
        @places = Hash.new
        @json_places = Hash.new
        artworksTemp.each do |artwork|
          place = artwork.place
          if place != nil
            if !@places[place]
              @json_places[place.code] = 1
              @places[place] = place
            else
              @json_places[place.code] += 1
            end
          end
        end
      end

    end

  end

  # GET /artworks/1
  # GET /artworks/1.json
  def show
  end

  # GET /artworks/1
  # GET /artworks/1.json
  def admin
    @artworks = Artwork.all
  end

  # GET /artworks/new
  def new
    @artwork = Artwork.new
    set_categories
    if params[:action] == "new"
      # @artwork.descriptions.new
      # @artwork.artwork_symbols.new
      # @artwork.iconographic_attributes.new
      # @artwork.engravings.new
      # #@artwork.author = Author.new
      # @artwork.donor = Donor.new
      # @artwork.origin = Origin.new
      # @artwork.passage = Passage.new
      # @artwork.phylactery_billboard = PhylacteryBillboard.new
      # @artwork.scene = Scene.new
      # @artwork.place = Place.new
      # @artwork.school = School.new
      # @artwork.source = Source.new
      # @artwork.story_type = StoryType.new
      # @artwork.type = Type.new
    end
  end

  # GET /artworks/1/edit
  def edit
  end

  # POST /artworks
  # POST /artworks.json
  def create
    @artwork = Artwork.new(artwork_params)

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
          set_categories
          format.html { render :new }
          format.json { render json: @artwork.errors, status: :unprocessable_entity }
        end
      else
        set_categories
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
          set_categories
          format.html { render :edit }
          format.json { render json: @artwork.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def send_image
    artwork_id = params[:artwork][:id]
    artwork = Artwork.find(artwork_id)
    p artwork.avatar.url
    send_file Rails.public_path.to_s << artwork.avatar.url.to_s.split('?')[0]
  end

  # DELETE /artworks/1
  # DELETE /artworks/1.json
  def destroy
    @artwork.destroy
    respond_to do |format|
      format.html { redirect_to artworks_url(:parent_id => params[:parent_id] ), notice: 'Artwork was successfully destroyed.' }
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
    params.require(:artwork).permit(:passage_id, :color,  :place_id, :scene_id, :source_id, :origin_id, :donor_id, :category_1_id, :category_2_id, :category_3_id, :category_4_id, :category_5_id,
                                    :phylactery_billboard_id, :story_type_id, :school_id,:author_id, :title, :activity, :biographic_data, :signed, :synthesis,
                                    :biographic_comment, :annotation, :avatar, :sub_image, :comment,
                                    :latitude_origin,:latitude_current,:longitude_origin,:longitude_current, :type_id,
                                    descriptions_attributes:[:id,:description,:_destroy],
                                    author_attributes:[:id,:name,:_destroy],
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
                                    type_attributes:[:id,:name,:_destroy],
                                    :description_ids=>[],:artwork_symbol_ids=>[]
    )
  end

  #Set categories when editing artworks
  def set_categories
    @categories = Category.all
    @categories_for_select_1 = []
    @categories_for_select_2 = []
    @categories_for_select_3 = []
    @categories_for_select_4 = []
    @categories_for_select_5 = []
    @categories.each do |category|
      if(category.depth == 0)
        @categories_for_select_1 << [category.name, category.id]
      end
    end

    if @artwork
      if @artwork.category_1
        @categories = @artwork.category_1.children
        @categories.each do |category|
          @categories_for_select_2 << [category.name, category.id]
        end
      end

      if @artwork.category_2
        @categories = @artwork.category_2.children
        @categories.each do |category|
          @categories_for_select_3 << [category.name, category.id]
        end
      end

      if @artwork.category_3
        @categories = @artwork.category_3.children
        @categories.each do |category|
          @categories_for_select_4 << [category.name, category.id]
        end
      end

      if @artwork.category_4
        @categories = @artwork.category_4.children
        @categories.each do |category|
          @categories_for_select_5 << [category.name, category.id]
        end
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
