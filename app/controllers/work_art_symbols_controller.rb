class WorkArtSymbolsController < ApplicationController
  before_action :set_work_art_symbol, only: [:show, :edit, :update, :destroy]

  # GET /work_art_symbols
  # GET /work_art_symbols.json
  def index
    @work_art_symbols = WorkArtSymbol.all
  end

  # GET /work_art_symbols/1
  # GET /work_art_symbols/1.json
  def show
  end

  # GET /work_art_symbols/new
  def new
    @work_art_symbol = WorkArtSymbol.new
  end

  # GET /work_art_symbols/1/edit
  def edit
  end

  # POST /work_art_symbols
  # POST /work_art_symbols.json
  def create
    @work_art_symbol = WorkArtSymbol.new(work_art_symbol_params)

    respond_to do |format|
      if @work_art_symbol.save
        format.html { redirect_to @work_art_symbol, notice: 'Work art symbol was successfully created.' }
        format.json { render :show, status: :created, location: @work_art_symbol }
      else
        format.html { render :new }
        format.json { render json: @work_art_symbol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_art_symbols/1
  # PATCH/PUT /work_art_symbols/1.json
  def update
    respond_to do |format|
      if @work_art_symbol.update(work_art_symbol_params)
        format.html { redirect_to @work_art_symbol, notice: 'Work art symbol was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_art_symbol }
      else
        format.html { render :edit }
        format.json { render json: @work_art_symbol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_art_symbols/1
  # DELETE /work_art_symbols/1.json
  def destroy
    @work_art_symbol.destroy
    respond_to do |format|
      format.html { redirect_to work_art_symbols_url, notice: 'Work art symbol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_art_symbol
      @work_art_symbol = WorkArtSymbol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_art_symbol_params
      params.require(:work_art_symbol).permit(:name)
    end
end
