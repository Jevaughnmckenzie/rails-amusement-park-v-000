class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def enough_height?
		self.user.height >= self.attraction.min_height
	end

	def enough_tickets?
		self.user.tickets >= self.attraction.tickets
	end

	def update_tickets
		self.user.tickets -= self.attraction.tickets
		self.user.save
	end

	def update_nausea
		self.user.nausea += self.attraction.nausea_rating
		self.user.save
	end

	def update_happiness
		self.user.happiness += self.attraction.happiness_rating
		self.user.save
	end

	def add_message(test)
		message << test[:message]
	end

  
  def take_ride
  	message = ""

  	message << "Sorry. You do not have enough tickets to ride the #{attraction.name}." unless enough_tickets?
  	message << "Sorry. You are not tall enough to ride the #{attraction.name}." unless enough_height?
  	

  	if !enough_tickets? && !enough_height?
  		message.gsub!(/\.\w+/, '')
  	elsif enough_height? && enough_tickets?
  		update_nausea
  		update_happiness
  		update_tickets
  		message << "Thanks for riding the #{self.attraction.name}!"
  	end

  	self.user.messages = message
  	self.user.save

  	message
  end
end
