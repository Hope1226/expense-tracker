class User < ApplicationRecord
  # validation
  validates :name, presence: { message: 'This field can not be blank' }
end
