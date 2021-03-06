class CustomersController < ApplicationController
  before_action :set_customer, only: [:new, :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    dob_month = params[:q].delete(:dob) if params.present? && params[:q]
    purchased_year = params[:q].delete(:purchased_at) if params.present? && params[:q]
    @q = Customer.search(params[:q])

    query = @q.result.includes(:devices, address: :city)
              .order(:name)
              .paginate(page: params[:page], per_page: 15)

    if dob_month.present?
      query = query.where('extract(month from dob) = ?', dob_month)
      params[:q].merge!(:dob => dob_month)
    end

    if purchased_year.present?
      query = query.references(:devices).where('extract(year from devices.purchased_at) = ?', purchased_year)
      params[:q].merge!(:purchased_at => purchased_year)
    end

    @customers = query
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
      @states = State.order(:acronym)
    end

    def customer_params
      params.require(:customer).permit(:name, :email, :phone, :type, :cpf, :rg,
        :dob, :cellphone, :cnpj, :state_registration, :gender, :career, :re, :audiometry,
        :phone_ddd, :cellphone_ddd, :observation, :remove_audiometry, address_attributes: [:street, :number,
        :zipcode, :city_id, :state_id, :neighborhood, :complement])
    end
end
