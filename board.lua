-- Code for creating the letter boards

-- Create debug rects in the corners for clarity
function debug_rects()
    local size = 2
    rectfill(0, 0, size, size, 3)
    rectfill(127 - size, 0, 127, size, 3)
    rectfill(0, 127 - size, size, 127, 3)
    rectfill(127 - size, 127 - size, 127, 127, 3)
end


-- Draw a simple tile. No state held.
function draw_tile(x, y, size, col, letter)
    rectfill(x, y, x + size, y + size, col)
    print(letter, (x + (size/3)), (y + (size/3)), 0)
    print()

end

function tile_color(result_letter)
    local tile_color
    if result_letter == 'C' then
        tile_color = 3
    elseif result_letter == 'P' then
        tile_color = 9
    else
        tile_color = 1
    end
    return tile_color

end

-- Draw entire board. Uses sizes & word length in main
function draw_board(
    guesses,
    results
    )
    -- Define top-left corner to start the letters (Half block + 2 blocks)
    local start_x = 128/2-(GAME.tile_size/2)-(2*GAME.tile_size)-(2*GAME.gap_size)
    local start_y = 128/3-(GAME.tile_size/2)-(2*GAME.tile_size)-(2*GAME.gap_size)
    local offset_y = 0

    -- For every vertical row
    for i=1, GAME.num_tries do
        local offset_x = 0
        local user_word = guesses[i] or '' -- Get word in this round if exists
        local result = results[i]
        -- Create 5 tiles horizontally
        for i=1, GAME.word_length do
            local user_letter = user_word[i] or '' -- Get letter or leave empty
            local result_letter = sub(result, i, i)
            draw_tile(start_x + offset_x, start_y + offset_y, GAME.tile_size, tile_color(result_letter), user_letter)
            offset_x += (GAME.tile_size + GAME.gap_size)
        end
        offset_y += (GAME.tile_size + GAME.gap_size)
    end
end