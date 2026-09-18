-- Start game on first letter
function get_current_letter()
    if btnp(2) then --up
        GAME.letter_index += 1
        if GAME.letter_index > #alphabet then GAME.letter_index = 1 end  -- wrap around
        GAME.current_user_letter = alphabet[GAME.letter_index]
    elseif btnp(3) then --down
        GAME.letter_index -= 1
        if GAME.letter_index < 1 then GAME.letter_index = #alphabet end  -- wrap around
        GAME.current_user_letter = alphabet[GAME.letter_index]
    end

end

-- Add letter to word
function add_letter()
    -- Add letter if word isn't full yet
    if #GAME.current_user_word < GAME.word_length and btnp(4) then
        GAME.current_user_word = GAME.current_user_word .. GAME.current_user_letter
    end
end

function delete_letter()
    if btnp(0) and #GAME.current_user_word > 0 then
        GAME.current_user_word = sub(GAME.current_user_word, 1, #GAME.current_user_word - 1)
    end
end

function submit_guess()
    if #GAME.current_user_word ~= GAME.word_length then
        return false
    end

    GAME.guesses[#GAME.guesses + 1] = GAME.current_user_word
    GAME.results[#GAME.guesses] = validate_input(GAME.current_user_word)
    GAME.current_user_word = ""
    GAME.has_won = GAME.results[#GAME.results] == 'CCCCC'
    GAME.game_over = (#GAME.guesses >= GAME.num_tries) and not GAME.has_won
    return true
end

function handle_input()
    get_current_letter()
    add_letter()
    delete_letter()

    if btnp(5) then submit_guess() end
end
