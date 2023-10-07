class PressReleasesController < ApplicationController
  def index
    @pressReleases = PressRelease.all
  end

  def show
    @pressRelease = PressRelease.find(params[:id])
  end

  def new
    @pressRelease = PressRelease.new
  end

  def create
    @organization = Organization.where(name: press_release_params["organization_name"]).take
    @pressRelease = PressRelease.new({organization_id: @organization.id, title: press_release_params["title"], content: press_release_params["content"], publish_date: DateTime.now})
    if @pressRelease.save
      redirect_to @pressRelease
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def press_release_params
    params.require(:press_release).permit(:title, :content, :publish_date, :organization_name)
  end
end
