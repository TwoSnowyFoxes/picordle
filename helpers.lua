function has_value(str, val)
    for i = 1, #str do
        if sub(str, i, i) == val then
            return true
        end
    end
    return false
end


function validate_input(word_to_guess, input)
    local result = ''
    for i=1, word_length do
        local chosen_letter = sub(word_to_guess, i, i)
        local input_letter = sub(input, i, i)

        if input_letter == chosen_letter then
            result = result .. 'C' -- Correct
        elseif has_value(word_to_guess, input_letter) then
            result = result .. 'P' -- Present
        else
            result = result .. 'W' -- Wrong
        end
    end

    return result

end