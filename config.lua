-- Centralized project constants

-- All constants & values related to the game state
GAME = {
    word_length = 5,
    num_tries = 5,
    tile_size = 10,
    gap_size = 2,
    board_x = 20,
    board_y = 20,
    guesses = {},
    results = {},
    word_to_guess = '',
    current_user_word = '',
    current_user_letter = '',
    has_won = false,
    game_over = false

}

-- color mapping for ease
COLORS = {
    black = 0,
    dark_blue = 1,
    dark_purple = 2,
    green = 3,
    brown = 4,
    dark_gray = 5,
    light_gray = 6,
    white = 7,
    red = 8,
    orange = 9,
    yellow = 10,
    light_green = 11,
    light_blue = 12,
    lavender = 13,
    pink = 14,
    peach = 15
}

-- Assign default tile colors
TILE_COLORS = {
    correct = COLORS.green,
    present = COLORS.yellow,
    wrong = COLORS.dark_gray,
    empty = COLORS.black
}

-- Assign unique letters for validating letters
RESULT_CODES = {
    correct = "C",
    present = "P",
    wrong = "W"
}