class User < ActiveRecord::Base
  has_many :pet, dependent: :destroy
end
