class CustomersController < ApplicationController
  before_action :set_customer, only: [:new, :show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @q = Customer.search(params[:q])
    @customers = @q.result.includes(:address).order(:name).paginate(page: params[:page],
      per_page: 10)
  end

  def show; end

  def new
    @customer = Customer.new
    @customer.build_address
    # @customer.build_devices
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
      @states = State.order(:acronym)
    end

    def customer_params
      params.require(:customer).permit(:name, :email, :phone, :type, :cpf, :rg,
        :dob, :cellphone, :cnpj, :store, :other_store, :state_registration,
        :gender, :career, :phone_ddd, :cellphone_ddd,
        address_attributes: [:street, :number, :zipcode, :city_id, :state_id,
        :neighborhood, :complement], devices_attributes: [:brand, :model, :ear,
        :_type, :purchased_at, :warantee, :battery, :serial_number])
    end
end
