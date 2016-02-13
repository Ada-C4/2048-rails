class User < ActiveRecord::Base
  has_many :games, -> { order "updated_at DESC" }

  def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["uid"])
    if !user.nil?
      return user
    else
      user = User.new
      user.uid = auth_hash["uid"]
      user.name = auth_hash["info"]["name"]
      user.provider   = auth_hash["provider"]
      user.image_url = auth_hash["info"]["image"]
      if !user.image_url.present?
        user.image_url = "blank.png"
      end
      if user.save
        user
      else
        nil
      end
    end
  end

end
