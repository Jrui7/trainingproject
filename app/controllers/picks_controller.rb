class PicksController < ApplicationController

  after_action :verify_authorized

  def index
    @user = current_user
    @seed = Seed.friendly.find(params[:seed_id])
    @picks = policy_scope(Pick).where(seed_id: @seed, state: "paid").order(price: :desc )
    authorize @picks

    respond_to do |format|
    format.html
    format.csv { send_data @picks.as_csv }
    end

  end

  def show
    @pick = Pick.find(params[:id])
    authorize @pick
    unless @pick.payment.blank?
      @customer_infos = JSON.parse(@pick.payment)["source"]
    end
    @exchange = Exchange.new
  end


  def create
    @seed = Seed.friendly.find(params[:seed_id])
    @pick = @seed.picks.new(pick_params)
    @pick.user_id = current_user.id
    @pick.amount = @seed.price * 0.2
    @pick.state = "pending"
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

  private

  def pick_params
    params.require(:pick).permit(:price)
  end



end
