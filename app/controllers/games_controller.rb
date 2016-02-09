class GamesController < ApplicationController
  def save
    render :json => {"a": "apple"}.as_json, status: :ok
  end
end
