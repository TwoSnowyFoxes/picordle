-- Code for creating the letter boards

-- Create debug rects in the corners for clarity
function debug_rects()
    local size = 5
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


-- Draw entire board. Uses sizes & word length in main
function draw_board(
    rect_size,
    gap_size,
    num_letters,
    num_tries,
    guesses
    )
    -- Define top-left corner to start the letters (Half block + 2 blocks)
    local start_x = 128/2-(rect_size/2)-(2*rect_size)-(2*gap_size)
    local start_y = 128/3-(rect_size/2)-(2*rect_size)-(2*gap_size)
    local offset_y = 0

    -- For every vertical row
    for i=1, num_tries do
        local offset_x = 0
        word = guesses[i] or {} -- Get word in this round if exists
        -- Create 5 tiles horizontally
        for i=1, num_letters do
            letter = word[i] or '' -- Get letter or leave empty
            draw_tile(start_x + offset_x, start_y + offset_y, rect_size, 3, letter)
            offset_x += (rect_size + gap_size)
        end
        offset_y += (rect_size + gap_size)
    end
end