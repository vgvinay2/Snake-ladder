puts "Enter players names"
players = gets.chomp
p players = players.split(' ').reject{|u| u=="nil" || u=="''"|| u== "\"\""|| u== "\\n"} 
puts "Enter dice value"
dice = gets.chomp.to_i


puts "Enter Snake value"
snakes = gets.chomp.to_i

puts "Enter ladder value"
ladders = gets.chomp.to_i

puts "Enter board Size by default it will be should be greater than 50"
board = gets.chomp.to_i
# players,dice,snakes, ladders, board_size=100)
if players.size > 0 && dice > 0  && snakes > 0 && ladders > 0 
   players = players
    board_size = board_size.nil? ? 100 : board_size
   # set sanake and ladder in hash format so that based on movement will happen  while creating instance!!
   def random_board(snakes,ladders, board_size)
    snakes = snakes.to_i
    ladders = ladders.to_i
    get_max = snakes + ladders # ? snakes : ladders 
    snakes_ladders = {}
    my_hash = {}
    until snakes_ladders.count == get_max
      new_ele = snake_or_ladder(board_size)
      get = new_ele.inject(0){|sum,key| sum = sum+key.inject(:-)} > 0 ? "snakes" : "ladders" 
      global_ladder_snake = get=="snakes" ? snakes : ladders
      if (my_hash[get].to_s.to_sym <= get.to_sym )&& ( (my_hash[get].nil? ? 0 : my_hash[get] ) < global_ladder_snake )
         snakes_ladders = snakes_ladders.merge(new_ele)
         get_snake_ladder(snakes_ladders,my_hash)
      end 
       my_hash
    end
    snakes_ladders
  end

  #set snake and ladder in hash format
  def snake_or_ladder(board_size)
    start = random_cell_value(board_size)
    ending = random_cell_value(board_size)
    return {start=>ending} unless start == ending
    snake_or_ladder(board_size) 
  end

#adding one becouse in some case rand will give 0
  def random_cell_value(board_size)
    1 + rand(board_size - 1)
  end

#get how  many snake and ladder in our game
  def get_snake_ladder(snakes_ladders,my_hash)
    my_hash["snakes"]  = snakes_ladders.inject([]){|k,v| k << (v[0]-v[-1])}.select {|x| x > 0}.count
    my_hash["ladders"] = snakes_ladders.inject([]){|k,v| k << (v[0]-v[-1])}.select {|x| x < 0}.count
    return my_hash
  end
  snakes_ladders = random_board(snakes,ladders, board_size)#get snake and ladder in hash format and based on movement will happen
  p "------------------------------#{snakes_ladders}"
  def throw_dice dice
     dice = dice.to_i
     return 1 + rand(dice)
  end
# key method if problem how player will move and get value to move to know how its working check move method and uncommentfallowing line
   def move(players, player_turn,mdice,snakes_ladders,board_size,players_name)
    puts "#{players} .. #{players_name[player_turn]} your current position is #{players[player_turn]} its your turn to play so through a dice by press Enter"
    mthrough_dice = gets.chomp.to_i 
    my_val = throw_dice(mdice=6)
    puts "#{players_name[player_turn]} you got this number #{my_val}"
    new_position = players[player_turn] + my_val
    if snakes_ladders.has_key?(new_position)
      puts "#{players_name[player_turn]} you got #{ (my_val.to_i - players_name[new_position].to_i) < 0 ?  'snakes' : 'ladder' }.... so your new position #{snakes_ladders[new_position]} "
     new_position = snakes_ladders[new_position] 
    else 
      puts "#{players_name[player_turn]} your new position #{new_position} "
    end 
     return player_turn if new_position >= board_size 
     players[player_turn] = new_position
     next_player = (player_turn + 1) % players.length
     move(players, next_player,mdice,snakes_ladders,board_size,players_name)
   end
  # after create instance call this method to get winner name
   def play players,snakes,ladders,dice,board_size
     p "Game started --------"
     players_name = players
     players_starting_positions = players.map{0} #empty array basedon user  
     starting_player = rand(players.length) # 0,1,2
      snakes_ladders = random_board(snakes,ladders, board_size)#get snake and ladder in hash format and based on movement will happen
     mdice = dice
     winner = move(players_starting_positions, starting_player,mdice,snakes_ladders,board_size=100,players_name)
     puts "Game started between these #{players} players  ----and---- #{players[winner]} is winner!"
     # return  players[winner]  
    end
  puts play players,snakes,ladders,dice,board
else 
    p "Enter values of Dice #{dice}  Snakes #{snakes} && Ladders #{ladders} cant blank!! It should be greater than 0"
end 