
local player = require 'player'

local dungeon = {}

local W, H = 16, 10

local map

-- local rooms = require "rooms"

local roomexits = {'E','S','W','N','N','E'}
local roomentries = {'W','W','N','E','E','S'}
local roomnumber = 1

function dungeon.load ()
  map = {}
  for i=1,H do
    map[i] = {}
    for j=1,W do
      if (roomexits[roomnumber] == 'E' and ((i == H/2 or i == H/2+1) and j == W)) or
         (roomexits[roomnumber] == 'W' and ((i == H/2 or i == H/2+1) and j == 1)) or
         (roomexits[roomnumber] == 'S' and ((j == W/2 or j == W/2+1) and i == H)) or
         (roomexits[roomnumber] == 'N' and ((j == W/2 or j == W/2+1) and i == 1)) then
        map[i][j] = 'FLOOR'
      elseif (roomentries[roomnumber] == 'E' and ((i == H/2 or i == H/2+1) and j == W)) or
             (roomentries[roomnumber] == 'W' and ((i == H/2 or i == H/2+1) and j == 1)) or
             (roomentries[roomnumber] == 'S' and ((j == W/2 or j == W/2+1) and i == H)) or
             (roomentries[roomnumber] == 'N' and ((j == W/2 or j == W/2+1) and i == 1)) then
        map[i][j] = 'DOOR'
      elseif
       --love.math.random() > .9 or
       i == 1 or j == 1 or i == H or j == W then
        map[i][j] = 'WALL'
      else
        map[i][j] = 'FLOOR'
      end
    end
  end
  player.clear()
  player.setpos(vec2:new{2,2})
end

function dungeon.update (dt)
  player.update(dt)
end

-- Converts HSL to RGB. (input and output range: 0 - 255)
local function HSL(h, s, l, a)
  if s<=0 then return l,l,l,a end
  h, s, l = h/256*6, s/255, l/255
  local c = (1-math.abs(2*l-1))*s
  local x = (1-math.abs(h%2-1))*c
  local m,r,g,b = (l-.5*c), 0,0,0
  if h < 1     then r,g,b = c,x,0
  elseif h < 2 then r,g,b = x,c,0
  elseif h < 3 then r,g,b = 0,c,x
  elseif h < 4 then r,g,b = 0,x,c
  elseif h < 5 then r,g,b = x,0,c
  else              r,g,b = c,0,x
  end return (r+m)*255,(g+m)*255,(b+m)*255,a
end

local function COLOR (ds, dl)
  ds = ds or 0
  dl = dl or 0
  return HSL(150, 30+ds, 30+dl, 255)
end

function dungeon.draw ()
  local g = love.graphics
  g.push()
  g.scale(64, 64)
  g.translate(-1, 1)
  for i,row in ipairs(map) do
    for j,tile in ipairs(row) do
      g.push()
      g.setColor(255, 255, 255)
      g.translate(j, i)
      if tile == 'WALL' then
        g.setColor(COLOR(80, -10))
        g.rectangle('fill', 0, -.75, 1, 1)
        g.setColor(COLOR(80, -5))
        g.rectangle('fill', 0, .25, 1, 1)
      elseif tile == 'DOOR' then
        g.setColor(20, 90, 40)
        g.rectangle('fill', 0, -.5, 1, 1)
        g.setColor(0, 60, 20)
        g.rectangle('fill', 0, .5, 1, 1)
      elseif tile == 'FLOOR' then
        g.setColor(COLOR())
        g.rectangle('fill', 0, 0, 1, 1)
      end
      g.pop()
    end
  end
  do -- draw player
    g.push()
    g.translate(player.getpos():unpack())
    g.setColor(150, 100, 80)
    g.circle('fill', .5, .5, .4, 16)
    g.pop()
  end
  g.pop()
end

return dungeon

