class Api::V1::UserPokemonsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_pokemon, only: %i[show update destroy]

    def index
        @my_pokemons = UserPokemon.where(user_id: current_user)
        render json: @my_pokemons, status: :ok
    end
    
    def show
        pokemon_info = Info.select("pokemons.name, infos.*").joins(:pokemon).where(pokemon_id: @my_pokemon.id)
        render json: pokemon_info, status: :ok
    end

    def create
        pokemon_info = Info.new(my_pokemon_params[:info])
        if pokemon_info.save
            newly_catched_pokemon = Pokemon.last
            UserPokemon.create(user_id: current_user.id, pokemon_id: newly_catched_pokemon.id)
            render :json => newly_catched_pokemon.to_json(include: { info: { except: [:id, :created_at, :updated_at, :pokemon_id]} }), status: :created
        else
            render json: { errors: pokemon_info.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        my_pokemon = Info.where(pokemon_id: @my_pokemon.id)
        pokemon_info = Info.select("pokemons.name, infos.*").joins(:pokemon).where(pokemon_id: @my_pokemon.id)
        if my_pokemon.update(my_pokemon_params[:info])
            render json: pokemon_info
        else
            render json: { errors: my_pokemon.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        my_pokemon = UserPokemon(@my_pokemon.id)
        render json: my_pokemon
    end

    private
    def find_pokemon
        @my_pokemon = Pokemon.find(params[:id])
        rescue ActiveRecord::RecordNotFound
        render json: { errors: 'Pokemon not found' }, status: :not_found
    end
    def my_pokemon_params
        params.require(:user_pokemon).permit(info: [:pokedex_id, :nick_name, pokemon_attributes: [:name]])
    end
end