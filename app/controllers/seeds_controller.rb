class SeedsController < ApplicationController

  def index
    @seeds = Seed.all
    @seed_cat = Seed.category(params[:id])
    @sport_seeds = Seed.category()
  end

  def new
    @seed = Seed.new
    @categories = Category.all
  end

  def create
     @seed = current_user.seeds.build(seed_params)
     @seed.save
    flash[:notice] = "Votre seed est maintenant en ligne"
    if @seed.save
      redirect_to seed_path(@seed)
    else
      render :new
    end
  end

  def show
    @seed = Seed.find(params[:id])
    @pick = Pick.new
    @user = current_user
  end

  def update
  end

  def edit
  end

  def destroy
  end




  private

  def seed_params
    params.require(:seed).permit(:title, :description, :category_id, photos: [])
  end


end
