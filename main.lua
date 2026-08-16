----------------
-- Main variables
----------------
word_length = 5
num_tries = 5
-- Tile placement
local default_tile_size = 10
local default_gap_size = 2


-- Make tables to save guesses and their results
guesses = {}
results = {}
-- Choose a word
word_to_guess = select_word()
user_word = ''


----------------
-- Callback functions
----------------
function _init()

end

function _update()
    -- Check win condition
    has_won = check_win(results)

    current_letter = get_current_letter()

    -- Disable controls if user has already won
    if not has_won then
        -- Add a letter with O, delete with left arrow, and submit with X
        user_word = add_letter(user_word, current_letter, word_length)
        user_word = delete_letter(user_word)

        -- Do a guess
        if btnp(5) then
            if do_a_guess(user_word, word_length, guesses, results) then
                user_word = ''
            end
        end
    
    end

end

function _draw()
    cls()
    print("Current: "..current_letter, 0, 0, 7)
    print(word_to_guess, 0, 12, 7)

    -- Draw the current typed word
    print(user_word, 50, 80, 9)

    -- Debug rects
    debug_rects()
    for i=1, #results do
        print(results[i])
    end
    draw_board(
        default_tile_size,
        default_gap_size,
        word_length,
        num_tries,
        guesses,
        results)
    
    if has_won then
        print('You win!!!!')
    end
end
