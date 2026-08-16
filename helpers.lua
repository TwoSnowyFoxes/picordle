function has_value(str, val)
    for i = 1, #str do
        if sub(str, i, i) == val then
            return true
        end
    end
    return false
end


function validate_input(user_input)
    local result = ''
    for i=1, GAME.word_length do
        local chosen_letter = sub(GAME.word_to_guess, i, i)
        local input_letter = sub(user_input, i, i)

        if input_letter == chosen_letter then
            result = result .. 'C' -- Correct
        elseif has_value(GAME.word_to_guess, input_letter) then
            result = result .. 'P' -- Present
        else
            result = result .. 'W' -- Wrong
        end
    end

    return result

end


function check_win(results)
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