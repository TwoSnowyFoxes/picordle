-- Code for creating the letter boards

-- Create debug rects in the corners for clarity
-- function debug_rects()
--     local size = 2
--     rectfill(0, 0, size, size, 3)
--     rectfill(127 - size, 0, 127, size, 3)
--     rectfill(0, 127 - size, size, 127, 3)
--     rectfill(127 - size, 127 - size, 127, 127, 3)
-- end


-- Draw a simple tile. No state held.
function draw_tile(x, y, size, col, letter)
    rectfill(x, y, x + size, y + size, col)
    print(letter, (x + (size/3)), (y + (size/3)), 0)
end

-- Decide on the color to give each tile
function tile_color(result_letter)
    local tile_color
    if result_letter == RESULT_CODES.correct then
        tile_color = TILE_COLORS.correct
    elseif result_letter == RESULT_CODES.present then
        tile_color = TILE_COLORS.present
    else
        tile_color = TILE_COLORS.wrong
    end
    return tile_color

end

-- Draw entire board. Uses sizes & word length in main
function draw_board()
    -- Define top-left corner to start the letters (Half block + 2 blocks)
    local tile_size = GAME.tile_size
    local step = tile_size + GAME.gap_size
    local start_x = 128/2-(tile_size/2)-(2*tile_size)-(2*GAME.gap_size)
    local start_y = 128/3-(tile_size/2)-(2*tile_size)-(2*GAME.gap_size)
    local row_y = start_y

    -- For every vertical row
    for row=1, GAME.num_tries do
        local column_x = start_x
        local user_word = GAME.guesses[row] or '' -- Get word in this round if exists
        local result = GAME.results[row]
        -- Create 5 tiles horizontally
        for column=1, GAME.word_length do
            local user_letter = user_word[column] or '' -- Get letter or leave empty
            local result_letter = sub(result, column, column)
            draw_tile(column_x, row_y, tile_size, tile_color(result_letter), user_letter)
            column_x += step
        end
        row_y += step
    end
end