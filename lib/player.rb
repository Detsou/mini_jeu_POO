class Player
attr_accessor :name, :life_points

  def initialize(its_name, its_life_points = 10)
    @name = its_name
    @life_points = its_life_points
  end

  def show_state
    if self.life_points > 0
      "#{self.name} a #{self.life_points} points de vie restant."
    else
      "#{self.name} est mort."
    end
  end

  def gets_damage(damage_received)
    self.life_points -= damage_received
    puts "Le joueur #{self.name} a été tué !" if self.life_points <= 0
  end

  def attacks(attacked_player)
    puts "Le joueur #{self.name} attaque le joueur #{attacked_player.name}."
    damage = compute_damage 
    puts "Il lui inflige #{damage} points de dégâts !"
    attacked_player.gets_damage(damage)
  end
  
  def compute_damage
    rand(1..6)
  end
end

class HumanPlayer < Player
attr_accessor :weapon_level

  def initialize(its_name, its_life_points = 100, its_weapon_level = 1)
    @name = its_name 
    @life_points = its_life_points
    @weapon_level = its_weapon_level
  end

  def show_state
    "Tu as #{self.life_points} points de vie restant et une arme de niveau #{self.weapon_level}."
  end

  def compute_damage
    critical_hit_chance = rand(1..6) 
    if critical_hit_chance == 6
      puts "Coup critique !!"
      return rand(1..6) * @weapon_level * 2
    else
      return rand(1..6) * @weapon_level
    end
  end

  def search_weapon
    weapon_found = rand(1..4)
    puts "Tu as trouvé une arme de niveau #{weapon_found}."
    if weapon_found > self.weapon_level
      puts "Bien joué ! Tu remplaces ton arme de niveau #{self.weapon_level} pour une arme de niveau #{weapon_found}."
      self.weapon_level = weapon_found
    else
      puts "Moins bien que celle que tu as actuellement, de niveau #{self.weapon_level}."
    end
  end

  def search_health_pack
    chances_to_find = rand(1..6)
    if chances_to_find == 1
      puts "Tu n'as rien trouvé..."
    elsif chances_to_find.between?(2,5)
      puts "Bravo, tu as trouvé un pack de +20 points de vie !"
      self.life_points += 20
      self.life_points = 100 if self.life_points > 100
    else
      puts "Wow, tu as trouvé un pack de +60 points de vie !"
      self.life_points += 60
      self.life_points = 100 if self.life_points > 100
    end
  end
end