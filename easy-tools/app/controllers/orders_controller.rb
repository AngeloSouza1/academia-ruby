class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    @orders =  Order.order(created_at: :desc)


  end
  def new
    @order = Order.new

  end

  def edit
    @order = Order.find(params[:id])

  end


  def create
    @order = Order.new(order_params)
    # authorize @order

    if @order.save
      flash[:success] = "Pedido cadastrado com sucesso!"
      redirect_to @order
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :equipament_id, :period_start, :period_end)
  end


end
