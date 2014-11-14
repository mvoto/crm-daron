class CustomersController < ApplicationController
  before_action :set_customer, only: [:new, :show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show; end

  def new
    @customer = Customer.new
    @customer.build_address
  end

  def edit; end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customer_path(@customer), notice: I18n.t('controller.messages.create')
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
    redirect_to customers_url, notice: I18n.t('controller.messages.destroy')
  end

  private
    def set_customer
      @customer = Customer.find(params[:id]) if params[:id].present?
      @states = State.order(:name)
    end

    def customer_params
      params.require(:customer).permit(:name, :email, :phone, :le_lost_type,
        :re_lost_type, :le_device_type, :re_device_type, :type, :cpf, :rg,
        :dob, :cellphone, :cnpj, :state_registration, :store,
        address_attributes: [:street, :number, :zipcode, :city_id])
    end
end
