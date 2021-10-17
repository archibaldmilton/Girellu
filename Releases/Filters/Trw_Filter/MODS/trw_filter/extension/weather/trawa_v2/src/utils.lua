--------
-- Common helper functions and entities, pretty much generic.
--------

-- Generates random direction in 2D space
function math.randomVec2()
  return (vec2(math.random(), math.random()) - 0.5):normalize()
end

-- Generates random direction in 3D space
function math.randomVec3()
  return (vec3(math.random(), math.random(), math.random()) - 0.5):normalize()
end

-- GC-friendly calculating of horizontal length (instead of creating 2D-vector and measuring it)
function math.horizontalLength(v0)
  return math.sqrt(v0.x * v0.x + v0.z * v0.z)
end

-- GC-friendly calculating of horizontal distance (instead of creating 2D-vector and measuring it)
function math.horizontalDistance(v0, v1)
  local x = v0.x - v1.x
  local y = v0.z - v1.z
  return math.sqrt(x * x + y * y)
end

-- GC-friendly calculating of squared distance
function math.squaredDistance(v0, v1)
  local x = v0.x - v1.x
  local y = v0.y - v1.y
  local z = v0.z - v1.z
  return x * x + y * y + z * z
end

-- Wrapper for an updating function, calls it once and then skips a few frames
RareUpdate = {}
function RareUpdate:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  o.dt = 0
  o.phase = o.phase or 0  
  o.delay = o.phase
  o.skip = o.skip or 2
  return o
end
function RareUpdate:update(dt, forceUpdate)
  if forceUpdate then 
    self.callback(dt)
    self.dt = 0
  end
  if self.delay > 0 then
    self.delay = self.delay - 1
    self.dt = self.dt + dt
  else
    self.delay = self.skip
    if not forceUpdate then self.callback(self.dt + dt) end
    self.dt = 0
  end
end

-- A thing for low frequency spatial noise
LowFrequency2DNoise = {}
function LowFrequency2DNoise:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  o.seedX = math.random()
  o.seedY = math.random()
  o.frequency = o.frequency or 1
  return o
end
function LowFrequency2DNoise:get(inputPosition)
  return math.sin(self.seedX + inputPosition.x * self.frequency * 13 / 17) 
    * math.sin(self.seedY + inputPosition.z * self.frequency)
    * 0.5 + 0.5
end

-- This function runs garbage collector (GC) and measures how much memory was cleaned,
-- value is smoothed out. Call it only for debugging, as it is slow (if you’re not 
-- calling it, LuaJIT will collect garbage automatically when necessary). And please 
-- try and keep amount of garbage low.
local gcSmooth = 0
local gcRuns = 0
function runGC()
  local before = collectgarbage('count')
  collectgarbage()
  gcSmooth = math.applyLag(gcSmooth, before - collectgarbage('count'), gcRuns < 50 and 0.9 or 0.995, 0.01)
  gcRuns = gcRuns + 1
  ac.debug('GC', math.floor(gcSmooth * 100) / 100 .. " KB")
end

-- Properly randomize random generator
math.randomseed(os.time())

-- Uncomment this line for debugging to get the same random values
-- math.randomseed(0)
