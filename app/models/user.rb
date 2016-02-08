class User < ActiveRecord::Base
  validates :username, :uid, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    if !user.nil?
      #user found
      return user
    else
      #create new user
      user = User.new
      user.uid        = auth_hash["uid"]
      user.provider   = auth_hash["provider"]
      user.username   = auth_hash["info"]["name"]
      if user.save
        return user
      else
        return nil
      end
    end
  end

  def self.create_from_omniauth(auth_hash)
    # Create a user
  end
end
