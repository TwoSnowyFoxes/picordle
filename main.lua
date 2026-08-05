----------------
-- Main variables
----------------
local word_length = 5
local num_tries = 5
-- Tile placement
local default_tile_size = 10
local default_gap_size = 2


-- Main to save rounds to
local rounds = {}
-- Add testround
rounds[1] = {'T', 'A', 'B', 'L', 'E'}


----------------
-- Callback functions
----------------
function _init()

end


function _update()

end


function _draw()
    debug_rects() -- Debugging
    -- draw_tile(32, 32, 10, 3, 'H')
    draw_board(
        default_tile_size,
        default_gap_size,
        word_length,
        num_tries,
        rounds)
end

