-- info
local http = game:GetService("HttpService")
local NLS = loadstring(http:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/nls.lua",true))()
local p = Instance.new("Part",script)
local rs = game:GetService("RunService")
vf = Instance.new("VectorForce",p)
local at = Instance.new("Attachment",p)
local s = Instance.new("SurfaceGui",p)
local t = Instance.new("TextBox",s)
p.Size = Vector3.new(6,4,.1)
p.Name = "InfoPart"
p.Color = Color3.new(1,1,1)
p:SetNetworkOwner(owner)
s.Face = "Back"
vf.Attachment0 = at
vf.RelativeTo = Enum.ActuatorRelativeTo.World
vf.Force = Vector3.new(0,workspace.Gravity * p.AssemblyMass,0)
vf.ApplyAtCenterOfMass = true
t.Size = UDim2.new(1,0,1,0)
t.BackgroundTransparency = 1
t.TextXAlignment = "Left"
t.TextYAlignment = "Top"
t.TextSize = 48
t.Text = "PlaceHolder"
NLS([==[local p = rscript.InfoPart
game:GetService("RunService").RenderStepped:Connect(function(d)
if owner.Character then
local hrp = owner.Character:FindFirstChild("HumanoidRootPart")
if hrp then
p.CFrame = CFrame.new((hrp.Position) + hrp.CFrame.lookVector * 4) * hrp.CFrame.Rotation
end
end
end)]==],owner.PlayerGui)
rs.Stepped:Connect(function(ti,s)
local fps,sfps,pfps = math.round(2/wait()),math.clamp(math.round(-(s * 5600) + 210),0,60),math.round(workspace:GetRealPhysicsFPS())
vf.Force = Vector3.new(0,workspace.Gravity * p.AssemblyMass,0)
t.Text = "FPS: "..fps.."\nStepped FPS: "..sfps.."\nPhysics FPS: "..pfps.."\nServer was up for: "..math.round((ti / 60) / 60).." hours"
end)
-- UP TO DATE.