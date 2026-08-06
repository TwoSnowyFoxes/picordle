----------------
-- Main variables
----------------
word_length = 5
num_tries = 5
-- Tile placement
local default_tile_size = 10
local default_gap_size = 2


-- Make a table to save guesses to
local guesses = {}
-- Choose a word
chosen_word = select_word()
-- Add testround
guesses[1] = 'TABLE'


----------------
-- Callback functions
----------------
function _init()

end


function _update()
    print('Results')
    print('')
    print(validate_input(chosen_word, guesses[1]))
    print(chosen_word)
end


function _draw()
    debug_rects() -- Debugging
    draw_board(
        default_tile_size,
        default_gap_size,
        word_length,
        num_tries,
        guesses,
        validate_input(chosen_word, guesses[1]))
end

