class Item < ActiveRecord::Base
  belongs_to :user

  def days_left
    (DateTime.now.to_date - created_at.to_date).to_i
  end


  def format_days_remaining(days_left)
  if days_left >= 6
    format .green
  elsif days_left >= 4
    format .yellow
  else
    format .red
      
end
end
