-- hat
-- Variables --
local r = 0
local deb = game:GetService("Debris")
local speed = 1
local hatfuncs = {}
local world = Instance.new("WorldModel",script)
local far = 5
local am = 0
local amd = 1000
local rs = game:GetService("RunService")
-- Script --
function hatfuncs:get()
for i,v in pairs(owner.Character.Humanoid:GetAccessories()) do
	if v:FindFirstChild("Handle") then
		am += 1
	end
end
return 360/am
end
local angle = hatfuncs:get()
function hatfuncs:start()
for i,v in pairs(owner.Character.Humanoid:GetAccessories()) do
	if v:FindFirstChild("Handle") then
		task.spawn(function()
			local s,f = pcall(function()
				while rs.Stepped:Wait() do
					local s,f = pcall(function()
						v.Parent = world
						local h = v.Handle
						x = math.sin(math.rad(r + (angle * i)))
						z = math.cos(math.rad(r + (angle * i)))
						h.CFrame = CFrame.lookAt(owner.Character.Head.Position + (Vector3.new(x,0,z) * far),owner.Character.Head.Position)
					end)
				end
			end)
		end)
	end
end
end
function hatfuncs:clear()
for i,v in pairs(world:GetChildren()) do
deb:AddItem(v,0)
end
end
hatfuncs:start()
owner.CharacterAdded:Connect(function()
hatfuncs:clear()
task.wait()
hatfuncs:start()
end)
owner.Chatted:Connect(function(msg)
if string.sub(msg,0,#"-speed ") == "-speed " then
speed = tonumber(string.sub(msg,#"-speed  ",#msg))
elseif string.sub(msg,0,#"/e -speed ") == "/e -speed " then
speed = tonumber(string.sub(msg,#"/e -speed  ",#msg))
elseif string.sub(msg,0,#"-dist ") == "-dist " then
far = tonumber(string.sub(msg,#"-dist  ",#msg))
elseif string.sub(msg,0,#"/e -dist ") == "/e -dist " then
far = tonumber(string.sub(msg,#"/e -dist  ",#msg))
end
end)
while rs.Stepped:Wait() do
	local s,f = pcall(function()
		r += 1 * speed
	end)
end
--[[local clones = 10
for angle = 0,360,360/clones do
	local chair = hair:Clone()
	chair.Parent = world
	local x = math.sin(math.rad(angle + i))
	local z = math.cos(math.rad(angle + i))
	chair.Position = pos + Vector3.new(x,0,z)
end]]