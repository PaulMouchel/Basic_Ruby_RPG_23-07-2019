class Game
	attr_accessor :human_player , :enemies_in_sight , :players_left 

  #Initilisation de la partie
	def initialize(name)
    @players_left = 10
    @enemies_in_sight  = []
    @human_player = HumanPlayer.new(name)
  end

  #Tue un joueur en le supprimant du tableau d'ennemis
  def kill_player(player)
    @enemies_in_sight.delete(player)
    @players_left -= 1
  end

  #vérifie si la partie est terminée ou non
  def is_still_ongoing?
    return @human_player.life_points > 0 && @players_left > 0
  end

  #Affiche le status du héros et le nombre d'ennemis restants
  def show_players
    puts "-------------------------------------------------------------------------------"
    @human_player.show_state
    puts "Il reste #{@enemies_in_sight.size} ennemis en vue et #{@players_left} ennemis"
    gets
  end

  #Affiche le menu
  def menu 
    puts "-------------------------------------------------------------------------------"
    puts "Quelle action veux-tu effectuer ?"
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts
    puts "attaquer un joueur en vue :"
    0.upto(@enemies_in_sight.size - 1) do |index|
      print "#{index} - "
      @enemies_in_sight[index].show_state #Affichage du status de l'ennemi
    end
  end

  #Traitement de l'action choisie dans le menu
  def menu_choice(choice)
    puts "-------------------------------------------------------------------------------"
    case choice #Traitement du choix effectué
    when "a"
      @human_player.search_weapon #Recherche d'une arme
    when "s"
      @human_player.search_health_pack #Recherche de soin
    else
      if choice.to_i <= @enemies_in_sight.size-1
        @human_player.attacks(enemies_in_sight[choice.to_i]) #Attaquer un ennemi
        kill_player(@enemies_in_sight[choice.to_i]) if @enemies_in_sight[choice.to_i].life_points <= 0
      end
    end
    gets
  end

  #Gestion de la phase d'attaque des ennemis
  def enemies_attack
    puts "-------------------------------------------------------------------------------"
    puts "Les autres joueurs t'attaquent !" if @enemies_in_sight.size > 0
    @enemies_in_sight.each do |enemy|
      enemy.attacks(@human_player) #Chaque ennemi attaque
    end
    gets
  end

  #Gestion de la fin de partie
  def end 
    puts "-------------------------------------------------------------------------------"
    puts  "La partie est finie"
    if @human_player.life_points > 0 #Si le héros a vaicu les ennemis
      puts "BRAVO ! TU AS GAGNE !" #Message de victoire
    else #Si le héros s'est fait tuer
      puts "Loser ! Tu as perdu !" #Message de défaite
    end
  end

  def new_players_in_sight 
    puts "-------------------------------------------------------------------------------"
    if @players_left == @enemies_in_sight.size
      puts "Tous les joueurs sont déjà en vue"
    else
      result = rand(1..6)
      if result == 1
        puts "Aucun nouvel adversaire n'arrive"
      elsif result >= 2 && result <= 4
        puts "Un nouvel ennemi fait son apparition !"
        @enemies_in_sight << Player.new("ennemi_#{10-@players_left+@enemies_in_sight.size}")
      elsif result >= 5 && result <= 6
        puts "Deux ennemis font leur apparition !"
        @enemies_in_sight << Player.new("ennemi_#{10-@players_left+@enemies_in_sight.size}")
        @enemies_in_sight << Player.new("ennemi_#{10-@players_left+@enemies_in_sight.size}")
      end
    end
    gets
  end
end
