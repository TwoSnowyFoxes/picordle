function move_cursor()
    if btnp(CONTROLS.left) then
        GAME.cursor_index -= 1
        if GAME.cursor_index < 1 then GAME.cursor_index = GAME.word_length end
    elseif btnp(CONTROLS.right) then
        GAME.cursor_index += 1
        if GAME.cursor_index > GAME.word_length then GAME.cursor_index = 1 end
    end
end

function cycle_letter()
    if btnp(CONTROLS.up) or btnp(CONTROLS.down) then
        -- Get position of current letter in alphabet
        local current_letter = sub(GAME.current_user_word, GAME.cursor_index, GAME.cursor_index)
        local letter_index = 1
        for i=1, #alphabet do
            if alphabet[i] == current_letter then letter_index = i break end
        end

        -- Cycle through the alphabet based on the user input
        -- Blank slots enter from the nearest alphabet edge.
        if current_letter == '_' then
            if btnp(CONTROLS.up) then
                letter_index = 1
            elseif btnp(CONTROLS.down) then
                letter_index = #alphabet
            end
        elseif btnp(CONTROLS.up) then
            letter_index += 1
            if letter_index > #alphabet then letter_index = 1 end
        elseif btnp(CONTROLS.down) then
            letter_index -= 1
            if letter_index < 1 then letter_index = #alphabet end
        end

        -- Build the word with the new chosen letter
        local index = GAME.cursor_index
        GAME.current_user_word = sub(GAME.current_user_word, 1, index - 1)
            .. alphabet[letter_index]
            .. sub(GAME.current_user_word, index + 1)
    end
end

function submit_guess()
    -- Don't allow a guess when at least 1 letter hasn't been chosen
    for i=1, GAME.word_length do
        if sub(GAME.current_user_word, i, i) == '_' then return end
    end

    GAME.guesses[#GAME.guesses + 1] = GAME.current_user_word
    GAME.results[#GAME.guesses] = validate_input(GAME.current_user_word)
    GAME.current_user_word = sub('_____', 1, GAME.word_length)
    GAME.cursor_index = 1
    GAME.has_won = GAME.results[#GAME.results] == 'CCCCC'
    GAME.game_over = (#GAME.guesses >= GAME.num_tries) and not GAME.has_won
end

function handle_input()
    move_cursor()
    cycle_letter()
    if btnp(CONTROLS.debug) then GAME.show_debug = not GAME.show_debug end
    if btnp(CONTROLS.submit) then submit_guess() end
end
