alphabet = {
	'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
	'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
}

-- Start game on first letter
current_letter = alphabet[1]
index = 1
function get_current_letter()
    if btnp(2) then --up
        index += 1
        if index > #alphabet then index = 1 end  -- wrap around
        current_letter = alphabet[index]
    elseif btnp(3) then --down
        index -= 1
        if index < 1 then index = #alphabet end  -- wrap around
        current_letter = alphabet[index]
    end

    return current_letter
end

-- Num of guesses starts at 0. Increment after filling word
guess = 0
num_letters_in_word = 0
function add_letter(word, current_letter, word_length)
    -- Add letter if word isn't 5 (word_length) long yet
    if #word < word_length and btnp(4) then
        word = word .. current_letter
    end
    return word
end


function delete_letter(word)
    if btnp(5) then
        word = sub(word, 1, #word - 1) 
    end
    return word
end

-- Input guess
function do_a_guess(user_word, word_length, guesses, results, try)
    if #user_word == word_length and btnp(5) then
        guesses[try] = user_word
        results[try] = validate_input(word_to_guess, user_word)
    end
end
