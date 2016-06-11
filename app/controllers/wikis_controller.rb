class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  # GET /wikis
  def index
    @wikis = policy_scope(Wiki)
    #@wikis = policy_scope(Wiki.order(created_at: :desc)) #Orders Wiki's on Index View by Ascending Order or Newest First
  end

  # GET /wikis/1 or /wikis/slug
  def show
    authorize @wiki
    @wiki = Wiki.friendly.find(params[:id])
  end

  # GET /wikis/new
  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  # GET /wikis/1/edit
  def edit
    authorize @wiki
  end

  # POST /wikis
  def create
    @wiki = current_user.wikis.new(wiki_params)
    authorize @wiki

    if @wiki.save
      redirect_to @wiki , notice: 'Wiki was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /wikis/1
  def update
    authorize @wiki
    if @wiki.update(wiki_params)
      @wiki.slug = nil #to update the slug it must be emptied and set to nil
      @wiki.save! # re-save the wiki so the new slug is generated
      redirect_to @wiki, notice: 'Wiki was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wikis/1
  def destroy
    authorize @wiki
    @wiki.destroy
    redirect_to wikis_url, notice: 'Wiki was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wiki_params
      params.require(:wiki).permit(:title, :body, :private, :user_id)
    end
end
