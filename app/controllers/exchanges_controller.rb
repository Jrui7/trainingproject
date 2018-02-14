class ExchangesController < ApplicationController
  def create
    @pick = Pick.find(params[:pick_id])
    @exchange = @pick.exchanges.new(exchange_params)
    if @exchange.save
      respond_to do |format|
        format.html { redirect_to pick_path(@pick), notice: "Question envoyée" }
        format.js # render exchanges/create.js.erb
      end
    else
      respond_to do |format|
        format.html { render 'picks/show' }
        format.js # render exchanges/create.js.erb
        end
    end
    authorize @exchange
  end

  def destroy
    @exchange = Exchange.find(params[:id])
    @pick = @exchange.pick
    @exchange.destroy

    respond_to do |format|
      format.html { redirect_to pick_path(@pick) }
      format.js # render views/reviews/destroy.js.erb
    end
  end

  private
  def exchange_params
    params.require(:exchange).permit(:question)
  end
end