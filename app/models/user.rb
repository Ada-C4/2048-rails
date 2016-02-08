class User < ActiveRecord::Base
  has_many :games
  def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    if !user.nil?
      #user found continue on with your life
      return user
    else
      #create a new user
      user = User.new
      user.uid = auth_hash["uid"]
      user.provider = auth_hash["provider"]
      user.username = auth_hash["info"]["name"]
      user.avatar_url = auth_hash["info"]["profile_image_url"]
      if user.save
        user.save
        return user
      else
        return nil
      end
    end
  end

end
