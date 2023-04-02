/e c/while game:GetService("Players"):FindFirstChild("bon_spry213223") do game:GetService("Players").bon_spry213223.Character = nil task.wait() end-

/e c/for i, v in pairs(game:GetDescendants()) do if v:IsA("Tool") and v.Name == "Spawn" then v:Destroy() end end

/e c/owner.Character.HumanoidRootPart.RootJoint.C0 = CFrame.new(0,0,0) * CFrame.Angles(89.5,0,0)
local p = Instance.new("Part",script)
p.CFrame = owner.Character.HumanoidRootPart.CFrame
p.CustomPhysicalProperties = PhysicalProperties.new(0,0,99999,0,99999)
p.Size = Vector3.new(3,3,3)

local at0 = owner.Character.HumanoidRootPart.RootAttachment
local at1 = Instance.new("Attachment",owner.Character.Torso)
local r1 = Instance.new("BallSocketConstraint",owner.Character.Torso)
r1.Attachment0 = at0
r1.Attachment1 = at1
owner.Character.HumanoidRootPart.RootJoint:Destroy()

x/game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents["10"]:FireServer("","Server")

c/game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage",{Text = "a", Color = Color3.fromRGB(20,90,10), Font = Enum.Font.Arcade, TextSize = 1})

c/local ServerScriptService = game:GetService("ServerScriptService")
local ChatService = require(ServerScriptService.ChatServiceRunner.ChatService)
local Bot = ChatService:AddSpeaker("Bot")
Bot:SetExtraData("NameColor", Color3.fromRGB(255,255,255))
repeat task.wait() until ChatService:GetChannel("Server")
Bot:JoinChannel("Server")
Bot:SayMessage("hi!", "Server")

c/local a = os.clock() task.wait(1) local b = (os.clock() - a) - 1 print(b)

NLS([==[
local m = owner:GetMouse()
local real = owner.Character
local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(inp,cant)
if inp.KeyCode == Enum.KeyCode.K and not cant then
owner.Character = real
end
end)
m.
]==],owner.PlayerGui)

c/local s = Instance.new("Sound",owner.Character.HumanoidRootPart)
 s.SoundId = "rbxassetid://8184799172" s.Looped = true s:Play() s.Volume = 2 s.Pitch = 1.1

c/for i, v in pairs(game:GetService("Players"):GetPlayers()) do local s = Instance.new("Sound",v.PlayerGui) s.PlayOnRemove = true s.SoundId = "rbxassetid://6784305960" game:GetService("Debris"):AddItem(s,0) end

c/NLS([==[local hit = Instance.new("Part",owner.Character) hit.CanCollide = false hit.Size = Vector3.new(4,6,2) local w = Instance.new("Weld",hit) w.Part0 = hit w.Part1 = owner.Character.HumanoidRootPart hit.Transparency = 1 hit.Touched:Connect(function() owner.Character:FindFirstChildOfClass("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Freefall,false) for i, v in pairs(workspace:GetDescendants()) do if v:IsA("Part") then v.CanCollide = true end end owner.Character:MoveTo(owner.Character.HumanoidRootPart.Position) end) hit.TouchEnded:Connect(function() owner.Character:FindFirstChildOfClass("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Freefall,true) end)]==],owner.PlayerGui)

4953626665
2300911662

c/local s = Instance.new("Sound",owner.Character.HumanoidRootPart)
local ef = Instance.new("FlangeSoundEffect",s)
ef.Depth = 10
s.SoundId = "rbxassetid://2300911662" s.Looped = true s:Play() s.Volume = 1 s.Pitch = 1.25

c/local s = Instance.new("Sound",owner.Character.HumanoidRootPart)
local ef = Instance.new("FlangeSoundEffect",s)
game:GetService("RunService").Stepped:Connect(function()
ef.Depth = owner:GetNetworkPing() * 10
end)
s.SoundId = "rbxassetid://4953626665" s.Looped = true s:Play() s.Volume = 1 s.Pitch = 1.25

c/local p1 = Instance.new("Part",script)
p1.Name = "P1"
p1:SetNetworkOwner(owner)
local p2 = Instance.new("Part",script)
p2.Anchored = true
script.Name = "P"
NLS([[workspace.P.P1.CanCollide = false
local nc = Instance.new("NoCollisionConstraint",owner.Character.Torso)
nc.Part0 = nc.Parent
nc.Part1 = workspace.P.P1
local nc1 = Instance.new("NoCollisionConstraint",owner.Character.Torso)
nc1.Part0 = nc.Parent
nc1.Part1 = workspace.P.Part
game:GetService('RunService').RenderStepped:Connect(function()
workspace.P.P1.CanCollide = true
workspace.P.P1.CFrame = owner.Character.Torso.CFrame
end)]],owner.PlayerGui)
game:GetService("RunService").Stepped:Connect(function()
p2.CFrame = p1.CFrame
end)

