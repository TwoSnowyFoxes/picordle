function validate_input(user_input)
    local result = ''
    local exact = {}
    local remaining = {}

    for i=1, GAME.word_length do
        local chosen_letter = sub(GAME.word_to_guess, i, i)
        local input_letter = sub(user_input, i, i)

        if input_letter == chosen_letter then
            exact[i] = true
        else
            remaining[chosen_letter] = (remaining[chosen_letter] or 0) + 1
        end
    end

    for i=1, GAME.word_length do
        if exact[i] then
            result = result .. 'C'
        else
            local input_letter = sub(user_input, i, i)
            local count = remaining[input_letter] or 0
            result = result .. (count > 0 and 'P' or 'W')
            remaining[input_letter] = count - 1
        end
    end

    return result

end


function check_win()
    local is_win = false
    for i=1, #GAME.results do
        if GAME.results[i] == 'CCCCC' then
            is_win = true
        end
        -- Snap out of loop once we find win state
        if is_win == true then break end 
    end

    return is_win

end