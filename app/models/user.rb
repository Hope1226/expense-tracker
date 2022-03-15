class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validation
  validates :name, presence: { message: 'This field can not be blank' }
  has_many :groups, dependent: :destroy
  has_many :entities, dependent: :destroy

  def total_expense
    total = 0
    groups.each { |group| total += group.calculate_total }
    total
  end
end
