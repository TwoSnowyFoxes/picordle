-- Make tables to save guesses and their results
guesses = {}
results = {}
-- Choose a word

user_word = ''


----------------
-- Callback functions
----------------
function _init()

    -- Initialize gamestate
    GAME.guesses = {}
    GAME.results = {}
    GAME.word_to_guess = select_word()
    GAME.current_user_word = ""
    GAME.current_user_letter = alphabet[1]
    GAME.has_won = false
    GAME.game_over = false

end

function _update()
    -- Check win condition
    GAME.has_won = check_win()
    GAME.game_over = GAME.num_tries == #GAME.guesses and not GAME.has_won

    GAME.current_user_letter = get_current_letter()

    -- Disable controls if user has already won
    if not GAME.has_won or GAME.game_over then
        -- Add a letter with O, delete with left arrow, and submit with X
        GAME.current_user_word = add_letter(GAME.current_user_word, GAME.current_user_letter, GAME.word_length)
        GAME.current_user_word = delete_letter(GAME.current_user_word)

        -- Do a guess
        if btnp(5) then
            if do_a_guess(user_word) then
                GAME.current_user_word = ''
            end
        end
    
    end

end

function _draw()
    cls()
    print("Current: "..GAME.current_user_letter, 0, 0, 7)
    
    -- Draw the current typed word
    print(GAME.current_user_word, 50, 80, 9)
    draw_board()


    -- Debug information
    if btnp(1) then
        print(GAME.word_to_guess, 0, 12, 7)
        for i=1, #GAME.results do
            print(GAME.results[i])
        end
        print(GAME.has_won)
    
    end

    
    -- Game end
    if GAME.has_won then
        cls()
        print('You win!', 60, 60, 7)
    end

    if game_over then
        cls()
        print('You lose', 60, 60, 7)
    end

end
