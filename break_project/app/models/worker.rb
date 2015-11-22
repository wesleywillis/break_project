class Worker < ActiveRecord::Base
  belongs_to :client
  has_many :hours
end
