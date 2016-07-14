class OrderController < ApplicationController

  def create
    @order = Order.new(myCart_id:params[:myCart_id],user_id:current_user.id)
    if @order.save
      session.delete(:cart_id)
      redirect_to @order.paypal_url
    else
      render :new
    end
  end

  protect_from_forgery except: [:hook]
  def hook
    params.permit!
    status = params[:payment_status]
    if status == "Completed"
      @order = Order.find(params[:invoice])
      @order.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end

  def order_receipt
    if params.has_key?(:tx)
      @order = Order.find_by(transaction_id:params[:tx])
      @cart = CartItem.where(cart_id:@order.my_cart.id)
    else
      redirect_to root_path
    end
  end

  def purchased_orders
    @purchased_orders = current_user.orders.where(status:"Completed")
  end
end