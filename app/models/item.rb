class Item < ActiveRecord::Base
  belongs_to :user

  validates :description, length: {minimum: 5}, presence: true


  def days_left
    (DateTime.now.to_date - created_at.to_date).to_i
  end
end


  

