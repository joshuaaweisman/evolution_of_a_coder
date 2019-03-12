require "byebug"

if !guess && game.board[pos] && game.board[pos].revealed == false
    game.board[pos].revealed = true