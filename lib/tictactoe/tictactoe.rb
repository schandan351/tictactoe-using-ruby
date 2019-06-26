require_relative 'board.rb'

puts ".............starting tictoktoe.........."
puts

players=['X','O']

# # choose random player
current_player=players[rand(2)]

b=Board.new(current_player)
b.display

while not b.board_full() and not b.winner()
    b.ask_player_for_move(current_player)
    current_player=b.get_next_turn()
    b.display()
end

if  b.winner()
    puts "\n player:--->" + b.get_next_turn() +":wins"
else
    puts "tie game"
end

puts "GAME OVER"

