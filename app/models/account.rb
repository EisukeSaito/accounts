class Account < ApplicationRecord
  validates :route, presence: true
  validates :email, presence: true
  validates :name, presence: true
end
