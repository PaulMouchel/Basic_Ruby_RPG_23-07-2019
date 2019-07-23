Projet Ruby du 23/07/2019

3 versions du projet :
- app.rb
- app2.rb
- app3.rb

Une classe Player dans player.rb
Une classe HumanPlayer héritée de Player dans player.rb
Une classe Game dans game.rb

------------------------------------------------------------------------------
Les applications :

app.rb :
	2 joueurs, Josiane et José se battent en tour par tour jusqu'à ce que l'un d'eux soit mort

app2.rb :
	Un joueur humain, avec 100 points de vie, et la possibilité de rechercher de nouvelles armes et des soins se bat contre deux joueurs ennemis

app3.rb :
	Un joueur humain, avec 100 points de vie, et la possibilité de rechercher de nouvelles armes et des soins se bat contre 10 ennemis qui arrivent au fur et à mesure sur le champ de bataille

------------------------------------------------------------------------------
Les classes :
Player:
	La classe player représente un personnage (joueur ou ennemi dans app.rb et uniquement ennemi dans app2.rb et app3.rb)

	--------
	Methodes
	--------

	initialize(name) :
	Initialisation du nom et des points de vie à la création de l'objet

  	show_state :
  	Affichage du nom et des points de vie

  	gets_damage(damages) :
  	Permet de recevoir des dommages et faire diminuer les points de vie

  	def attacks(player) :
  	Permet d'attaquer un joueur, on calcules les dommages infligés et le joueur visé utilise la methode gets_damages pour recevoir les dégats

  	compute_damage :
    Clacule les dégats infligés

HumanPlayer < Player:
	La classe player représente le joueur dans app2.rb et app3.rb. Elle est héritée de la classe player mais plus complète (plus de points de vie, et gestion des armes et des soins)

	--------
	Methodes
	--------

  	initialize(name) :
  	Initialisation du nom, des points de vie et du niveau d'arme à la création de l'objet

  	show_state :
    Affichage du nom, du nombre de points de vie et du niveau d'arme

  	compute_damage :
    Retoune les dommages calculés, en fonction du niveau d'arme

  	search_weapon :
  	Permet de tenter d'ameliorer son arme

  	search_health_pack :
  	Permet de tenter de se soigner
    
Game:
	La classe Game permet de gérer les différentes étapes du déroulement d'une partie dans app3.rb

	--------
	Methodes
	--------

	initialize(name) :
	Initialisation de la partie, création du héros avec son nom et des ennemis
   
  	kill_player(player) :
  	Tue un joueur en le supprimant du tableau d'ennemis

  	is_still_ongoing? :
 	vérifie si la partie est terminée ou non

	show_players :
	Affiche le status du héros et le nombre d'ennemis restants

	menu :
	Affiche le menu des différentes actions disponibles

  	menu_choice(choice) :
  	Traitement de l'action choisie dans le menu (Recherche d'une arme, recherche de soin ou attaque d'un ennemi)

  	enemies_attack :
 	Gestion de la phase d'attaque des ennemis (les ennemis restants attaquent le joueur un par un)

  	end :
  	Gestion de la fin de partie (affichage du message de victoire ou de défaite)
   
  	new_players_in_sight :
  	Gere l'arrivée de nouveaux ennemis dans le combat à chaque tour (au hasard, 0, 1 ou 2 ennemis arrivent)
