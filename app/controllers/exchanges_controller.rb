class ExchangesController < ApplicationController
  def create
    @pick = Pick.find(params[:pick_id])
    @exchange = @pick.exchanges.build(exchange_params)
    @exchange.user_id = current_user.id
    authorize @exchange
    if @exchange.save
      respond_to do |format|
        format.html { redirect_to pick_path(@pick) }
        format.js
      end
    else
      render "picks/show"
    end

  end



  private

  def exchange_params
    params.require(:exchange).permit(:question)
  end
end
