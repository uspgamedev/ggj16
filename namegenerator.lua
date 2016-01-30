generator = {}

local prefixes = {
  "Greater",
  "Flaming",
  "Shocking",
  "Petrifying",
  "Scrumptious",
  "Confusing",
  "Blistering",
  "Stupefying",
  "Supercalifragilisticexpialidocious",
  "Copyright Infringing",
  "Dancing",
  "Singing",
  "Thieving",
  "Lingering",
  "Malnourished",
  "Pro",
  "Broken",
  "Rapping",
  "Healing",
  "Monstrous",
  "Overly Complicated",
  "Rube Goldbergian",
  "Eldritch",
  "Cute",
  "Surprisingly Cheap",
  "Unexpected",
  "Totally Balanced Guys Trust Me",
  "Childish",
  "Kinda Slimy",
  "Your Mom's",
  "[REDACTED]",
  "Formerly Famous",
  "Used",
  "Boring",
  "Annoying",
  "Not Implemented Yet",
  "Pizza Making",
  "undefined",
  "Exploding",
  "Memetic",
  "Mistaken",
  "Narcissistic",
  "Nihilistic",
  "Condescending",
  "Fearmongering",
  "Elvish",
  "Orcish",
  "Dwarven",
  "Angelic",
  "Demonic",
  "h4xXx0r",
  "Shifty Looking",
  "Yodeling",
}

local suffixes = {
  "Stabbing",
  "Singing",
  "Dancing",
  "Destruction",
  "Annihilation",
  "Deliverance",
  "Surprises",
  "Segmentation Faults",
  "Hacking",
  "Slashing",
  "Discredited Rogues",
  "Former Child Stars",
  "Mid Bosses",
  "Last Bosses",
  "Nerfing",
  "Aimbotting",
  "Copyright Infringement",
  "Slaying",
  "Draining",
  "Cold",
  "Fire",
  "Ice",
  "Thunder",
  "Typos",
  "Bugs",
  "undefined",
  "[REDACTED]",
  "Sugar",
  "Faeries' Bane",
  "Steel",
  "Pong Paddles",
  "test string do not use",
  "Chocolate",
  "Explosions",
  "Pizza",
  "Memes",
  "Spoilers",
  "Angels",
  "Demons",
  "Elves",
  "Orcs",
  "Dwarfs",
  "Yodeling",
  "Cakes",
}

local EXTRA_EFFECT = {
  'sparkle', 'flame', 'shock'
}

function generator.generate(weaponname, blinglevel)
  local iterations = 1
  -- local numpref = 0
  local numsuf = 0
  local blingleft = blinglevel/4
  while blingleft >= 1 do
    iterations = iterations + 1
    blingleft = blingleft/4
  end
  local name = weaponname
  -- print (weaponname)
  -- local name = prefixes[love.math.random(#prefixes)].." "..weaponname.." Of "..suffixes[love.math.random(#suffixes)]
  -- print(name)
  if iterations > 1 then
    for i = 1,iterations do
      if love.math.random() > 0.5 then
        --prefix
        name = prefixes[love.math.random(#prefixes)].." "..name
      elseif numsuf == 0 then
        name = name.." Of "..suffixes[love.math.random(#suffixes)]
        numsuf = 1
      else 
        name = name.." And "..suffixes[love.math.random(#suffixes)]
      end
      -- name = prefixes[love.math.random(#prefixes)].." "..name.." And "..suffixes[love.math.random(#suffixes)]
    end
  end
  return name, EXTRA_EFFECT[love.math.random(#EXTRA_EFFECT)]

end

return generator
