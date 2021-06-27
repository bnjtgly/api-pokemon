# README

# api-pokemon

API
Note: 
1. Run in ubutu/linux
2. Use postgresql and run rails in port 3000(url should look like http://localhost:3000/) - This is important to run successfully the frontend.

Steps
1. Create a folder. (Ex. test)
2. cd test
3. git clone https://github.com/bnjtgly/api-pokemon.git
4. cd api-pokemon
5. bundle install
6. Delete /config/master.key and /config/credentials.yml.enc
7. run and save  EDITOR="nano" rails credentials:edit
8. rails db:create 
9. rails db:migrate
10. rails s

