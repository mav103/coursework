class Card < ActiveRecord::Base
  has_many :survey, dependent: :destroy


  validates :second_name, presence:true, length: {maximum: 30}
  validates :first_name, presence:true, length: {maximum: 30}
  validates :last_name, presence:true, length: {maximum: 30}
  validates :passport, presence:true, length: {maximum: 30},
  uniqueness:true
  validates :insurance, presence:true, uniqueness:true
  validates :residence, presence:true, inclusion:
  { in: ['besplatnoe', 'platnoe'] }
  validates :created, presence:true
  validates :allergy, presence:true, length: {maximum: 128}
  validates :cart_number, presence:true, uniqueness:true, numericality:
  {only_integer: true, greater_than_or_equal_to: 0}
end
