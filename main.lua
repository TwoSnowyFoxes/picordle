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
word = ''


----------------
-- Callback functions
----------------
function _init()

end

function _update()
    current_letter = get_current_letter()
    
    -- Add letter if button is pressed
    if btnp(4) then
        add_letter(word, current_letter, word_length)
    end
    
end

function _draw()
    cls()
    print("Current: "..current_letter, 0, 0, 7)
    print('Results')
    print('')
    print(validate_input(chosen_word, guesses[1]))
    print(chosen_word)
    print(word)
    debug_rects()
    local results = {}
    results[1] = validate_input(chosen_word, guesses[1])
    draw_board(
        default_tile_size,
        default_gap_size,
        word_length,
        num_tries,
        guesses,
        results)
end
