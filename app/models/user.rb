class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  DEFAULT_PASSWORD = 'daron123'.freeze

  ROLES = [
    ADMIN = 'Admin'.freeze,
    BASIC = 'Básico'.freeze
  ].freeze

  def admin?
    role == ADMIN
  end

  def basic?
    role == BASIC
  end
end
