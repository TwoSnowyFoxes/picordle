-- Make tables to save guesses and their results
guesses = {}
results = {}
-- Choose a word

user_word = ''


----------------
-- Callback functions
----------------
function _init()

    -- Choose a word at the start of the game
    GAME.word_to_guess = select_word()

end

function _update()
    -- Check win condition
    has_won = check_win(results)
    has_no_turns_left = GAME.num_tries == #GAME.guesses and not has_won

    current_letter = get_current_letter()

    -- Disable controls if user has already won
    if not has_won then
        -- Add a letter with O, delete with left arrow, and submit with X
        user_word = add_letter(user_word, current_letter, GAME.word_length)
        user_word = delete_letter(user_word)

        -- Do a guess
        if btnp(5) then
            if do_a_guess(user_word) then
                user_word = ''
            end
        end
    
    end

end

function _draw()
    cls()
    print("Current: "..current_letter, 0, 0, 7)
    print(GAME.word_to_guess, 0, 12, 7)

    -- Draw the current typed word
    print(user_word, 50, 80, 9)

    for i=1, #results do
        print(results[i])
    end
    print(has_won)
    draw_board()
    
    if has_won then
        cls()
        print('You win!', 60, 60, 7)
    end

    if has_no_turns_left then
        cls()
        print('You lose', 60, 60, 7)
    end

end
