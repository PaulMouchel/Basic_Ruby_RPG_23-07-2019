require 'bundler'
Bundler.require

#On appelle est fichiers game.rb et player.rb
require_relative 'lib/game'
require_relative 'lib/player'

#Création d'un joueur 1 : Josiane
player1 = Player.new("Josiane")
#Création d'un joueur 2 : José
player2 = Player.new("José")

#Tant que les deux joueurs sont en vie
while player1.life_points > 0 && player2.life_points > 0
	puts
	puts "Voici l'état de chaque joueur :"
	player1.show_state	#On affiche les points de vie de Josiane
	player2.show_state	#On affiche les points de vie de José
	puts
	puts "Passons à la phase d'attaque :"
	player1.attacks(player2)	#Josiane attaque José
	if player2.life_points > 0	#Si José est encore en vie
		player2.attacks(player1) 	#José attaque Josiane
	else	#Si José n'est plus en vie
		break		#On sort de la boule while
	end
end
