class PicksController < ApplicationController
  before_action :set_sample, only: [:show, :my_picks, :pick_history]
  after_action :verify_authorized
  skip_after_action :verify_authorized, only: [:my_picks, :pick_history]

  def index
    @user = current_user
    @seed = Seed.friendly.find(params[:seed_id])
    @picks = policy_scope(Pick).where(seed_id: @seed, state: "validated").order(price: :desc )
    authorize @picks

    respond_to do |format|
    format.html
    format.csv { send_data @picks.as_csv }
    end

  end

  def show
    @pick = Pick.find(params[:id])
    @user = @pick.user_id
    @exchanges = @pick.exchanges.includes(:user)
    authorize @pick
    unless @pick.state == "pending"
      @customer_infos = @pick.payment
      # @customer_infos = JSON.parse(@pick.payment)["source"]
    end
    @exchange = Exchange.new

  end


  def create
    @seed = Seed.friendly.find(params[:seed_id])
    @pick = @seed.picks.new(pick_params)
    @pick.user_id = current_user.id
    @user = @pick.user_id
    @pick.amount = @seed.price * 0.2
    authorize @pick
    if @pick.save
      @seed.increment_popularity
      respond_to do |format|
        format.html { redirect_to seed_path(@seed) }
        format.js
      end
    end
  end

  def update
    @pick = Pick.find(params[:id])
    @seed = @pick.seed
    authorize @pick
    if @pick.update(pick_params)
      respond_to do |format|
        format.html {redirect_to my_picks_path}
        format.js
      end
    end
  end

  def edit
    @pick = Pick.find(params[:id])
    authorize @pick
    @campaign_price = @pick.seed.campaign.price
  end

  def update_card
    @pick = Pick.find(params[:id])
    authorize @pick
    @campaign = @pick.seed.campaign.id
    @user_id = @pick.user_id
    customer_id = User.find(@pick.user_id).customer_id
    card = params[:stripeToken]
    cu = Stripe::Customer.retrieve(customer_id)
    cu.sources.create(source: card)
    card = Stripe::Token.retrieve(card)["card"]
    cu.default_source = card
    cu.save
    @pick.amount = @pick.seed.campaign.price + 3.9
    begin
      charge = Stripe::Charge.create(
        customer:     customer_id,   # You should store this customer id and re-use it.
        amount:       @pick.amount_cents,
        description:  "Participation au deal pour #{@pick.seed.title} enregistrée",
        currency:     @pick.amount.currency
      )
      @pick.update(payment: card, state: 'finalized', deal_price: charge.to_json)
      CampaignMailer.pick_success(@user_id, @campaign, @pick.id).deliver_later
      redirect_to pick_path(@pick)
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to edit_pick_path(@pick)
    end

  end


  def destroy
    @pick = Pick.find(params[:id])
    authorize @pick
    @seed = @pick.seed
    if @pick.state == "paid"
      payment_string_object = @pick.payment
      payment_hash = JSON.parse(payment_string_object)
      payment_id = payment_hash["id"]
      Stripe::Refund.create(
        charge: payment_id
      )
    end
    @pick.destroy
    @seed.increment_popularity
    respond_to do |format|
      format.html {redirect_to my_picks_path}
      format.js
    end
  end

  def my_picks
    @picks = Pick.pending_picks(current_user).includes(:seed).select {|pick| pick.seed.ongoing?}
  end

  def pick_history
    @picks = current_user.picks.includes(:seed).newest.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.js { render 'picks/pick_page' }
    end
  end



  private

  def pick_params
    params.require(:pick).permit(:price, :size)
  end


end
