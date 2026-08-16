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
function add_letter(word, current_letter)
    -- Add letter if word isn't full yet
    if #word < GAME.word_length and btnp(4) then
        word = word .. current_letter
    end
    return word
end

function delete_letter(word)
    if btnp(0) and #word > 0 then
        word = sub(word, 1, #word - 1)
    end
    return word
end

-- Input guess
function do_a_guess(user_word, guesses, results)
    if #user_word ~= GAME.word_length then
        return false
    end

    if not guesses then
        guesses = {}
    end
    if not results then
        results = {}
    end

    guesses[#guesses + 1] = user_word
    results[#guesses] = validate_input(word_to_guess, user_word)
    return true
end
