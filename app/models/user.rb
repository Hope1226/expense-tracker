class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validation
  validates :name, presence: { message: 'This field can not be blank' }
  has_many :groups, dependent: :destroy
end
