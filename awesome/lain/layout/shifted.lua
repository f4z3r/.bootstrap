---------------------------------------------------------------------------
--- Shifted layout
--
-- @author Jakob Beckmann
---------------------------------------------------------------------------

-- Grab environment we need
local ipairs = ipairs
local math = math

local shifted = {}

local function do_shifted(p)
  local wa = p.workarea
  local cls = p.clients

  if #cls > 0 then
    local rows, cols
    local shift = false
    if #cls == 2 then
      rows, cols = 1, 2
      shift = true
    else
      rows = math.ceil(math.sqrt(#cls))
      cols = math.ceil(#cls / rows)
    end

    for k, c in ipairs(cls) do
      k = k - 1
      local g = {}

      local row, col
      row = k % rows
      col = math.floor(k / rows)

      local lrows, lcols
      if k >= rows * cols - rows then
        lrows = #cls - (rows * cols - rows)
        lcols = cols
      else
        lrows = rows
        lcols = cols
      end

      if row == lrows - 1 then
        g.height = wa.height - math.ceil(wa.height / lrows) * row
        g.y = wa.height - g.height
      else
        g.height = math.ceil(wa.height / lrows)
        g.y = g.height * row
      end

      if col == lcols - 1 then
        g.width = wa.width - math.ceil(wa.width / lcols) * col
        g.x = wa.width - g.width
      else
        g.width = math.ceil(wa.width / lcols)
        g.x = g.width * col
      end
      if shift then
        if col ==  1 then
          g.width = wa.width - math.ceil(wa.width / 3 * 2)
          g.x = wa.width - g.width
        else
          g.width = math.ceil(wa.width / 3 * 2)
          g.x = 0
        end
      end

      g.y = g.y + wa.y
      g.x = g.x + wa.x

      p.geometries[c] = g
    end
  end
end


-- Vertical shifted layout.
-- @param screen The screen to arrange.
shifted.name = "shiftedv"
function shifted.arrange(p)
  return do_shifted(p)
end

return shifted


