class DevicesController < ApplicationController
  before_action :load_device, only: [:edit, :update, :destroy]
  before_action :load_customer, only: [:new, :create]
  before_action :authenticate_user!

  def new
    @device = Device.new
    @customer.devices.build
  end

  def edit
    @customer = @device.customer
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      redirect_to customer_path(@customer),
        notice: I18n.t('controller.messages.create')
    else
      render :new
    end
  end

  def update
    @customer = @device.customer
    if @device.update(device_params)
      redirect_to customer_path(@device.customer),
        notice: I18n.t('controller.messages.update')
    else
      render :edit
    end
  end

  def destroy
    @device.destroy
    redirect_to customer_path(@device.customer),
      notice: I18n.t('controller.messages.destroy')
  end

  private
    def load_device
      @device = Device.find(params[:id]) if params[:id].present?
    end

    def load_customer
      if params[:device][:customer_id]
        @customer = Customer.find(params[:device][:customer_id])
      end
    end

    def device_params
      params.require(:device).permit(:id, :brand, :model, :ear, :purchased_at,
        :_type, :warantee, :battery, :serial_number, :store, :other_store,
        :customer_id)
    end
end
