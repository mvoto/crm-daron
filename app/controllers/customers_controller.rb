class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show; end

  def new
    @customer = Customer.new
    @customer.address.build
  end

  def edit; end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customer_path(@customer), notice: I18n.t('controller.messages.created')
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: I18n.t('controller.messages.update')
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      redirect_to customers_url, notice: I18n('controller.messages.destroy')
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :email, :phone, :le_lost_type,
        :re_lost_type, :le_device_type, :re_device_type,
        address_attributes: [:street, :number, :zipcode, :city_id])
      # params.require(:address).permit!
    end
end
