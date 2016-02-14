class Game < ActiveRecord::Base
  belongs_to :user

  # def retrieve_game
  #   respond_to do |format|
  #     format.json do
  #       id = params[:uid]
  #       # lower_bound_id = params[:lower_bound_id]
  #       # upper_bound_id = params[:upper_bound_id]
  #       @result = Game.find(id)
  #       render json: @result
  #     end
  #   end
  # end
  # 
  # def create_game
  #   respond_to do |format|
  #     format.json do
  #       state = params[:state]
  #       game = Game.new()
  #       game.state = state
  #       game.save
  #       render json: game
  #     end
  #   end
  # end

  # $ = jQuery
  # $ ->
  # $('#posts_button').click ->
  #   lower_bound_id = $('#lower_bound_id').val()
  #   upper_bound_id = $('#upper_bound_id').val()
  #   $.ajax
  #     url: "/posts_api"
  #     type: 'GET'
  #     data: {lower_bound_id: lower_bound_id, upper_bound_id: upper_bound_id}
  #     success: (data) ->
  #       Posts.data_table($('table'), data)
  #     error: ->
  #       alert "Something went wrong"

end
