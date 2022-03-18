class Entity < ApplicationRecord
  # validation
  validates :name, presence: { message: 'Tis field can not be empty' }
  validates :amount,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            message: 'The input should be greater or equal to 0' }

  belongs_to :user
  belongs_to :group
end