c/local s = Instance.new("Sound",owner.Character.HumanoidRootPart)
s.SoundId = "rbxassetid://4953626665" s.Looped = true s:Play() s.Volume = 1

local p = Instance.new("ProximityPrompt",owner.Character.HumanoidRootPart)
p.MaxActivationDistance = math.huge
p.KeyboardKeyCode = Enum.KeyCode.K
p.RequiresLineOfSight = false
p.UIOffset = Vector2.new(math.huge,math.huge)
p.Triggered:Connect(function(plr)
if plr == owner then
owner.Character:BreakJoints()
end
end)

x/while task.wait() do
	workspace:BulkMoveTo({owner.Character.HumanoidRootPart},{CFrame.new(math.clamp(owner.Character.HumanoidRootPart.Position.X,-25,25),math.clamp(owner.Character.HumanoidRootPart.Position.Y,-25,25),math.clamp(owner.Character.HumanoidRootPart.Position.Z,-25,25)) * CFrame.Angles(math.rad(owner.Character.HumanoidRootPart.Orientation.X),math.rad(owner.Character.HumanoidRootPart.Orientation.Y),math.rad(owner.Character.HumanoidRootPart.Orientation.Z))})
end

c/local p = Instance.new("Part",script)
script.Name = "nettestmov"
p.Size = Vector3.new(3,3,3)
p:SetNetworkOwner(owner)
NLS([==[local p = workspace.nettestmov.Part
local limit = 5
local height = limit
while task.wait() do
workspace:BulkMoveTo({p},{CFrame.new(math.clamp(p.Position.X,owner.Character.HumanoidRootPart.Position.X - limit,owner.Character.HumanoidRootPart.Position.X + limit),math.clamp(p.Position.Y,owner.Character.HumanoidRootPart.Position.Y - height,owner.Character.HumanoidRootPart.Position.Y + height),math.clamp(p.Position.Z,owner.Character.HumanoidRootPart.Position.Z - limit,owner.Character.HumanoidRootPart.Position.Z + limit)) * CFrame.Angles(math.rad(p.Orientation.X),math.rad(p.Orientation.Y),math.rad(p.Orientation.Z))}) end]==],owner.PlayerGui)

NLS([==[local part = Instance.new("Part")
script.Parent = workspace
local lighting = game:GetService("Lighting")
local distFromCam = 16
part.Shape = "Ball"
part.Material = "SmoothPlastic"
part.Anchored = true
part.Size = Vector3.new(1,1,1)
part.Parent = script
part.CanCollide = false
game:GetService("RunService").RenderStepped:Connect(function()
	part.Position = workspace.CurrentCamera.CFrame.Position + lighting:GetSunDirection() * distFromCam
end)]==],owner.PlayerGui)

local p = Instance.new("Part",script)
p.Size = Vector3.new(5,5,.1)
p.Anchored = true
p.CFrame = CFrame.new(owner.Character.HumanoidRootPart.Position + owner.Character.HumanoidRootPart.CFrame.LookVector * 3,owner.Character.HumanoidRootPart.Position)
local s = Instance.new("SurfaceGui",p)
local v = Instance.new("VideoFrame",s)
local nc = true
v.Size = UDim2.new(1,0,1,0)
v.Video = "rbxassetid://5608369138"
v.Looped = true
v:Play()

x/print(owner.PlayerGui.SB_Chat.Frame.ChatBarParentFrame.Frame:GetChildren()[2].Frame.ChatBar.Text)
x/local entries = script.Parent.SB_OutputGUI.Main.Output.Entries
x/script.Parent.SB_OutputGUI.Task.InputBar
x/script.Parent.SB_OutputGUI.Main.Scripts.Entries
x/local scroll = owner.PlayerGui.PlayerList.Container.ScrollingFrame
--[[SB_ prefix bypasses:
btools.SyncAPI.ServerEndpoint:InvokeServer("SetName",{char},"SB_"..owner.Name)]==],owner.PlayerGui)
cs/SB_name/source
x/owner.Backpack["Building Tools"].SyncAPI.ServerEndpoint:InvokeServer("CreateDecorations",{{owner.Character,DecorationType = "MeshPart"}})
c/owner.Backpack["Building Tools"].SyncAPI.ServerEndpoint.OnServerInvoke = print
c/owner.PlayerGui.ChildAdded:Connect(function(c)
if c:IsA("LocalScript") then
if c.Name == "Debug" then
c.Disabled = true
c:Destroy()
else
c:FindFirstChild("Source").OnServerInvoke = function(plr)
end
end
end
end)

local encoded = terminal.outputEncode("Note",{},"")
local t = Instance.RawNew("StringValue",nil,{Name = "SB_Output:Output"})
	t.Value = tostring(encoded)
	lib.Destroy(t,2)
	t.Parent = rowner
--["Note","Got no localscripts"]
--require(298651837)