class Client < ActiveRecord::Base
  belongs_to :district
	has_many :workers
end
