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
    GAME.current_user_word = sub('_____', 1, GAME.word_length)
    GAME.cursor_index = 1
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
    print(GAME.current_user_word, 50, 80, 9)
    local cursor_x = 50 + (GAME.cursor_index - 1) * 4
    draw_caret(cursor_x, 73, false, 9)
    draw_caret(cursor_x, 88, true, 9)
    draw_board()

    if GAME.show_debug then
        print(GAME.word_to_guess, 0, 12, 7)
        for i=1, #GAME.results do
            print(GAME.results[i])
        end
        print(GAME.has_won)
    end

end
