
local Player = require 'lux.class' :new{}

local DIRS = {
  up = vec2:new{0,-1},
  down = vec2:new{0,1},
  left = vec2:new{-1,0},
  right = vec2:new{1,0}
}

Player:inherit(require 'Character')

function Player:instance (obj)

  self:super(obj, 3)

  function obj:update ()
    local sum = vec2:new{}
    self:setmoving(false)
    for key,dir in pairs(DIRS) do
      if love.keyboard.isDown(key) then
        sum = sum + dir
        self:setmoving(true)
      end
    end
    self:setangle(math.atan2(sum.y, sum.x))
  end

end

return Player

