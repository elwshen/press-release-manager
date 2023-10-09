class PressReleasesController < ApplicationController
  def index
    if !user_signed_in? 
      redirect_to :root
    elsif current_user.role == "publisher_admin"
      @pressReleases = PressRelease.all
    else
      @organizations = Organization.where(user_id: current_user.id)
      @pressReleases = PressRelease.where(organization_id: (@organizations).map{|org| org.id})
    end
  end

  def show
    @pressRelease = PressRelease.find(params[:id])
  end

  def new
    @pressRelease = PressRelease.new
    @organizations = Organization.where(user_id: current_user.id)
  end

  def create
    @pressRelease = PressRelease.new(press_release_params.merge(publish_date: DateTime.now))
    if @pressRelease.save
      redirect_to @pressRelease
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def press_release_params
    params.require(:press_release).permit(:title, :content, :publish_date, :organization_id)
  end
end
