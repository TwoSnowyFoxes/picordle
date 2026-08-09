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
guesses[2] = 'BALLS'
user_word = ''


----------------
-- Callback functions
----------------
function _init()

end

function _update()
    current_letter = get_current_letter()
    
    -- Add letter if button is pressed
    user_word = add_letter(user_word, current_letter, word_length)
    user_word = delete_letter(user_word)
    
end

function _draw()
    cls()
    print("Current: "..current_letter, 0, 0, 7)
    print('Results')
    print('')
    print(validate_input(chosen_word, guesses[1]))
    print(chosen_word)

    -- Draw user word
    print(user_word, 50, 80, 9)

    -- Debug rects
    debug_rects()

    local results = {}

    -- Debug result
    results[1] = validate_input(chosen_word, guesses[1])
    draw_board(
        default_tile_size,
        default_gap_size,
        word_length,
        num_tries,
        guesses,
        results)
end
