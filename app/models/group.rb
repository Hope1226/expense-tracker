class Group < ApplicationRecord
  # validation
  ICONS = %w[entertainment grosseries utilities housing clothing healthcare transportation miscellaneous].freeze
  validates :name, presence: { message: 'This field can not be blank' }
  validates :icon, presence: { message: 'This field can not be blank' }

  belongs_to :user
  has_many :entities, dependent: :delete_all

  def calculate_total
    total = 0
    entities.each { |item| total += item.amount }
    total
  end
end
