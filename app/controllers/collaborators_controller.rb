class CollaboratorsController < ApplicationController
  before_action :set_wiki

  def index
    @users = User.all
  end

  def create
    @collaborator = @wiki.collaborators.new(user_id: params[:user_id])

    if @collaborator.save
      flash[:alert] = "Collaborator added Successfully to #{@wiki.title}"
    else
      flash[:notice] = "Oops... The collaborator could not be added. Please try again!"
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:alert] = "Collaborator has been removed."
    else
      # flash oops
    end

    redirect_to wiki_collaborators_path(@wiki)

  end

  private

  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
