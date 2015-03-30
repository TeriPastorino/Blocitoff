class Item < ActiveRecord::Base
  belongs_to :user

  def days_left
    (DateTime.now.to_date - created_at.to_date).to_i
  end


  def format_days_remaining(days_left)
    if days_left >= 6
      .active
    elsif days_left >= 4
      .urgent
    else
      .critical
    end
end


end

# def check_sign(number)
#   if number > 0
#     "#{number} is positive"
#   else
#     "#{number} is negative"
#   end        
# end

