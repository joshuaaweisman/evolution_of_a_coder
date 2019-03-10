# Sudoku Solution Validator
# Write a function validSolution/ValidateSolution/valid_solution() that accepts a 2D array representing a Sudoku board, and returns true if it is a valid solution, or false otherwise. The cells of the sudoku board may also contain 0's, which will represent empty cells. Boards containing one or more zeroes are considered to be invalid solutions.
# The board is always 9 cells by 9 cells, and every cell only contains integers from 0 to 9.
# Examples
# validSolution([
#   [5, 3, 4, 6, 7, 8, 9, 1, 2],
#   [6, 7, 2, 1, 9, 5, 3, 4, 8],
#   [1, 9, 8, 3, 4, 2, 5, 6, 7],
#   [8, 5, 9, 7, 6, 1, 4, 2, 3],
#   [4, 2, 6, 8, 5, 3, 7, 9, 1],
#   [7, 1, 3, 9, 2, 4, 8, 5, 6],
#   [9, 6, 1, 5, 3, 7, 2, 8, 4],
#   [2, 8, 7, 4, 1, 9, 6, 3, 5],
#   [3, 4, 5, 2, 8, 6, 1, 7, 9]
# ]); // => true
# validSolution([
#   [5, 3, 4, 6, 7, 8, 9, 1, 2], 
#   [6, 7, 2, 1, 9, 0, 3, 4, 8],
#   [1, 0, 0, 3, 4, 2, 5, 6, 0],
#   [8, 5, 9, 7, 6, 1, 0, 2, 0],
#   [4, 2, 6, 8, 5, 3, 7, 9, 1],
#   [7, 1, 3, 9, 2, 4, 8, 5, 6],
#   [9, 0, 1, 5, 3, 7, 2, 1, 4],
#   [2, 8, 7, 4, 1, 9, 6, 3, 5],
#   [3, 0, 0, 4, 8, 1, 1, 7, 9]
# ]); // => false


def rotate(board)
    new_board = Array.new(9) {[]}

    i = 0
    while i < board.length
        board.each {|row| new_board[i] << row[i]}
        i += 1
    end

    new_board
end


def find_squares(grid)
    square_01 = grid[0][0..2] + grid[1][0..2] + grid[2][0..2]
    square_02 = grid[0][3..5] + grid[1][3..5] + grid[2][3..5]
    square_03 = grid[0][6..8] + grid[1][6..8] + grid[2][6..8]
    square_04 = grid[3][0..2] + grid[4][0..2] + grid[5][0..2]
    square_05 = grid[3][3..5] + grid[4][3..5] + grid[5][3..5]
    square_06 = grid[3][6..8] + grid[4][6..8] + grid[5][6..8]
    square_07 = grid[6][0..2] + grid[7][0..2] + grid[8][0..2]
    square_08 = grid[6][3..5] + grid[7][3..5] + grid[8][3..5]
    square_09 = grid[6][6..8] + grid[7][6..8] + grid[8][6..8]
    return [square_01, square_02, square_03, square_04, square_05, square_06, square_07, square_08]
end


def check_row(board)
    used_tiles = []
    board.each do |row|
        row.each do |tile|
            return false if tile == 0 || used_tiles.include?(tile)
            used_tiles << tile
        end
        used_tiles = []
    end
    true
end


def check_column(board)
    flipped_board = rotate(board)
    check_row(flipped_board)
end


def check_squares(board)
    squares_board = find_squares(board)
    check_row(squares_board)
end


def valid_solution(board)
    return false if board.any? {|row| row.include?(0)}
    return false unless check_row(board)
    return false unless check_column(board)
    return false unless check_squares(board)
    true
end