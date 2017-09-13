class SeedsController < ApplicationController

  def index
    @seeds = Seed.all
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

  def my_seedoak
    user_preferences = UserPreference.where(user_id: current_user)

    categories = []

    user_preferences.each do |preference|
      categories << preference.category_id
    end

    @seeds = Seed.where(category_id: categories)
  end

  def my_seeds
    @seeds = Seed.where(user_id: current_user)
  end


  private

  def seed_params
    params.require(:seed).permit(:title, :description, :category_id, photos: [])
  end


end
