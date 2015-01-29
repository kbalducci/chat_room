class Chat < ActiveRecord::Base

  def time_stamp
      created_at.strftime("%b %e, %l:%M %p")
  end


end

