script:Destroy()
script.Enabled = false
local function getfraw(value)
	local _, args = coroutine.resume(task.defer(function()
		return {value}
	end))
	return args[1]
end
local ls = loadstring
local function loadstring(code)
	local event = getfraw(Instance.new("BindableEvent"))
	event.Event:Once(function()
		event:Destroy()
		local oldInstanceNew = Instance.new
		local Instances = {}
		local env = getfenv()
		local custom_env = {
			game = getfraw(game),
			script = getfraw(script),
			owner = getfraw(owner),
			workspace = getfraw(workspace),
			Instance = {new = function(Class, Parent)
				if not Instances[Class] then
					local newInstance = getfraw(Instance.new(Class))
					newInstance.Archivable = true
					Instances[Class] = newInstance
				end
				local foundInstance = Instances[Class]
				foundInstance.Archivable = true
				local foundInstanceClone = foundInstance:Clone()
				foundInstanceClone.Parent = Parent
				return foundInstanceClone
			end},
			math = getfraw(math),
			os = getfraw(os),
			tick = getfraw(tick)
		}
		custom_env.Workspace = custom_env.workspace
		custom_env.wait = function(timeout)
			local RunService = game:GetService("RunService")
			local storage = {
				delta = RunService.Heartbeat:Wait(),
				returned_delta = 0,
				num = 0
			}
			local timeout = timeout or storage.delta
			for i = 0, timeout, storage.delta do
				storage.num = storage.num + 1
				storage.delta = RunService.Heartbeat:Wait()
				storage.returned_delta = storage.delta * storage.num
			end
			return storage.returned_delta
		end
		local func, fail = ls(code, "Core")
		if fail then
			error(fail)
		else
			setfenv(func, setmetatable({},{
				__index = function(_, index)
					return custom_env[index] or env[index]
				end,
				__newindex = function(_, index, value)
					custom_env[index] = value
				end
			}))()
		end
	end)
	event:Fire()
end
loadstring([==[
local killed = false
local Connection
local Part = Instance.new("Part")
Part.Anchored = true
Part.Archivable = true
Part.Size = Vector3.new(6, 7.5, 1)
Part.Position = Vector3.new(0, 4, 75)
Part.Name = "SB_Real"
local Properties = {
	Anchored = Part.Anchored,
	Size = Part.Size,
	Position = Part.Position,
	Name = Part.Name,
	Transparency = Part.Transparency,
	CanCollide = Part.CanCollide
}
local function protect(Property)
	if Connection then
		Connection:Disconnect()
	end
	Part:Destroy()
	Part.Archivable = true
	Part = Part:Clone()
	Part[Property] = Properties[Property]
	Part.Parent = workspace
	Connection = Part.Changed:Connect(protect)
end
Part.Parent = workspace
Connection = Part.Changed:Connect(protect)
while wait(.1) do
	Part:Destroy()
end
]==])