class Room < ActiveRecord::Base
  attr_accessible :name, :description, :exits_attributes

  has_many :exits
  accepts_nested_attributes_for :exits, reject_if: :all_blank
end
