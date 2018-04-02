class SponsorsController < ApplicationController
  before_action :find_sponsor, only: [:edit, :update, :destroy]
  before_action :authenticate, only: [:admin, :new, :create, :edit, :update, :destroy]

  def new
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)

    if @sponsor.save
      redirect_to root_path, notice: "Sponsor was created!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @sponsor.update(sponsor_params)
      redirect_to root_path, notice: "Sponsor was updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @sponsor.destroy
    redirect_to root_path, notice: "Sponsor destroyed"
  end

  private

    def sponsor_params
      params.require(:sponsor).permit(:name, :image, :url)
    end

    def find_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

end
