----------------
-- Main variables
----------------
local word_length = 5
local num_tries = 5
-- Tile placement
local default_tile_size = 10
local default_gap_size = 2


-- Make a table to save guesses to
local guesses = {}
-- Choose a word
chosen_word = select_word()
-- Add testround
guesses[1] = {
    chosen_word[1],
    chosen_word[2],
    chosen_word[3],
    chosen_word[4],
    chosen_word[5]
}



function validate_input(chosen_word, input)
    local result = {}
    for i=1, word_length do
    end

    return result

end


----------------
-- Callback functions
----------------
function _init()

end


function _update()

end


function _draw()
    debug_rects() -- Debugging
    -- draw_tile(32, 32, 10, 3, 'H')
    draw_board(
        default_tile_size,
        default_gap_size,
        word_length,
        num_tries,
        guesses)
end

