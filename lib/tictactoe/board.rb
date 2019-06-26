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

