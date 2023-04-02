-- platform
-- Variables --
local platform = Instance.new("Part",script)
local ap = Instance.new("AlignPosition",platform)
local ao = Instance.new("AlignOrientation",platform)
local at0 = Instance.new("Attachment",platform)
local at1 = Instance.new("Attachment",owner.Character.HumanoidRootPart)
local ts = game:GetService("TweenService")
local Info = TweenInfo.new(1.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0)
local what = { Size = Vector3.new(.1,10,10) }
local grow = ts:Create(platform,Info,what)
-- Properties
script.Name = "platform"
platform.Shape = "Cylinder"
platform.Material = "Grass"
platform.Size = Vector3.new(0,0,0)
platform.Reflectance = 0
platform.BrickColor = BrickColor.new("Forest green")
platform.Position = owner.Character.HumanoidRootPart.Position
platform:SetNetworkOwner(owner)
at1.Position = at1.Position - Vector3.new(0,3.1,0)
at1.Orientation = at1.Orientation + Vector3.new(0,0,-90)
ap.Attachment0 = at0
ap.Attachment1 = at1
ao.Attachment0 = at0
ao.Attachment1 = at1
ap.RigidityEnabled = true
ao.RigidityEnabled = true
-- Script --
grow:Play()
NLS([==[
local r = game:GetService("RunService")
local p = workspace.platform
p.Part.Position = owner.Character.HumanoidRootPart.Position
]==],owner.PlayerGui)
-- UP TO DATE.