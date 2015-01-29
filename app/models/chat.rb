class Chat < ActiveRecord::Base

  def time_stamp
      Time.local(Time.new);
  end
end

