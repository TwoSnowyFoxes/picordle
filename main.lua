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
    GAME.letter_index = 1
    GAME.has_won = false
    GAME.game_over = false

end

function _update()
    GAME.current_user_letter = get_current_letter()

    if not GAME.has_won and not GAME.game_over then
        GAME.current_user_word = add_letter()
        GAME.current_user_word = delete_letter()

        if btnp(5) then
            if do_a_guess() then
                GAME.current_user_word = ""
                GAME.has_won = check_win()
                GAME.game_over = (#GAME.guesses >= GAME.num_tries) and not GAME.has_won
            end
        end
    end

end

function _draw()
    if GAME.has_won or GAME.game_over then
        cls()
        print(GAME.has_won and 'You win!' or 'You lose', 60, 60, 7)
        return
    end

    cls()
    print("Current: "..GAME.current_user_letter, 0, 0, 7)
    
    -- Draw the current typed word
    print(GAME.current_user_word, 50, 80, 9)
    draw_board()


    -- Draw debug information
    if btnp(1) then
        print(GAME.word_to_guess, 0, 12, 7)
        for i=1, #GAME.results do
            print(GAME.results[i])
        end
        print(GAME.has_won)
    end

    
end
