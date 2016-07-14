class SessionsController < ApplicationController
  # layout 'hello'
  before_action :hello, only: [:delivery_address,:add_delivery_address,:place_order]
  before_action :authenticate_user!, only: [:delivery_address,:add_delivery_address,:place_order]

  def add_to_cart
    if session[:cart_id].blank?
      @cart = MyCart.create(cart_total:0)
      session[:cart_id] = @cart.id
      @cart_item = CartItem.create(cart_id:@cart.id,product_id:params[:product_id],product_quantity:"1")
      product = Product.find(params[:product_id])
      if discounted_price = product.discounted_price.present?
        @cart.update(cart_total:@cart.cart_total.to_i+product.discounted_price.to_i)
      else
        @cart.update(cart_total:@cart.cart_total.to_i+product.price.to_i)
      end
      cart_count = @cart.cart_items.count
      data={cart_count:cart_count}
      render json: data.to_json
    else
      @cart = MyCart.find(session[:cart_id].to_i)
      @cart_item = CartItem.create(cart_id:@cart.id,product_id:params[:product_id],product_quantity:"1")
      product = Product.find(params[:product_id])
      if product.discounted_price.present?
        @cart.update(cart_total:@cart.cart_total.to_i+product.discounted_price.to_i)
      else
        @cart.update(cart_total:@cart.cart_total.to_i+product.price.to_i)
      end
      cart_count = @cart.cart_items.count
      data={cart_count:cart_count}
      render json: data.to_json
    end
  end

  def myCart
    if !session[:cart_id].blank?
      @cart = MyCart.find(session[:cart_id].to_i)
      @cart_items = @cart.cart_items
    end
  end

  def add_quantity
    cart = MyCart.find(session[:cart_id].to_i)
    cart_product = cart.cart_items.find_by(product_id:params[:id])
    if cart_product.product.discounted_price.present?
      cart.update(cart_total:cart.cart_total.to_i+cart_product.product.discounted_price)
    else
      cart.update(cart_total:cart.cart_total.to_i+cart_product.product.price)
    end
    cart_product.update(product_quantity:cart_product.product_quantity+1)
    data={}
    render json: data.to_json
  end

  def deduct_quantity
    cart = MyCart.find(session[:cart_id].to_i)
    cart_product = cart.cart_items.find_by(product_id:params[:id])
    if cart_product.product.discounted_price.present?
      cart.update(cart_total:cart.cart_total.to_i-cart_product.product.discounted_price)
    else
      cart.update(cart_total:cart.cart_total.to_i-cart_product.product.price)
    end
    cart_product.update(product_quantity:cart_product.product_quantity-1)
    data={}
    render json: data.to_json
  end

  def remove_cart
    cart = MyCart.find(session[:cart_id].to_i)
    cart_product = cart.cart_items.find_by(product_id:params[:id]).delete
    product = Product.find(params[:id])
    if product.discounted_price.present?
      cart.update(cart_total:cart.cart_total.to_i-(product.discounted_price.to_i*cart_product.product_quantity))
    else
      cart.update(cart_total:cart.cart_total.to_i-(product.price.to_i*cart_product.product_quantity))
    end
    cart_count = cart.cart_items.count
    if cart_count == 0
      MyCart.find(session[:cart_id].to_i).delete
      session[:cart_id] = nil
    end
    data={product_id:params[:id],cart_count:cart_count}
    render json: data.to_json
  end

  def delivery_address
    if user_signed_in? && !session[:cart_id].blank?
      @address = Address.new
      @order_address = current_user.addresses
    else
      redirect_to myCart_path
    end
  end

  def add_delivery_address
    cart = MyCart.find(session[:cart_id].to_i)
    if params[:new_delivery_address].present?
      new_delivery_address = Address.create(address:params[:new_delivery_address],city:params[:city],
        state:params[:state],zip:params[:zip],country:params[:country],user_id:current_user.id)
      cart.update(delivery_address:new_delivery_address.id,user_id:current_user.id)
    else
      cart.update(delivery_address:params[:delivery_address],user_id:current_user.id)
    end
    redirect_to place_order_path
  end

  def place_order
    if !session[:cart_id].blank?
      @cart = MyCart.find(session[:cart_id].to_i)
      if !@cart.delivery_address.blank?
        @delivery_address = Address.find(@cart.delivery_address)
      else
        redirect_to delivery_address_path
      end
    else
      redirect_to myCart_path
    end
  end

  private
    def hello
      session[:previous_url] = request.fullpath
    end
end