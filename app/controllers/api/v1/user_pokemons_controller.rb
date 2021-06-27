class Api::V1::UserPokemonsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_pokemon, only: %i[show update destroy]

    def index
        @my_pokemons_info = Pokemon.joins(:user_pokemon).where("user_pokemons.user_id = #{current_user.id}")
        render :json => @my_pokemons_info.to_json(include: { info: { except: [:id, :created_at, :updated_at, :pokemon_id]} }), status: :ok
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
        # pokemon_id = UserPokemon.find(params[:id])
        # my_pokemon = Info.where(pokemon_id: pokemon_id.pokemon_id)
        my_pokemon = Info.where(pokemon_id: params[:id])
        # pokemon_info = Info.select("pokemons.name, infos.*").joins(:pokemon).where(pokemon_id: pokemon_id.pokemon_id)
        pokemon_info = Info.select("pokemons.name, infos.*").joins(:pokemon).where(pokemon_id: params[:id])
        if my_pokemon.update(my_pokemon_params[:info])
            render json: {message: 'Success'}, status: :ok
        else
            render json: { message: 'Error', errors: my_pokemon.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        my_pokemon = UserPokemon.where(pokemon_id: params[:id])
        UserPokemon.destroy(my_pokemon.first.id)
        render json: {message: 'Pokemon Deleted'}, status: :ok
    end

    private
    def find_pokemon
        # poke_id = UserPokemon.where(pokemon_id: params[:id])
        # @my_pokemon = poke_id
        @my_pokemon = Pokemon.find(params[:id])
        # @my_pokemon = Pokemon.find(poke_id.first.id)
        rescue ActiveRecord::RecordNotFound
        render json: { errors: 'Pokemon not found' }, status: :not_found
    end
    def my_pokemon_params
        params.require(:user_pokemon).permit(info: [:pokedex_id, :nick_name, :favorite_color, :favorite_food, :moveset, pokemon_attributes: [:name]])
    end
end