----------------
-- Callback functions
----------------
---
--- INIT
---
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
    GAME.show_debug = false

end


---
--- UPDATE
---
function _update()
    if GAME.has_won or GAME.game_over then
        return
    end

    handle_input()
    if btnp(1) then GAME.show_debug = not GAME.show_debug end
end


---
--- DRAW
---
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
    if GAME.show_debug then
        print(GAME.word_to_guess, 0, 12, 7)
        for i=1, #GAME.results do
            print(GAME.results[i])
        end
        print(GAME.has_won)
    end

end
