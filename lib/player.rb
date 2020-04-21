class Player
attr_accessor :name, :life_points

  def initialize(its_name, its_life_points = 100)
    @name = its_name
    @life_points = its_life_points
  end

  def show_state
    "#{self.name} a #{self.life_points} points de vie restant."
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
    critical_hit = rand(1..5)
    if critical_hit == 5
    puts "Coup critique !!"
    return rand(40..50)
    else 
    return rand(5..30)
    end
  end

end