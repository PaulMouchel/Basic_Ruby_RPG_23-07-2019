require 'bundler'
Bundler.require

#On appelle est fichiers game.rb et player.rb
require_relative 'lib/game'
require_relative 'lib/player'

#Affichage de l'écran titre
puts "-------------------------------------------------"
puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts
puts "Appuyez sur une entrée pour commencer"
gets
puts "Quel est votre prénom, héros ?"
print "> "
my_game = Game.new(gets.chomp) #Création du jeu avec avec saisie du nom du héros
while my_game.is_still_ongoing? #Tant que le jeu n'est pas terminé
	my_game.new_players_in_sight #Arrivée de nouveaux ennemis
	my_game.show_players #Affichage de l'état du jeu
	my_game.menu #Affichage du menu des action disponibles
	my_game.menu_choice(gets.chomp)	#Traitement du choix effectué
	my_game.enemies_attack #Les ennemis attaquent
end
my_game.end #Fin de partie