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