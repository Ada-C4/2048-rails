class Gamesetup < ActiveRecord::Base
# validates_presence_of :size, :score, :over, :won, :keepPlaying, :json_cells
belongs_to :user

  def as_json(options = {})
    super(
      except: [:created_at, :updated_at, :json_cells]
    ).merge({cells: JSON.parse(json_cells)})
  end
end
