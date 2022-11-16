class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :category, inclusion: { in: %w[italian japanese chinese french belgian],
                                    message: '%{value} is not a valid category' }
  validates :name, :address, :category, presence: true
end
