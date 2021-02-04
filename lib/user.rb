# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :user_email
end
