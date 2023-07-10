class User < ApplicationRecord
  has_many :portfolios, dependent: :destroy, class_name: 'Portfolio'
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
end
