class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  #we can also add in a usersHelper to show in view
  #in that case, we say def mood(user) - and need to change users/show.html.erb page
  def mood
    if !self.nausea.nil? && !self.happiness.nil?
      if self.nausea > self.happiness
        "sad"
      else
        "happy"
      end
    end
  end

end
