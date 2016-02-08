class User < ActiveRecord::Base

  def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["uid"])
    if !user.nil? # user found
      return user
    else # Create a user
      user = User.new
      user.uid        = auth_hash["uid"]
      user.name       = auth_hash["info"]["name"]
      user.image      = auth_hash["info"]["image"]
      if user.save
        return user
      else
        return nil
      end
    end
  end

end
