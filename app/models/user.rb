class User < ActiveRecord::Base
  validates :email, :username, :uid, :provider, presence: true
  has_many :gamesetups
  def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    if !user.nil?
      return user
    elsif auth_hash["provider"] == "facebook"
      user            = User.new
      user.uid        = auth_hash["uid"]
      user.provider   = auth_hash["provider"]
      user.username   = auth_hash["info"]["name"]
      user.email      = auth_hash["info"]["email"]
      user.image      = auth_hash["info"]["image"]
      if user.save
        return user
      else
        return nil
      end
    end
  end

  def best_score
    #get all of a user's games and loop through to return the highest
    if self.gamesetups == []
      return 0
    else
      games = self.gamesetups
        high_score = games.max_by do |game|
           game.score
      end
    end
    return high_score.score
  end
end
