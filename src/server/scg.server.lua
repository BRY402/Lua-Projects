-- scg
-- Variables --
local wo = Instance.new("WorldModel",script)
local w = Instance.new("SpawnLocation",wo)
local s = Instance.new("SurfaceGui",w)
local g = Instance.new("TextBox",s)
local r = game:GetService("RunService")
-- Properties --
g.Size = UDim2.new(1,0,1,0)
g.BackgroundTransparency = 1
g.Text = "Text"
g.TextScaled = true
g.TextColor3 = Color3.fromRGB(255,255,255)
w.Color = Color3.fromRGB(37,37,37)
w.Size = Vector3.new(7.5,7.5,0)
w.Enabled = false
w.Anchored = true
w.CanCollide = false
-- Script --
if script:IsA("LocalScript") then
error("Script MUST be a server-sided script.")
end
owner.Chatted:Connect(function(msg)
if string.sub(msg,0,3) == "/e " then
else
local ph = ""
g.Text = ""
for i = 1,#msg do
repeat
g.Text = ph
guess = string.char(math.random(0,127))
g.Text ..= guess
r.Stepped:Wait()
until guess == string.sub(msg,i,i)
ph ..= guess
g.Text = ph
end
end
end)
r.Stepped:Connect(function()
w.CFrame = CFrame.new(owner.Character.HumanoidRootPart.Position + owner.Character.HumanoidRootPart.CFrame.lookVector * 5,owner.Character.HumanoidRootPart.Position)
end)
print("Ran server-sided.")
warn("Made by BRY402.")