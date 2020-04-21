require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "     Bienvenue sur le meilleur jeu du moment     "
puts "               'TSN Battle Royale'               "
puts " Le but du jeu est d'être le dernier survivant ! "
puts "-------------------------------------------------"

puts "Insérez votre pseudo ici :"
print "> "
username = gets.chomp

user1 = HumanPlayer.new(username)

enemies = []
bot1 = Player.new("Ryuja")
bot2 = Player.new("Despi")

enemies << bot1
enemies << bot2

while user1.life_points > 0 && (bot1.life_points > 0 || bot2.life_points > 0)
  puts "--------------------------------------------------------------"
  puts " Phase de choix d'action : "
  puts " #{user1.show_state}"
  puts "--------------------------------------------------------------"
  puts "Quelle action veux-tu effectuer ?"
  puts "a. Chercher une meilleure arme"
  puts "s. Chercher à se soigner"
  puts
  puts "Attaquer un joueur :"
  puts "1. #{bot1.show_state}"
  puts "2. #{bot2.show_state}"
  puts
  print "> "
  input = gets.chomp
  puts "--------------------------------------------------------------"
  puts " Phase d'action ! "
  puts "--------------------------------------------------------------"
  case input
    when "a"
      user1.search_weapon
    when "s"
      user1.search_health_pack
    when "1"
      user1.attacks(bot1)
    when "2"
      user1.attacks(bot2)
    else
      puts "Ceci n'est pas une action valide. Vous perdez un tour !"
  end
  break if bot1.life_points < 1 && bot2.life_points < 1
  puts
  puts "Les autres joueurs t'attaquent !"
  enemies.each do |bot|
    bot.attacks(user1) if bot.life_points > 0
    break if user1.life_points < 1
  end
  puts
end

puts
puts "Fin de la partie !"
if user1.life_points > 0
  puts "Félicitations ! Tu as remporté la manche."
else
  puts "Hum, réessaye?"
end
