class Api::V1::PokemonsController < ApplicationController
    # before_action :authenticate_user!
    require 'poke-api-v2'

    def index
        @pokemon = Pokemon.limit(6)
        render :json => @pokemon.to_json(include: { info: { except: [:id, :created_at, :updated_at, :pokemon_id]} }), status: :ok
    end

    def show
        pokemon = PokeApi.get(pokemon: params[:id].downcase);
        @pokemon = [{
            id: pokemon.id,
            name: pokemon.name,
            abilities: get_abilities(pokemon.abilities),
            types: get_types(pokemon.types),
            moves: get_moves(pokemon.moves)
        }]
        render json: @pokemon, status: :ok
    end

    private
    def pokemon_params
        params.permit(:name)
    end

    def get_abilities(abilities)
        arr = []
        arr.push *abilities.map { |x| x.ability.name}
        arr
    end

    def get_moves(moves)
        arr = []
        arr.push *moves.map { |x| x.move.name}
        arr
    end

    def get_types(types)
        arr = []
        arr.push *types.map { |x| x.type.name}
        arr
    end
end
