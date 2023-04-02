local stuff = Instance.new("Folder",owner.PlayerGui)
local nameid = 0
local d = game:GetService("Debris")
function check(link)
if string.sub(link.Parent.Part2.Value.Parent.Name,0,5) == "Gate1" then
return 1
elseif string.sub(link.Parent.Part2.Value.Parent.Name,0,5) == "Gate2" then
return 2
else
return 0
end
end
local function getconnected(part,gate)
if gate == 0 then
if p.BrickColor == BrickColor.new("Lime green") then
p.BrickColor = BrickColor.new("Really red")
if inp ~= nil then
link.Color = Color3.new(0,0,0)
inp.Value = false
end
elseif p.BrickColor == BrickColor.new("Really red") then
p.BrickColor = BrickColor.new("Lime green")
if inp ~= nil then
link.BrickColor = BrickColor.new("New Yeller")
inp.Value = true
end
end
elseif gate > 0 then
for i,v in pairs(script:GetChildren()) do
if string.sub(v.Name,0,5) == "Cable" then
--[[print(v)
print(v.Part1.Value)
print(v.Link,v.Part2.Value)]]
if v.Part1.Value == part then
return v.Link,v.Part2.Value
end
end
end
else
for i,v in pairs(script:GetChildren()) do
if string.sub(v.Name,0,5) == "Cable" then
--[[print(v)
print(v.Part1.Value)
print(v.Link,v.Part2.Value)]]
if v.Part1.Value == part then
return v.Link,v.Part2.Value.Parent.GE1,v.Part2.Value.Parent.GE2
end
end
end
end
end
local function no(parent,mainpos,isoutput,gate)
if isoutput then
local output = Instance.new("Part",parent)
output.Anchored = true
output.Name = "Output"
output.CanCollide = false
output.Size = Vector3.new(.75,.75,0)
output.Position = Vector3.new(mainpos.X,mainpos.Y,mainpos.Z + 1)
output.Color = Color3.new(0,0,0)
output.Material = "SmoothPlastic"
--return output
else
if gate == false then
local input = Instance.new("Part",parent)
input.Anchored = true
input.Name = "Input"
input.CanCollide = false
input.Size = Vector3.new(.75,.75,0)
input.Position = Vector3.new(mainpos.X,mainpos.Y,mainpos.Z + 1)
input.BrickColor = BrickColor.new("Eggplant")
input.Material = "SmoothPlastic"
--return input
else
local input = Instance.new("Part",parent)
local input2 = Instance.new("Part",parent)
local output = Instance.new("Part",parent)
input.Anchored = true
input.Name = "Input"
input.CanCollide = false
input.Size = Vector3.new(.4,.4,0)
input.Position = Vector3.new(mainpos.X + .3,mainpos.Y,mainpos.Z + 1)
input.BrickColor = BrickColor.new("Eggplant")
input.Material = "SmoothPlastic"
input2.Anchored = true
input2.Name = "Input2"
input2.CanCollide = false
input2.Size = Vector3.new(.4,.4,0)
input2.Position = Vector3.new(-(mainpos.X + .3),mainpos.Y,mainpos.Z + 1)
input2.BrickColor = BrickColor.new("Eggplant")
input2.Material = "SmoothPlastic"
output.Anchored = true
output.Name = "Output"
output.CanCollide = false
output.Size = Vector3.new(.75,.75,0)
output.Position = Vector3.new(0,0,-1)
output.Color = Color3.new(0,0,0)
output.Material = "SmoothPlastic"
--return input,input2,output
end
end
end
script.Name = "mb"
stuff.Name = "FFBS"
local r = Instance.new("RemoteEvent",stuff)
r.Name = "BuildEvent"
NLS([==[local m = owner:GetMouse()
local sc = workspace.mb
local r = owner.PlayerGui.FFBS.BuildEvent
local uis = game:GetService("UserInputService")
local d = game:GetService("Debris")
local ignore = Instance.new("Model",script)
ignore.Name = "Display"
local p = Instance.new("Part",ignore)
local output = Instance.new("Part",ignore)
local inplace = {}
local grid = 2
local gridy = 1
local dm = false
local canplace = true
local linked1 = false
local linked2 = false
local angle = 0
local mode = 0
local classid = 1
m.TargetFilter = ignore
for i,v in pairs(ignore:GetDescendants()) do
if v:IsA("BasePart") then
v.Transparency = .5
end
end
p.Anchored = true
p.Name = "Main"
p.CanCollide = false
p.Material = "SmoothPlastic"
p.Size = Vector3.new(grid,gridy,grid)
output.Anchored = true
output.Name = "Output"
output.CanCollide = false
output.Size = Vector3.new(.75,.75,0)
output.Position = Vector3.new(0,0,1)
output.Color = Color3.new(0,0,0)
output.Material = "SmoothPlastic"
script.Parent = workspace
local function clear(id)
linked1 = false
linked2 = false
for i,v in pairs(ignore:GetChildren()) do
d:AddItem(v,0)
end
ignore:PivotTo(CFrame.new())
if id == 1 then
local p = Instance.new("Part",ignore)
local output = Instance.new("Part",ignore)
p.Anchored = true
p.Name = "Main"
p.CanCollide = false
p.Material = "SmoothPlastic"
p.Size = Vector3.new(grid,gridy,grid)
output.Anchored = true
output.Name = "Output"
output.CanCollide = false
output.Size = Vector3.new(.75,.75,0)
output.Position = Vector3.new(0,0,1)
output.Color = Color3.new(0,0,0)
output.Material = "SmoothPlastic"
elseif id == 2 then
local p = Instance.new("Part",ignore)
local input = Instance.new("Part",ignore)
p.Anchored = true
p.Name = "Main"
p.CanCollide = false
p.Material = "SmoothPlastic"
p.Size = Vector3.new(grid,gridy,grid)
input.Anchored = true
input.Name = "Input"
input.CanCollide = false
input.Size = Vector3.new(.75,.75,0)
input.Position = Vector3.new(0,0,1)
input.BrickColor = BrickColor.new("Eggplant")
input.Material = "SmoothPlastic"
elseif id >= 3 then
local p = Instance.new("Part",ignore)
local input = Instance.new("Part",ignore)
local input2 = Instance.new("Part",ignore)
local output = Instance.new("Part",ignore)
p.Anchored = true
p.Name = "Main"
p.CanCollide = false
p.Material = "SmoothPlastic"
p.Size = Vector3.new(grid,gridy,grid)
input.Anchored = true
input.Name = "Input"
input.CanCollide = false
input.Size = Vector3.new(.4,.4,0)
input.Position = Vector3.new(0,0,1)
input.Position = Vector3.new(.3,0,1)
input.BrickColor = BrickColor.new("Eggplant")
input.Material = "SmoothPlastic"
input2.Anchored = true
input2.Name = "Input2"
input2.CanCollide = false
input2.Size = Vector3.new(.4,.4,0)
input2.Position = Vector3.new(0,0,1)
input2.Position = Vector3.new(-.3,0,1)
input2.BrickColor = BrickColor.new("Eggplant")
input2.Material = "SmoothPlastic"
output.Anchored = true
output.Name = "Output"
output.CanCollide = false
output.Size = Vector3.new(.75,.75,0)
output.Position = Vector3.new(0,0,-1)
output.Color = Color3.new(0,0,0)
output.Material = "SmoothPlastic"
end
m.TargetFilter = ignore
p.Size = Vector3.new(grid,gridy,grid)
for i,v in pairs(ignore:GetDescendants()) do
if v:IsA("BasePart") then
v.Transparency = .5
end
end
end
local function check()
if mode == 0 then
for i,v in pairs(ignore:GetDescendants()) do
if v:IsA("BasePart") then
v.Transparency = .5
end
end
dm = false
canplace = true
print("Mode: placement.")
elseif mode == 1 then
for i,v in pairs(ignore:GetDescendants()) do
if v:IsA("BasePart") then
v.Transparency = .5
end
end
p.Transparency = .5
dm = true
canplace = false
print("Mode: remove.")
elseif mode == 2 then
for i,v in pairs(ignore:GetDescendants()) do
if v:IsA("BasePart") then
v.Transparency = 1
end
end
dm = false
canplace = false
print("Mode: none.")
end
end
uis.InputBegan:Connect(function(inp,c)
if inp.KeyCode == Enum.KeyCode.E and not c then
mode = mode + 1
mode = math.clamp(mode,0,2)
check()
elseif inp.KeyCode == Enum.KeyCode.Q and not c then
mode = mode - 1
mode = math.clamp(mode,0,2)
check()
elseif inp.KeyCode == Enum.KeyCode.R and not c then
if classid > 0 and mode < 2 then
angle = angle + 90
end
elseif inp.KeyCode == Enum.KeyCode.Zero and not c then
classid = 0
clear(classid)
elseif inp.KeyCode == Enum.KeyCode.One and not c then
classid = 1
clear(classid)
elseif inp.KeyCode == Enum.KeyCode.Two and not c then
classid = 2
clear(classid)
elseif inp.KeyCode == Enum.KeyCode.Three and not c then
classid = 3
clear(classid)
elseif inp.KeyCode == Enum.KeyCode.Four and not c then
classid = 4
clear(classid)
elseif inp.KeyCode == Enum.KeyCode.Five and not c then
--[[classid = 2
clear(classid)]]
elseif inp.KeyCode == Enum.KeyCode.Six and not c then
--[[classid = 2
clear(classid)]]
elseif inp.KeyCode == Enum.KeyCode.Seven and not c then
--[[classid = 2
clear(classid)]]
elseif inp.KeyCode == Enum.KeyCode.Eight and not c then
--[[classid = 2
clear(classid)]]
end
end)
m.Button1Down:Connect(function()
local infotab = {CFrame = ignore.WorldPivot,Size = p.Size,Id = classid,deletemode = dm}
if dm then
if m.Target and m.Target.Parent.Parent == sc then
infotab.Part = m.Target.Parent
end
r:FireServer(infotab,owner)
table.remove(inplace,table.find(inplace,x..", "..y..", "..z))
elseif canplace then
if classid == 0 then
linktarget = m.Target
if linktarget and linktarget.Name == "Output" then
if linked1 == false then
oldpt = linktarget
link = Instance.new("Part",ignore)
link.Anchored = true
link.Name = "Link"
link.Transparency = .5
link.CFrame = linktarget.CFrame
link.Size = Vector3.new(0,.475,.475)
link.CanCollide = false
link.Material = "SmoothPlastic"
link.Shape = "Cylinder"
link.Color = Color3.new(0,0,0)
linked1 = true
linked2 = false
end
elseif linktarget and string.sub(linktarget.Name,0,#"Input") == "Input" then
infotab.pt2 = linktarget
if linked1 == true and linked2 == false then
local infotab = {CFrame = link.CFrame,Size = link.Size,pt1 = oldpt,pt2 = linktarget,Id = classid,deletemode = dm}
r:FireServer(infotab,owner)
clear(classid)
linked1 = false
linked2 = false
end
end
elseif classid >= 1 then
if table.find(inplace,x..", "..y..", "..z) == nil then
print(x..", "..y..", "..z)
r:FireServer(infotab,owner)
table.insert(inplace,x..", "..y..", "..z)
end
end
end
end)
game:GetService("RunService").RenderStepped:Connect(function()
if m.Hit.Position.X >= 0 then
x = math.floor(m.Hit.Position.X / grid) * grid
else
x = math.ceil(m.Hit.Position.X / grid) * grid
end
if m.Hit.Position.Y >= 0 then
y = math.floor(m.Hit.Position.Y / gridy) * gridy + p.Size.Y / 2
else
y = math.ceil(m.Hit.Position.Y / gridy) * gridy + p.Size.Y / 2
end
if m.Hit.Position.Z >= 0 then
z = math.floor(m.Hit.Position.Z / grid) * grid
else
z = math.ceil(m.Hit.Position.Z / grid) * grid
end
ignore:PivotTo(CFrame.new(x,y,z) * CFrame.Angles(0,math.rad(angle),0))
if linked1 == true and linked2 == false and link then
link.Size = Vector3.new((linktarget.Position - m.Hit.Position).magnitude,link.Size.Y,link.Size.Z)
link.CFrame = (CFrame.lookAt(linktarget.Position,m.hit.Position) * CFrame.Angles(0,-math.rad(90),0)) * CFrame.new(-(link.Size.X / 2),0,0)
end
end)]==],owner.PlayerGui)
r.OnServerEvent:Connect(function(player,info)
if info.deletemode == false then
if info.Id == 0 then
local model = Instance.new("Model",script)
local p = Instance.new("Part",model)
local pt1 = Instance.new("ObjectValue",model)
local pt2 = Instance.new("ObjectValue",model)
local pt3 = Instance.new("ObjectValue",model)
model.Name = "Cable"..nameid
p.Anchored = true
p.Name = "Link"
p.Size = info.Size
p.Shape = "Cylinder"
p.Color = Color3.new(0,0,0)
p.Material = "SmoothPlastic"
p.CFrame = info.CFrame
pt1.Name = "Part1"
pt2.Name = "Part2"
pt3.Name = "InputPart"
pt1.Value = info.pt1.Parent.Main
pt2.Value = info.pt2.Parent.GE
pt3.Value = info.pt1
elseif info.Id == 1 then
local model = Instance.new("Model",script)
local p = Instance.new("Part",model)
local click = Instance.new("ClickDetector",p)
model.Name = "Energy switch"..nameid
p.Anchored = true
p.Name = "Main"
p.Size = info.Size
p.BrickColor = BrickColor.new("Really red")
p.Material = "SmoothPlastic"
no(model,p.Position,true)
model:PivotTo(info.CFrame)
click.MouseClick:Connect(function(plr)
if plr == owner then
local link,inp = getconnected(p)
local gate = check(link)
if gate == 0 then
if p.BrickColor == BrickColor.new("Lime green") then
p.BrickColor = BrickColor.new("Really red")
if inp ~= nil then
link.Color = Color3.new(0,0,0)
inp.Value = false
end
elseif p.BrickColor == BrickColor.new("Really red") then
p.BrickColor = BrickColor.new("Lime green")
if inp ~= nil then
link.BrickColor = BrickColor.new("New Yeller")
inp.Value = true
end
end
elseif gate == 1 then
if p.BrickColor == BrickColor.new("Lime green") then
p.BrickColor = BrickColor.new("Really red")
if inp ~= nil then
link.Color = Color3.new(0,0,0)
inp.Value = false
inp.Parent.WI.Value -= 1
end
elseif p.BrickColor == BrickColor.new("Really red") then
p.BrickColor = BrickColor.new("Lime green")
if inp ~= nil then
link.BrickColor = BrickColor.new("New Yeller")
inp.Value = true
inp.Parent.WI.Value += 1
end
end
elseif gate == 2 then
p.BrickColor = BrickColor.new("Really red")
if inp ~= nil then
link.Color = Color3.new(0,0,0)
inp.Value = false
inp.Parent.WI.Value -= 1
end
elseif p.BrickColor == BrickColor.new("Really red") then
p.BrickColor = BrickColor.new("Lime green")
if inp ~= nil then
link.BrickColor = BrickColor.new("New Yeller")
inp.Value = true
inp.Parent.WI.Value += 1
end
end
end 
end)
elseif info.Id == 2 then
local model = Instance.new("Model",script)
local p = Instance.new("Part",model)
local energy = Instance.new("BoolValue",model)
model.Name = "Energy input"..nameid
p.Anchored = true
p.Name = "Main"
p.Size = info.Size
p.Material = "SmoothPlastic"
energy.Name = "GE"
energy:GetPropertyChangedSignal("Value"):Connect(function()
if energy.Value == true then
p.Material = "Neon"
else
p.Material = "SmoothPlastic"
end
end)
no(model,p.Position,false,false)
model:PivotTo(info.CFrame)
elseif info.Id == 3 then
local model = Instance.new("Model",script)
local p = Instance.new("Part",model)
local energy = Instance.new("BoolValue",model)
local inpen = Instance.new("NumberValue",model)
no(model,p.Position,false,true)
model.Name = "Gate1|"..nameid
p.Anchored = true
p.Name = "Main"
p.CanCollide = false
p.Material = "SmoothPlastic"
p.Size = info.Size
p.BrickColor = BrickColor.new("Burnt Sienna")
energy.Name = "GE"
inpen.Name = "WI"
energy:GetPropertyChangedSignal("Value"):Connect(function()
if inpen.Value > 0 then
local link,inp = getconnected(p)
local gate = check(link)
if gate == 0 then
if p.BrickColor == BrickColor.new("Lime green") then
p.BrickColor = BrickColor.new("Really red")
if inp ~= nil then
link.Color = Color3.new(0,0,0)
inp.Value = true
end
elseif p.BrickColor == BrickColor.new("Really red") then
p.BrickColor = BrickColor.new("Lime green")
if inp ~= nil then
link.BrickColor = BrickColor.new("New Yeller")
inp.Value = false
end
end
elseif gate == 1 then
if energy.Value == true then
if inp ~= nil then
link.BrickColor = BrickColor.new("New Yeller")
inp.Value = true
inp.Parent.WI.Value += 1
end
p.Material = "Neon"
else
if inp ~= nil then
link.Color = Color3.new(0,0,0)
inp.Value = false
inp.Parent.WI.Value -= 1
end
p.Material = "SmoothPlastic"
end
elseif gate == 2 then
if energy.Value == true then
if inp ~= nil then
link.BrickColor = BrickColor.new("New Yeller")
inp.Value = true
inp.Parent.WI.Value += 1
end
p.Material = "Neon"
else
if inp ~= nil then
link.Color = Color3.new(0,0,0)
inp.Value = false
inp.Parent.WI.Value -= 1
end
p.Material = "SmoothPlastic"
end
end
else
energy.Value = 0
end
end)
model:PivotTo(info.CFrame)
elseif info.Id == 4 then
local model = Instance.new("Model",script)
local p = Instance.new("Part",model)
local energy = Instance.new("BoolValue",model)
local inpen = Instance.new("NumberValue",model)
no(model,p.Position,false,true)
model.Name = "Gate2|"..nameid
p.Anchored = true
p.Name = "Main"
p.CanCollide = false
p.Material = "SmoothPlastic"
p.Size = info.Size
p.BrickColor = BrickColor.new("Toothpaste")
energy.Name = "GE"
inpen.Name = "WI"
energy:GetPropertyChangedSignal("Value"):Connect(function()
if inpen.Value == 2 then
local link,inp = getconnected(p)
local gate = check(link)
if gate == 0 then
if p.BrickColor == BrickColor.new("Lime green") then
p.BrickColor = BrickColor.new("Really red")
if inp ~= nil then
link.Color = Color3.new(0,0,0)
inp.Value = false
end
elseif p.BrickColor == BrickColor.new("Really red") then
p.BrickColor = BrickColor.new("Lime green")
if inp ~= nil then
link.BrickColor = BrickColor.new("New Yeller")
inp.Value = true
end
end
elseif gate == 1 then
if energy.Value == true then
if inp ~= nil then
link.BrickColor = BrickColor.new("New Yeller")
inp.Value = true
inp.Parent.WI.Value += 1
end
p.Material = "Neon"
else
if inp ~= nil then
link.Color = Color3.new(0,0,0)
inp.Value = false
inp.Parent.WI.Value -= 1
end
p.Material = "SmoothPlastic"
end
elseif gate == 2 then
if energy.Value == true then
if inp ~= nil then
link.BrickColor = BrickColor.new("New Yeller")
inp.Value = true
inp.Parent.WI.Value += 1
end
p.Material = "Neon"
else
if inp ~= nil then
link.Color = Color3.new(0,0,0)
inp.Value = false
inp.Parent.WI.Value -= 1
end
p.Material = "SmoothPlastic"
end
end
else
energy.Value = 0
end
end)
model:PivotTo(info.CFrame)
end
else
if info.Part ~= nil then
d:AddItem(info.Part,0)
end
end
nameid += 1
end)