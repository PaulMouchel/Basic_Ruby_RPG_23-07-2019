class Player
	attr_accessor :name, :life_points

  #Initialisation du personnage
	def initialize(name) 
    @name = name
    @life_points = 10
  end

  #Affichage du nom et du nombre de points de vie
  def show_state
  	puts "#{@name} a #{@life_points} points de vie"
  end

  #Permet de recevoir des dommages
  def gets_damage(damages)
    @life_points -= damages
    @life_points = 0 if @life_points < 0
    puts "le joueur #{@name} a été tué !" if @life_points <= 0   
  end

  #Permet d'attaquer un joueur
  def attacks(player)
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    damages = compute_damage
    puts "il lui inflige #{damages} points de dommages"
    player.gets_damage(damages)
  end

  #Retourne une valeur aléatoire entre 1 et 6 pour infliger des dommages
  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level 

  #Initialisation du personnage
  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end
 
  #Affichage du nom, du nombre de points de vie et du niveau d'arme
  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  #Retoune les dommages calculés
  def compute_damage
    return rand(1..6) * @weapon_level
  end

  #Permet de tenter d'ameliorer son arme
  def search_weapon 
    weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_level}"
    if weapon_level > @weapon_level
      @weapon_level = weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  #Permet de tenter de se soigner
  def search_health_pack
    result = rand(1..6)
    if result == 1
      puts "Tu n'as rien trouvé... "
    elsif result >= 2 && result <= 5
      @life_points += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    elsif result == 6
      @life_points += 80
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
    @life_points = 100 if @life_points > 100
  end
end
