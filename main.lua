-- Main variables
local word_length = 5
local num_tries = 5

-- Tile placement
local default_tile_size = 10
local default_gap_size = 2

function _init()

end

function _draw()
    debug_rects() -- Debugging
    -- draw_tile(32, 32, 10, 3, 'H')
    draw_board(default_tile_size, default_gap_size, word_length, num_tries)
end


-- Draw a tile. No states held here.
function draw_tile(x, y, size, col, letter)
    rectfill(x, y, x + size, y + size, col)
    print(letter, (x + (size/3)), (y + (size/3)), 0)
    print()

end


function debug_rects()
    local size = 5
    rectfill(0, 0, size, size, 3)
    rectfill(127 - size, 0, 127, size, 3)
    rectfill(0, 127 - size, size, 127, 3)
    rectfill(127 - size, 127 - size, 127, 127, 3)
end


-- Moet wss een list of iets aan letters krijgen
function draw_board(rect_size, gap_size, num_letters, num_tries)
    -- Define middle, then branch out from there
    local offset_x = 0
    -- Half block + 2 blocks
    local left_x = 128/2-(rect_size/2)-(2*rect_size)-(2*gap_size)
    -- Half block
    local left_y = 128/2-(rect_size/2)

    -- Create 5 tiles
    for i=1, num_letters do
        draw_tile(left_x + offset_x, left_y, rect_size, 3, 'T')
        offset_x += (rect_size + gap_size)
    end
end


