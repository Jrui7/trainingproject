class PicksController < ApplicationController

  def index
    @user = current_user
    @seed = Seed.find(params[:seed_id])
    @picks = Pick.where(seed_id: @seed, state: "paid").order(price: :desc )

    respond_to do |format|
    format.html
    format.csv { send_data @picks.as_csv }
    end

  end

  def show
    @pick = Pick.find(params[:id])
  end


  def create
    @user = current_user
    @seed = Seed.find(params[:seed_id])
    @pick = @seed.picks.new(pick_params)
    @pick.user_id = @user.id
    @pick.amount = @seed.price * 0.2
    @pick.state = "pending"
    if @pick.save
      @seed.increment_popularity
      respond_to do |format|
        format.html { redirect_to seed_path(@seed) }
        format.js
      end
    end
  end

  def update
    @picks = current_user.picks.newest
    @pick = Pick.find(params[:id])
    @seed = @pick.seed
    if @pick.update(pick_params)
      respond_to do |format|
        format.html {redirect_to my_picks_path}
        format.js
      end
    end
  end

  def destroy
    @pick = Pick.find(params[:id])
    if @pick.state == "paid"
      payment_string_object = @pick.payment
      payment_hash = JSON.parse(payment_string_object)
      payment_id = payment_hash["id"]
      Stripe::Refund.create(
        charge: payment_id
      )
    end

    @seed = @pick.seed
    @pick.destroy
    respond_to do |format|
      format.html {redirect_to my_picks_path}
      format.js
    end
    @seed.increment_popularity

  end

  private

  def pick_params
    params.require(:pick).permit(:price)
  end


end
