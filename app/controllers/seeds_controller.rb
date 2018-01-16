class SeedsController < ApplicationController



  def index
    if Seed.ongoing.any? == true
      @sample = Seed.ongoing.sample
    else
      @sample = Seed.expired.sample
    end
    @categories = Category.all
    @filter = params[:category]
    @seeds = Seed.ongoing.includes(:user, :category)

  end


  def new
    @seed = Seed.new
    @categories = Category.all
  end


  def create
     seed = current_user.seeds.build(seed_params)

    if seed.valid?
      seed.set_expiration
      seed.set_view_counter
      seed.set_popularity
      seed.save
      Campaign.create(seed_id: seed.id)
      flash[:notice] = "Votre seed est maintenant en ligne"
      redirect_to seed_path(seed)
    else
      render :new
    end
  end

  def show
    @seed = Seed.find(params[:id])
    @seeder = @seed.user
    @seed.increment_views
    @seed.increment_popularity
    @pick = Pick.new
    @user = current_user
  end

  def update
    seed = Seed.find(params["id"])
    admin_review = params["seed"]["admin_review"]


    if admin_review == "Valide"
      seed.update(admin_review_params)
      redirect_to signaled_path
    end

  end


  def destroy
  end

  def last_day
    if Seed.ongoing.any? == true
      @sample = Seed.ongoing.sample
    else
      @sample = Seed.expired.sample
    end
    @categories = Category.all
    @seeds = Seed.ongoing.includes(:user, :category).last_day
  end

  def popular
    if Seed.ongoing.any? == true
      @sample = Seed.ongoing.sample
    else
      @sample = Seed.expired.sample
    end
    @categories = Category.all
    @seeds = Seed.ongoing.includes(:user, :category).popular
  end

  def newest
    if Seed.ongoing.any? == true
      @sample = Seed.ongoing.sample
    else
      @sample = Seed.expired.sample
    end
    @categories = Category.all
    @seeds = Seed.ongoing.includes(:user, :category).newest
  end


  private

  def seed_params
    params.require(:seed).permit(:title, :price, :description, :official_description, :sale_point, :sale_point_url, :sale_point_address, :sale_point_contact, :category_id, :url, :secondary_url, photos: [])
  end

  def admin_review_params
    params.require(:seed).permit(:admin_review)
  end


end

