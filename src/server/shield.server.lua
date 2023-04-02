-- shield
local cf = true
local oldcf = cf
local d = game:GetService("Debris")
local ru = game:GetService("RunService")
local world = Instance.new("WorldModel",script)
local shi = Instance.new("SpawnLocation")
local shisiz = 25
local sm = 1
local sr = true
local rem = Instance.new("RemoteEvent",owner)
local hs = game:GetService("HttpService")
local t = {}
local wl = {owner}
-- Properties --
rem.Name = "GSM"
script.Name = string.char(math.random(128,255))
world.Name = string.char(math.random(128,255))
shi.CanCollide = false
shi.Anchored = true
shi.Material = "ForceField"
shi.Name = string.char(math.random(128,255))
shi.Enabled = false
shi.Locked = true
shi.Color = Color3.fromRGB(0,255,0)
shi.Transparency = .35
shi.CastShadow = false
shi.Size = Vector3.new(shisiz,shisiz,shisiz)
shi.Shape = "Ball"
-- Script --
local function getplr(name)
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if string.lower(string.sub(v.Name,0,#name)) == name then
return v
end
end
end
local function nograv(p)
if p.Anchored ~= true and p:FindFirstChild("NogravityForce") == nil then
local vf = Instance.new("VectorForce",p)
local at = Instance.new("Attachment",p)
vf.Name = "NogravityForce"
vf.Attachment0 = at
vf.RelativeTo = Enum.ActuatorRelativeTo.World
vf.ApplyAtCenterOfMass = true
vf.Force = Vector3.new(0,workspace.Gravity * p:GetMass() + p:GetMass(),0)
d:AddItem(vf,3)
d:AddItem(at,3)
if p:FindFirstAncestorOfClass("Model") and p:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid") then
task.spawn(function()
while p:FindFirstChild("NogravityForce") do
if p:FindFirstAncestorOfClass("Model") then
local hum = p:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid")
if hum.Sit ~= true then
hum.PlatformStand = true
end
end
task.wait()
end
if p:FindFirstAncestorOfClass("Model") then
p:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid").PlatformStand = false
end
end)
end
end
end
local function repel(p)
if p.Anchored ~= true and p:FindFirstChild("NogravityForce") == nil then
local vf = Instance.new("VectorForce",p)
local at = Instance.new("Attachment",p)
vf.Name = "NogravityForce"
vf.Attachment0 = at
vf.RelativeTo = Enum.ActuatorRelativeTo.World
vf.ApplyAtCenterOfMass = true
vf.Force = -p.Velocity
d:AddItem(vf,3)
d:AddItem(at,3)
if p:FindFirstAncestorOfClass("Model") and p:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid") then
task.spawn(function()
while p:FindFirstChild("NogravityForce") do
if p:FindFirstAncestorOfClass("Model") then
p:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid").PlatformStand = true
end
task.wait()
end
if p:FindFirstAncestorOfClass("Model") then
p:FindFirstAncestorOfClass("Model"):FindFirstChildOfClass("Humanoid").PlatformStand = false
end
end)
end
end
end
local function decomp(v)
if v:FindFirstAncestorOfClass("Workspace") then
if v:FindFirstAncestorOfClass("Model") then
local nam = v:FindFirstAncestorOfClass("Model").Name
if v:FindFirstAncestorOfClass("Model") == owner.Character then
else
if v.Name == shi.Name then
else
if v.Name == "Base" then
else
local s, f = pcall(function()
p = v:SubtractAsync(t,PreciseConvexDecomposition)
end)
if p then
p.Parent = v.Parent
p.Name = v.Name
d:AddItem(v,0)
end
if f then
d:AddItem(v,0)
end
end
end
end
else
if v.Name == shi.Name then
else
if v.Name == "Base" then
else
local s, f = pcall(function()
p = v:SubtractAsync(t,PreciseConvexDecomposition)
end)
if p then
p.Parent = v.Parent
p.Name = v.Name
d:AddItem(v,0)
end
if f then
d:AddItem(v,0)
end
end
end
end
end
end
local s,f = pcall(function()
workspace:BulkMoveTo({shi},{owner.Character.HumanoidRootPart.CFrame + owner.Character.HumanoidRootPart.Velocity * owner:GetNetworkPing()})
end)
shi.Parent = world
owner.Chatted:Connect(function(msg)
if string.lower(msg) == "-anchor" or string.lower(msg) == "/e -anchor" then
cf = false
elseif string.lower(msg) == "-follow" or string.lower(msg) == "/e -follow" then
cf = true
elseif string.lower(msg) == "sr/true" or string.lower(msg) == "sr/true" then
sr = true
elseif string.lower(msg) == "sr/false" or string.lower(msg) == "sr/false" then
sr = false
elseif string.sub(msg,0,5):find("size/") then
shisiz = string.sub(msg,6,#msg)
elseif string.sub(msg,0,8):find("/e size/") then
shisiz = string.sub(msg,9,#msg)
elseif string.sub(msg,0,4) == "-wl " then
local plr = getplr(string.sub(msg,5,#msg))
if plr ~= owner then
if table.find(wl,plr) == nil then
print("Whitelisted: "..plr.Name)
table.insert(wl,plr)
else
print("Player "..plr.Name.." is already whitelisted.")
end
else
warn("You are unauthorized to change creator permissions.")
end
elseif string.sub(msg,0,7) == "/e -wl " then
local plr = getplr(string.sub(msg,8,#msg))
if plr ~= owner then
if table.find(wl,plr) == nil then
print("Whitelisted: "..plr.Name)
table.insert(wl,plr)
else
warn("Player "..plr.Name.." is already whitelisted.")
end
else
warn("You are unauthorized to change creator permissions.")
end
elseif string.sub(msg,0,4) == "-bl " then
local plr = getplr(string.sub(msg,5,#msg))
if plr ~= owner then
if table.find(wl,plr) ~= nil then
print("Blacklisted: "..plr.Name)
table.remove(wl,table.find(wl,plr))
else
print("Player "..plr.Name.." is already blacklisted.")
end
else
warn("You are unauthorized to change creator permissions.")
end
elseif string.sub(msg,0,7) == "/e -bl " then
local plr = getplr(string.sub(msg,8,#msg))
if plr ~= owner then
if table.find(wl,plr) ~= nil then
print("Blacklisted: "..plr.Name)
table.remove(wl,table.find(wl,plr))
else
print("Player "..plr.Name.." is already blacklisted.")
end
else
warn("You are unauthorized to change creator permissions.")
end
elseif string.lower(msg) == "wl/show" or string.lower(msg) == "/e wl/show" then
print("Whitelist:")
for i,v in pairs(wl) do
print(tostring(i).." - "..v.Name)
end
end
end)
task.spawn(function()
ru.Stepped:Connect(function(delt)
local olp = shi.CFrame
d:AddItem(shi,0)
d:AddItem(world,0)
script.Name = string.char(math.random(128,255))
world = Instance.new("WorldModel",script)
world.Name = string.char(math.random(128,255))
shi = Instance.new("SpawnLocation",world)
shi.Shape = "Ball"
shi.Name = string.char(128)
shi.CanCollide = false
shi.Anchored = true
shi.Material = "ForceField"
shi.Name = string.char(math.random(128,255))
shi.Enabled = false
shi.Locked = true
if sm == 1 then
shi.Color = Color3.fromRGB(0,255,0)
elseif sm == 2 then
shi.BrickColor = BrickColor.new("Really red")
elseif sm == 3 then
shi.BrickColor = BrickColor.new("Toothpaste")
elseif sm == 4 then
shi.Color = Color3.new(1,.690196,0)
end
shi.Transparency = .35
shi.CastShadow = false
shi.Size = Vector3.new(shisiz,shisiz,shisiz)
if cf then
local s,f = pcall(function()
workspace:BulkMoveTo({shi},{owner.Character.HumanoidRootPart.CFrame + owner.Character.HumanoidRootPart.Velocity * owner:GetNetworkPing()})
end)
if f then
workspace:BulkMoveTo({shi},{olp})
end
else
workspace:BulkMoveTo({shi},{olp})
end
local s,f = pcall(function()
pos = owner.Character.HumanoidRootPart.Velocity * owner:GetNetworkPing()
end)
if sm == 2 then
for i, v in pairs(workspace:GetPartBoundsInRadius(owner.Character.HumanoidRootPart.Position,shi.Size.Y,OverlapParams.new({owner.Character,workspace:FindFirstChild("Base"),shi},Enum.RaycastFilterType.Blacklist))) do
if v ~= workspace:FindFirstChild("Base") then
if v:FindFirstAncestorOfClass("Model") then
if game:GetService("Players"):GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model")) then
player = game:GetService("Players"):GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model"))
end
if player then
if v:FindFirstAncestorOfClass("Model") and table.find(wl,player) == nil then
d:AddItem(v,0)
elseif v:FindFirstAncestorOfClass("Model") == nil then
d:AddItem(v,0)
end
else
d:AddItem(v,0)
end
else
d:AddItem(v,0)
end
end
end
elseif sm == 3 then
for i, v in pairs(workspace:GetPartBoundsInRadius(owner.Character.HumanoidRootPart.Position,shi.Size.Y,OverlapParams.new({owner.Character,workspace:FindFirstChild("Base"),shi},Enum.RaycastFilterType.Blacklist))) do
if v ~= workspace:FindFirstChild("Base") then
if v:FindFirstAncestorOfClass("Model") then
if game:GetService("Players"):GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model")) then
player = game:GetService("Players"):GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model"))
end
if player then
if v:FindFirstAncestorOfClass("Model") and table.find(wl,player) == nil then
nograv(v)
elseif v:FindFirstAncestorOfClass("Model") == nil then
nograv(v)
end
else
nograv(v)
end
else
nograv(v)
end
end
end
elseif sm == 4 then
for i, v in pairs(workspace:GetPartBoundsInRadius(owner.Character.HumanoidRootPart.Position,shi.Size.Y,OverlapParams.new({owner.Character,workspace:FindFirstChild("Base"),shi},Enum.RaycastFilterType.Blacklist))) do
if v ~= workspace:FindFirstChild("Base") then
if v:FindFirstAncestorOfClass("Model") then
if game:GetService("Players"):GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model")) then
player = game:GetService("Players"):GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model"))
end
if player then
if v:FindFirstAncestorOfClass("Model") and table.find(wl,player) == nil then
repel(v)
elseif v:FindFirstAncestorOfClass("Model") == nil then
repel(v)
end
else
repel(v)
end
else
repel(v)
end
end
end
if owner.Character then
for i,v in pairs(owner.Character:GetDescendants()) do
if v:IsA("BasePart") then
v.CanTouch = false
v.Locked = true
v.CanQuery = false
end
end
end
end
end)
while task.wait() do
table.clear(t)
table.insert(t,shi)
for i, v in pairs(workspace:GetPartBoundsInRadius(owner.Character.HumanoidRootPart.Position,shi.Size.Y,OverlapParams.new({owner.Character,workspace:FindFirstChild("Base"),shi},Enum.RaycastFilterType.Blacklist))) do
if v.Name ~= "Base" then
local s, f = pcall(function()
if sm == 1 then
decomp(v)
end
end)
if f then
if not f:find("current parent: NULL") then
--warn("Oops! It seems like I've ran into a problem, heres the summary of what happened: "..f)
end
end
end
for i, v in pairs(workspace:GetDescendants()) do
if v:IsA("WorldModel") then
for i, vp in pairs(workspace:GetPartBoundsInRadius(owner.Character.HumanoidRootPart.Position,shi.Size.Y,OverlapParams.new({owner.Character,workspace:FindFirstChild("Base"),shi},Enum.RaycastFilterType.Blacklist))) do
local s, f = pcall(function()
if sm == 1 and vp ~= shi then
decomp(vp)
elseif sm == 2 then
if vp:FindFirstAncestorOfClass("Workspace") and vp:FindFirstAncestorOfClass("Model") ~= owner.Character and vp ~= shi and vp ~= workspace:FindFirstChild("Base") then
if vp:FindFirstAncestorOfClass("Model") then
if game:GetService("Players"):GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model")) then
player = game:GetService("Players"):GetPlayerFromCharacter(vp:FindFirstAncestorOfClass("Model"))
end
if player then
if vp:FindFirstAncestorOfClass("Model") and table.find(wl,player) == nil then
d:AddItem(vp,0)
elseif vp:FindFirstAncestorOfClass("Model") == nil then
d:AddItem(vp,0)
end
end
else
d:AddItem(vp,0)
end
end
elseif sm == 3 then
if vp:FindFirstAncestorOfClass("Workspace") and vp:FindFirstAncestorOfClass("Model") ~= owner.Character and vp ~= workspace:FindFirstChild("Base") and vp ~= shi then
if vp:FindFirstAncestorOfClass("Model") then
if game:GetService("Players"):GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model")) then
player = game:GetService("Players"):GetPlayerFromCharacter(vp:FindFirstAncestorOfClass("Model"))
end
if player then
if vp:FindFirstAncestorOfClass("Model") and table.find(wl,player) == nil then
nograv(vp)
elseif vp:FindFirstAncestorOfClass("Model") == nil then
nograv(vp)
end
else
nograv(vp)
end
else
nograv(vp)
end
end
elseif sm == 4 then
if vp:FindFirstAncestorOfClass("Workspace") and vp:FindFirstAncestorOfClass("Model") ~= owner.Character and vp ~= workspace:FindFirstChild("Base") and vp ~= shi and vp.Name ~= "Base" then
if vp:FindFirstAncestorOfClass("Model") then
if game:GetService("Players"):GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model")) then
player = game:GetService("Players"):GetPlayerFromCharacter(vp:FindFirstAncestorOfClass("Model"))
end
if player then
if vp:FindFirstAncestorOfClass("Model") and table.find(wl,player) == nil then
repel(vp)
elseif vp:FindFirstAncestorOfClass("Model") == nil then
repel(vp)
end
else
repel(vp)
end
else
repel(vp)
end
end
end
end)
if f then
if not f:find("current parent: NULL") then
--warn("Oops! It seems like I've ran into a problem, heres the summary of what happened: "..f)
end
end
end
end
end
end
end
end)
owner.CharacterAdded:Connect(function(char)
if sr then
task.wait()
char.HumanoidRootPart.CFrame = shi.CFrame
print("Respawned")
task.wait()
cf = oldcf
else
print("Respawned")
end
end)
owner.CharacterRemoving:Connect(function()
if sr and cf then
oldcf = cf
cf = false
end
end)
NLS([==[local r = owner.GSM
local uis = game:GetService("UserInputService")
local mode = 1
uis.InputBegan:Connect(function(inp,c)
if inp.KeyCode == Enum.KeyCode.Q and not c then
mode = mode - 1
r:FireServer(math.clamp(mode,1,4),owner)
elseif inp.KeyCode == Enum.KeyCode.E and not c then
mode = mode + 1
r:FireServer(math.clamp(mode,1,4),owner)
end
end)]==],owner.PlayerGui)
rem.OnServerEvent:Connect(function(player,mode)
sm = mode
end)
print("Loaded.")
warn("Made by BRY402.")
-- UP TO DATE.