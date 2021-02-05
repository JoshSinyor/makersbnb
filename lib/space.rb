# frozen_string_literal: true

class Space < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
end
