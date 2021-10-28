class OrderIndexSerializer < ActiveModel::Serializer
  attributes :review_title, :review_stars, :review, :user_name, :time 


  def time
    "#{object.updated_at.strftime('%A, %m/%d/%y at %I:%M %p')}"
  end

  def user_name
    "#{object.user.username}"
  end
 

end
