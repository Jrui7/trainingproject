class SeedsController < ApplicationController



  def index

    @categories = Category.all
    @filter = params[:category]
    @seeds = Seed.where(category: params[:category])
    unless @filter && @seeds.any?
      @seeds = Seed.all
      @condition = false
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

    if @seed.valid?
      @seed.set_expiration
      @seed.set_view_counter
      @seed.set_popularity
      @seed.save
      flash[:notice] = "Votre seed est maintenant en ligne"
      redirect_to seed_path(@seed)
    else
      render :new
    end
  end

  def show
    @seed = Seed.find(params[:id])
    @seed.increment_views
    @seed.increment_popularity
    @pick = Pick.new
    @user = current_user
    @photos = []
    @seed.photos.each do |photo|
      @photos << photo
    end



    @collections = []
    @user.picks.each do |pick|
      @collections << pick.seed.id
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def last_day
    @seed_sample = Seed.all.sample
    @categories = Category.all
    @seeds = []
    seeds = Seed.all
    seeds.each do |seed|
      if seed.last_day?
        @seeds << seed
      end
    end
  end

  def popular
    @categories = Category.all
    @seeds = Seed.popular
  end

  def newest
    @categories = Category.all
    @seeds = Seed.newest
  end


  private

  def seed_params
    params.require(:seed).permit(:title, :description, :category_id, :url, :secondary_url, photos: [])
  end


end

