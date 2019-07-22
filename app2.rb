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
#Création du héros avec saisie de son nom
hero = HumanPlayer.new(gets.chomp)
#Création du tableau 'ennemis'
enemies = [Player.new("Josiane"), Player.new("José")]

#Tant que le héros et en vie et qu'au moins un des deux ennemis est en vie
while hero.life_points > 0 && (enemies[0].life_points > 0 || enemies[1].life_points > 0)
	puts "-------------------------------------------------------------------------------"
	puts "Voici l'état du joueur :"
	hero.show_state #Affichage de l'état du héros
	gets
	puts "-------------------------------------------------------------------------------"
	#Affichage du menu des action disponibles
  puts "Quelle action veux-tu effectuer ?"
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts
	puts "attaquer un joueur en vue :"
	print "0 - "
	enemies[0].show_state #Affichage du status du premier ennemi
	print "1 - "
	enemies[1].show_state#Affichage du status du deuxieme ennemi
	choice = gets.chomp
	while choice != "a" && choice != "s" && choice != "0" && choice != "1" #Vérification que le choix rentré est correct
		puts "Il n'y a que 4 choix, c'est pas bien compliqué pourtant ! Essaye encore"
		print "> "
		choice = gets.chomp
	end
	puts "-------------------------------------------------------------------------------"
	case choice #Traitement du choix effectué
	when "a"
	  hero.search_weapon #Recherche d'une arme
	when "s"
	  hero.search_health_pack #Recherche de soin
	when "0"
	  hero.attacks(enemies[0]) #Attaquer Josiane
	when "1"
	  hero.attacks(enemies[1]) #Attaquer José
	end
	gets
	puts "-------------------------------------------------------------------------------"
	#Les ennemis attaquent s'il y en a au moins un en vie
	puts "Les autres joueurs t'attaquent !" if enemies[0].life_points > 0 || enemies[1].life_points > 0
	enemies.each do |enemy|
		enemy.attacks(hero) if enemy.life_points > 0	#Chaque ennemi attaque si il n'est pas mort
	end
	gets
end

#Fin de partie
puts
puts  "La partie est finie"
if hero.life_points > 0 #Si le héros a vaicu les ennemis
	puts "BRAVO ! TU AS GAGNE !" #Message de victoire
else #Si le héros s'est fait tuer
	puts "Loser ! Tu as perdu !" #Message de défaite
end
