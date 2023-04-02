pcall(function()
owner.Character.Animate.Disabled = true
owner.Character.Humanoid.Animator:Destroy()
end)
script.Parent = nil
local t = owner.Character.Torso
local hum = owner.Character.Humanoid
local rj = owner.Character.HumanoidRootPart.RootJoint
local n = t.Neck
local ra = t["Right Shoulder"]
local la = t["Left Shoulder"]
local rl = t["Right Hip"]
local ll = t["Left Hip"]
local r = 0
local br = 0
local states = {idle = true,walking = false}
local function SetState(name)
table.foreach(states,function(x,y)
if x ~= name then
states[x] = false
else
states[x] = true
end
end)
end
hum.WalkSpeed = 10
hum.Running:Connect(function(speed)
if speed <= 0 then
SetState("idle")
elseif speed <= 10 then
SetState("walking")
end
end)
n.C0 = CFrame.new(0,1.5,0) * CFrame.Angles(0,0,0)
game:GetService("RunService").Heartbeat:Connect(function()
if states.idle then
r = 0
local bh = math.sin(br / 25) / 20
br += 1
n.C0 = CFrame.new(0,1.5,0) * n.C0.Rotation
n.C1 = CFrame.new()
ra.C0 = CFrame.new(1.5,math.sin(os.clock() * 1.75) / 12,0)
ra.C1 = CFrame.new()
la.C0 = CFrame.new(-1.5,math.sin(os.clock() * 1.75) / 12,0)
la.C1 = CFrame.new()
rl.C0 = CFrame.new(.5,-bh - 2,0)
rl.C1 = CFrame.new()
ll.C0 = CFrame.new(-.5,-bh - 2,0)
ll.C1 = CFrame.new()
rj.C0 = CFrame.new(0,bh,0)
rj.C1 = CFrame.new()
elseif states.walking then
br = 0
local cos = math.cos(r / 22.5) / 1.5
local cos2 = math.cos(r / 15) / 1.5
r += 1
n.C0 = CFrame.new(0,1.5,0)
n.C1 = CFrame.new()
ra.C0 = CFrame.new(1.5,0,-cos2) * CFrame.Angles(cos2,0,0)
ra.C1 = CFrame.new()
la.C0 = CFrame.new(-1.5,0,cos2) * CFrame.Angles(-cos2,0,0)
la.C1 = CFrame.new()
rl.C0 = CFrame.new(.5,-2,cos) * CFrame.Angles(-cos,0,0)
rl.C1 = CFrame.new()
ll.C0 = CFrame.new(-.5,-2,-cos) * CFrame.Angles(cos,0,0)
ll.C1 = CFrame.new()
rj.C0 = CFrame.new(0,0,0)
rj.C1 = CFrame.new()
end
end)
while task.wait(math.random(15,25)) do
if states.idle then
for i = 1,22.5,.25 do
if states.idle then
n.C0 = CFrame.new(0,1.5,0) * CFrame.Angles(0,math.rad(i),0)
task.wait()
else
break
end
end
task.wait(.15)
for i = 22.5,-22.5,-.25 do
if states.idle then
n.C0 = CFrame.new(0,1.5,0) * CFrame.Angles(0,math.rad(i),0)
task.wait()
else
break
end
end
task.wait(.15)
for i = -22.5,0,.25 do
if states.idle then
n.C0 = CFrame.new(0,1.5,0) * CFrame.Angles(0,math.rad(i),0)
task.wait()
else
break
end
end
task.wait(.15)
n.C0 = CFrame.new(0,1.5,0) * CFrame.Angles(0,0,0)
else
break
end
end