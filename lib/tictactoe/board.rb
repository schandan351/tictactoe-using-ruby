class Board
    BOARD_MAX_INDEX=2
    EMPTY_POS=''

    def initialize(current_player)
        @current_player=current_player
        # creates array of 3*3
        @board=Array.new(BOARD_MAX_INDEX+1){
            Array.new(BOARD_MAX_INDEX+1){
                EMPTY_POS
            }
        }
    end


# display function  for board display
    def display
        puts "+-------------------+"

        for row in 0..BOARD_MAX_INDEX
            print '|'
            for col in 0..BOARD_MAX_INDEX
                s=@board[row][col]
                if s==EMPTY_POS
                    print col+(row*3)+1
                else
                    print s
                end
                print "|"
            end
           puts "" 
        end
        print "\n+--------------+"

    end
end

# not_full function

def board_full
    # check every rows and columns if there is empty position or not
    for row in 0..BOARD_MAX_INDEX
        for col in 0..BOARD_MAX_INDEX
            if @board[row][col]==EMPTY_POS
                return false
            end
        end

    end
    # if board is full
    return true

end

# winner is checked through
# In tictactoe winner is determined 
# if all elements of row is same so -------->winner_row
# if all elements of column is same ----------->winner_col
# if elements of diagoal elemnts are matched ------->winner_daigonal

# There may be condition where noone is winner

# winner fucntion

def winner
    winner=winner_row()
    if winner
        return winner
    end

    winner=winner_col()
    if winner
        return winner
    end
    
    winner=winner_daigonal()
    if winner 
        return winner
    end

    # if no winner 
    return "noone wins"
end


# now we have to define winner_row

def winner_row
    for row_index in 0..BOARD_MAX_INDEX
        first_symbol=@board[row_index][0]
        for col_index in 1..BOARD_MAX_INDEX
            if first_symbol !=@board[row_index][col_index]
                break    
            elsif col_index ==BOARD_MAX_INDEX and first_symbol != EMPTY_POS
                return first_symbol
            end
        end
    end
    return 
end

# same as winner_row we have to define winner_col

def winner_col
  for col_index in 0..BOARD_MAX_INDEX
    first_symbol=@board[0][col_index]

    for row_index in 1..BOARD_MAX_INDEX
      if first_symbol !=@board[row_index][col_index]
        break
      elsif
        row_index == BOARD_MAX_INDEX and first_symbol !=EMPTY_POS
        return first_symbol
      end
    end
  end
  return 
end

#for diagonnal winner we have to check board[0][0],board[1][1] and [2][2] elements
# and for reverse diagonal we have to check board[0][max_index_of_board],board[1][max_index_of_board-1],board[2][max_index_of_board-2]

def winner_daigonal
  first_symbol=@board[0][0]
    for index in 1..BOARD_MAX_INDEX
      if first_symbol !=@board[index][index]
        break
      elsif index==BOARD_MAX_INDEX and first_symbol!=EMPTY_POS
        return first_symbol
      end
    end

    
    first_symbol=@board[0][BOARD_MAX_INDEX]
    row_index=0
    col_index=BOARD_MAX_INDEX

    while  row_index < BOARD_MAX_INDEX
      row_index+=1
      col_index-=1

      if first_symbol !=@board[row_index][col_index]
        break
      elsif row_index==BOARD_MAX_INDEX and first_symbol!=EMPTY_POS
        return first_symbol
      end
      
    end
    return 
end

# ask player for move

def ask_player_for_move(current_player)
  played=false
  while not played
    puts "player" +current_player +"where would you like to play"
    move=gets.to_i-1
    col= move % @board.size
    row=(move-col) % @board.size

    if validate_position(row,col)
      @board[row][col]=current_player
      played=true
    end
  end
end

# now we have to define validate_postion 

def validate_position(row,col)
  if row<=@board.size and col <=@board.size
    if @board[row][col]==EMPTY_POS
      return true
      else
        puts "position is occupied"
      end
    else
      puts "invalid position"
    end
    return false
end

