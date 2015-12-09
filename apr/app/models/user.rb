class User < ActiveRecord::Base

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  STATUS_TYPES = ['Active', 'Inactive']
  validates :status,
            :inclusion  => { :in => [ 'Active', 'Inactive'],
                             :message    => "%{value} is not a valid status" }

  ROLE_TYPES = ['Admin', 'User']
  validates :role,
            :inclusion  => { :in => [ 'Admin', 'User'],
                             :message    => "%{value} is not a valid role" }

end
