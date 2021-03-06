-- This needs to define a world object of some kind, 
-- Preferrably it is a list of vectors, this is to be completed
-- The list of vectors would then be traversed to attach a collision type
-- for platforms/walls/slopes

-- 

-- World Object List

w = {

   lines = {
   -- A horizontal line
   {10.0, 5.0, 20.0, 5.0},
   -- A vertical line
   {10.0, 5.0, 10.0, 20.0}, 
   {10.0, 20.0, 20.0, 20.0},
   {20.0, 5.0, 20.0, 20.0},

   -- A sloped line
   {20.0, 20.0, 22.0, 22.0},
   -- continued...
   {22.0, 22.0, 30.0, 23.0},
   {30.0, 23.0, 35.0, 20.0},
   {35.0, 20.0, 50.0, 20.0},

   {50.000,   20.000,
    52.990,   20.040},
   {52.990,   20.040,
    55.405,   20.170},
   {55.405,   20.170,
    57.407,   20.407},
   {57.407,   20.407,
    59.163,   20.768},
   {59.163,   20.768,
    60.837,   21.269},
   {60.837,   21.269,
    62.593,   21.926},
   {62.593,   21.926,
    64.595,   22.756},
   {64.595,   22.756,
    67.010,   23.775},
   {67.010,   23.775,
    70.000,   25.000},


},

g = -100, -- gravity

   draw = function(s) 
	     for i,line in ipairs(s.lines) do
		love.graphics.line(draw_X(line[1]) ,draw_Y(line[2]),
				   draw_X(line[3]) ,draw_Y(line[4]))
	     end
	  end,
}

-- These filter the w.lines into the 3 primary collision types
-- THESE NEED TO ADD LOGIC FOR "NORMALIZING" THE ORDER OF THE
-- COORDINATES
function get_walls(lines)
   result = {}
   for i, w in ipairs(lines) do
      -- If the X of both points is the same
      if w[1] == w[3] then
	 table.insert(result, w)
      end
   end
   return result
end

function get_platforms(lines)
   result = {}
   for i, w in ipairs(lines) do
      -- If the Y of both points is the same
      if w[2] == w[4] then
	 table.insert(result, w)
      end
   end
   return result
end

function get_slopes(lines)
   result = {}
   for i, w in ipairs(lines) do
      -- If the X and Y of both points are different
      if (not (w[1] == w[3])) and (not (w[2] == w[4])) then
	 table.insert(result, w)
      end
   end
   return result
end

w.walls = get_walls(w.lines)
w.platforms = get_platforms(w.lines)
w.slopes = get_slopes(w.lines)