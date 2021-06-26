class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    user = QueryStatement.new({
      query_statement: "SELECT * FROM user_pokemons WHERE user_id=#{current_user.id}"
    }).execute
    render json: user, status: :ok
  end
end


