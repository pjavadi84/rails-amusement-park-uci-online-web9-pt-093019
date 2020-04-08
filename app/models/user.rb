class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides 
    has_secure_password
    
    def create
        ride = Ride.create(ride_params)
        message = ride.take_ride
        redirect_to user_path(ride.user), flash: { message: message }
      end

    def mood
        unless admin
            self.happiness > self.nausea ? "happy" : "sad"
        end
    end

end
