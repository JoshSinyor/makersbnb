# frozen_string_literal: true
require "date"

class Booking < ActiveRecord::Base

  def self.str_to_date(date)
    Date.strptime(date, "%d/%m/%y")
  end

  def self.valid_date_range(start_date, end_date)
    start_date = str_to_date(start_date)
    end_date = str_to_date(end_date)
    (end_date - start_date).to_i > 1
  end

end
