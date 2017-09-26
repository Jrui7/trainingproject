class SeedsController < ApplicationController

  def index



    #si on a rien dans les params, renvoie tous les seeds
    #si on a des params mais pas de seed correspondant aux params, renvoie tous les seeds
    #si on a des params et des seeds qui correspondent aux params, renvoies les seeds qui correspondent aux params

    @categories = Category.all
    @filter = params[:category]
    @seeds = Seed.where(category: params[:category])
    if @filter && @seeds.any?
      @seeds
      @filter
    elsif @filter && @seeds.empty?
      @seeds = Seed.all
      @filter = false
    else
      @seeds = Seed.all
      @filter = false
    end
    respond_to do |format|
      format.html {seeds_path}
      format.js
    end

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

