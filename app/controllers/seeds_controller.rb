class SeedsController < ApplicationController

  before_action :set_sample, only: [:index, :last_day, :popular, :newest, :show, :new]
  skip_before_action :authenticate_user!, only: [:index, :last_day, :popular, :newest, :show]
  before_action :set_user, only: [:index, :last_day, :popular, :newest, :show, :new]


  def index
    @categories = Category.all
    if params[:category].present?
      @filter = Category.friendly.find(params[:category])
      @seeds = policy_scope(Seed).seed_selection.includes(:category, :user).paginate(page: params[:page])
      @seeds = @seeds.category(@filter)
    else
      @seeds = policy_scope(Seed).seed_selection.includes(:category, :user).paginate(page: params[:page])
    end
    respond_to do |format|
      format.html
      format.js { render 'shared/seed_page' }
    end
  end

  def last_day
    @categories = Category.all
    if params[:category].present?
      @filter = Category.friendly.find(params[:category])
      @seeds = Seed.seed_selection.last_day.includes(:category, :user).paginate(page: params[:page])
      @seeds = @seeds.category(@filter)
    else
      @seeds = Seed.seed_selection.last_day.includes(:category, :user).paginate(page: params[:page])
    end
    authorize @seeds
    respond_to do |format|
      format.html
      format.js { render 'shared/seed_page' }
    end
  end

  def popular
    @categories = Category.all
    if params[:category].present?
      @filter = Category.friendly.find(params[:category])
      @seeds = Seed.seed_selection.popular.includes(:category, :user).paginate(page: params[:page])
      @seeds = @seeds.category(@filter)
    else
      @seeds = Seed.seed_selection.popular.includes(:category, :user).paginate(page: params[:page])
    end
    authorize @seeds
    respond_to do |format|
      format.html
      format.js { render 'shared/seed_page' }
    end
  end

  def newest
    @categories = Category.all
    if params[:category].present?
      @filter = Category.friendly.find(params[:category])
      @seeds = Seed.seed_selection.newest.includes(:category, :user).paginate(page: params[:page])
      @seeds = @seeds.category(@filter)
    else
      @seeds = Seed.seed_selection.newest.includes(:category, :user).paginate(page: params[:page])
    end
    authorize @seeds
    respond_to do |format|
      format.html
      format.js { render 'shared/seed_page' }
    end
  end



  def new
    @seed = Seed.new
    @mode_category_id = Category.where(name: 'Mode').first.id
    authorize @seed
  end


  def create
     @seed = current_user.seeds.build(seed_params)
     authorize @seed
    if @seed.save
      @seed.set_expiration
      @seed.set_view_counter
      @seed.set_popularity
      @seed.save
      Campaign.create(seed_id: @seed.id)
      flash[:notice] = "Votre seed est maintenant en ligne"
      redirect_to seed_path(@seed)
    else
      render :new
    end
  end

  def show
    @seed = Seed.friendly.find(params[:id])
    authorize @seed
    @seeder = @seed.user
    @seed.increment_views
    @seed.increment_popularity
    @pick = Pick.new
    @user = current_user
  end

  def update
    @seed = Seed.friendly.find(params["id"])
    admin_review = params["seed"]["admin_review"]
    authorize @seed

    if admin_review == "Valide"
      @seed.update(admin_review_params)
      redirect_to signaled_path

    else
      @seed.cancel_campaign
      @seed.update(admin_review_params)
      redirect_to signaled_path
    end

  end

  def update_delivery_costs

  end



  def admin
    @pending = Seed.where.not(admin_review:"Invalide").includes(:campaign).joins(:campaign).where(campaigns: {status: "pending"})
    @signaled = Seed.where(admin_review: "not-reviewed").joins(:signal_seed).distinct
    @picks =  Pick.joins(:exchanges).where(exchanges: { admin_review: false }).distinct
    @seeds = Seed.where(admin_review: "not-reviewed").count
    @seed = Seed.first
    authorize @seed
  end

  def publish_seed
    @seeds = Seed.where(admin_review: "not-reviewed")
    authorize @seeds
  end


  private

  def seed_params
    params.require(:seed).permit(:title, :size_guide, :price, :description, :official_description, :sale_point_url, :sale_point_contact, :category_id, :url, :secondary_url, photos: [])
  end

  def admin_review_params
    params.require(:seed).permit(:admin_review)
  end

  def set_user
    @user = current_user
  end




end

