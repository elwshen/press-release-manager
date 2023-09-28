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
    @pressRelease = PressRelease.new(press_release_params.merge(publish_date: DateTime.now))

    if @pressRelease.save
      redirect_to @pressRelease
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def press_release_params
    params.require(:press_release).permit(:title, :content, :publish_date)
  end
end
