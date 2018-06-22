class ArticleSoumisController < ApplicationController
  before_action :set_article_soumi, only: [:show, :edit, :update, :destroy]

  # GET /article_soumis
  # GET /article_soumis.json
  def index
    @article_soumis = ArticleSoumi.all
  end

  # GET /article_soumis/1
  # GET /article_soumis/1.json
  def show
  end

  # GET /article_soumis/new
  def new
    @article_soumi = ArticleSoumi.new
  end

  # GET /article_soumis/1/edit
  def edit
  end

  # POST /article_soumis
  # POST /article_soumis.json
  def create
    @article_soumi = ArticleSoumi.new(article_soumi_params)

    respond_to do |format|
      if @article_soumi.save
        format.html { redirect_to @article_soumi, notice: 'Article soumi was successfully created.' }
        format.json { render :show, status: :created, location: @article_soumi }
      else
        format.html { render :new }
        format.json { render json: @article_soumi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_soumis/1
  # PATCH/PUT /article_soumis/1.json
  def update
    respond_to do |format|
      if @article_soumi.update(article_soumi_params)
        format.html { redirect_to @article_soumi, notice: 'Article soumi was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_soumi }
      else
        format.html { render :edit }
        format.json { render json: @article_soumi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_soumis/1
  # DELETE /article_soumis/1.json
  def destroy
    @article_soumi.destroy
    respond_to do |format|
      format.html { redirect_to article_soumis_url, notice: 'Article soumi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_soumi
      @article_soumi = ArticleSoumi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_soumi_params
      params.require(:article_soumi).permit(:title, :content)
    end
end
