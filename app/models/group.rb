class Group < ApplicationRecord
  # validation
  validates :name, presence: { message: 'This field can not be blank' }
  validates :icon, presence: { message: 'This field can not be blank' }

  belongs_to :user
  has_and_belongs_to_many :entities
end