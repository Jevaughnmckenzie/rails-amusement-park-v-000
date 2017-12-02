class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
  

  has_secure_password
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  # attr_accessor :messages


  def mood
  	if self.happiness > self.nausea
  		'happy'
  	elsif self.nausea > self.happiness
  		'sad'
  	end

  end
end
