class Game
  attr_accessor :human_player, :enemies
  
    def initialize(username)
      @human_player = HumanPlayer.new(username)
      @enemies = [Player.new("Ryuja"), Player.new("Despi"), Player.new("Leisu"), Player.new("Peepi")]
    end
  
    def kill_player(player_to_kill)
      @enemies.each do |player|
        @enemies.delete(player) if player.name == player_to_kill
      end
    end
  
    def is_still_ongoing?
      @human_player.life_points > 0 && @enemies != []
    end
  
    def show_players
      puts "--------------------------------------------------------------"
      puts @human_player.show_state
      puts "Il reste #{@enemies.count} ennemie(s) en vie."
      puts "--------------------------------------------------------------"
    end
  
    def menu
      puts "Quelle action veux-tu effectuer ?"
      puts "a. Chercher une meilleure arme"
      puts "s. Chercher à se soigner"
      puts
      puts "Attaquer un joueur :"
      @enemies.each do |player|
          puts "#{@enemies.index(player) + 1}. #{player.show_state}"
      end
      puts
      print "> "
    end

    def menu_choice
      input = gets.chomp 
      player = @enemies[input.to_i - 1]
        if input =="a"
          @human_player.search_weapon
        elsif input == "s"
          @human_player.search_health_pack
        elsif input.to_i > 0 && input.to_i < @enemies.count + 1
          @human_player.attacks(player)
          self.kill_player(player.name) if player.life_points < 1
        else
          "Ceci n'est pas une action valide. Vous perdez un tour !"
      end
    end

    def enemies_attack
      puts
      @enemies.each do |player|
        player.attacks(@human_player) if player.life_points > 0
        break if @human_player.life_points < 1
      end
    end

    def end
      puts "Fin de la partie !"
      if @human_player.life_points > 0
        puts "Félicitations ! Tu as remporté la manche."
      else
        puts "Hum, réessaye?"
      end
    end

  end
