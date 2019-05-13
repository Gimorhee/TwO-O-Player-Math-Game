require_relative 'players'
require_relative 'questions'

player1 = Players.new("Player 1")
player2 = Players.new("Player 2")

current_player = 1

while (player1.alive? && player2.alive?)
    player = current_player == 1 ? player1 : player2
    question = Questions.new()

    puts "#{player.name}: #{question.question}"
    print "> "
    answer = gets.chomp.to_i

    if(answer == question.answer) 
        puts "#{player.name}: YES! You are correct."
        puts "#{player1.name}: #{player1.life}/3 vs #{player2.name}: #{player2.life}/3"
    else
        player.life -= 1
        puts "#{player.name}: Seriously? No!"
        puts "#{player1.name}: #{player1.life}/3 vs #{player2.name}: #{player2.life}/3"
    end
    puts "-----------NEW TURN-----------"
    current_player = (current_player + 1) % 2
end

if player1.life == 0 
    puts "#{player2.name} wins with a score of #{player2.life}/3"
elsif player2.life == 0
    puts "#{player1.name} wins with a score of #{player1.life}/3"
end

puts "-----------GAME OVER-----------"
puts "Good Bye!"