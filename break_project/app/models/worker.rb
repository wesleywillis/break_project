class Worker < ActiveRecord::Base
  belongs_to :client
  has_many :hours

  def month_shifts
    shifts.where("start_time >= ?", Time.now.beginning_of_month)
  end

  def month_totals
    total = 0
    month_shifts.each do shift
      total += (shift.stop - shift.start)
    end  
  end
end
