# README

# api-pokemon

API
Note: 
1. Run on ubutu/linux
2. Use postgresql and run rails in port 3000(url should look like http://localhost:3000/) - This is important to run successfully the frontend.

Steps
1. Create a folder. (Ex. test)
2. cd test
3. git clone https://github.com/bnjtgly/api-pokemon.git
4. cd api-pokemon
5. bundle install
6. Delete the two files in app/config/master.key and app/config/credentials.yml.enc
7. run and save  EDITOR="nano" rails credentials:edit
8. rails db:create 
9. rails db:migrate
10. rails s


My pokemons endpoints


get api/v1/user_pokemons #index

get api/v1/user_pokemons/1 #show

post  api/v1/user_pokemons #create

put api/v1/user_pokemons/1 #update

delete api/v1/user_pokemons/1 #destroy

