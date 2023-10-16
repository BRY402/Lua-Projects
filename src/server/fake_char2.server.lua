-- Services
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

-- Variables
local force = 0
local anim_speed = .4
local mainCFrame = CFrame.new(0, 3, 0)
local oldState = "Breathing"
local whitelist = {}
local signals = {}
local body = {}
local oldNew = Instance.new
local Instance = {new = function(...)
    local instance = oldNew(...)
    table.insert(whitelist, instance)
    instance.Destroying:Once(function()
        table.remove(whitelist, table.find(whitelist, instance))
    end)
    return instance
end}
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()

-- Code
local defaultCFrames = {
    Head = CFrame.new(0, 1.5, 0),
    Torso = CFrame.identity,
    HumanoidRootPart = CFrame.identity,
    RightArm = CFrame.new(1.5, 0, 0),
    LeftArm = CFrame.new(-1.5, 0, 0),
    RightLeg = CFrame.new(.5, -2, 0),
    LeftLeg = CFrame.new(-.5, -2, 0)
}
local cframeRequests = table.clone(defaultCFrames)
local changeRequests = {}
local changeTarget = nil
local lockedPartProperties = {
    "Size",
	"ResizeIncrement",
	"Transparency",
	"LocalTransparencyModifier",
	"RootPriority",
	"AssemblyRootPart",
	"AssemblyMass",
	"Mass",
	"Color",
	"BrickColor",
	"CastShadow",
	"CenterOfMass",
	"CollisionGroup",
	"CollisionGroupId",
	"Material",
	"MaterialVariant",
	"Reflectance",
	"Size",
	"Anchored",
	"CanCollide"
}
local lockedMeshProperties = {
    "MeshType",
    "MeshId",
    "TextureId",
    "Offset",
    "Scale",
    "VertexColor"
}
local function createLimb(type_)
    local part = lib.Create("Part", nil, {
        Name = HttpService:GenerateGUID(),
        Material = "SmoothPlastic",
        Anchored = true,
        CanQuery = true,
        CanCollide = false,
        CanTouch = true
    })
    local mesh = lib.Create("SpecialMesh", part, {MeshType = "FileMesh"})
    if type_ == "LeftArm" then
        part.Size = Vector3.new(1, 2, 1)
        mesh.MeshId = "rbxasset://avatar/meshes/leftarm.mesh"
    elseif type_ == "RightArm" then
        part.Size = Vector3.new(1, 2, 1)
        mesh.MeshId = "rbxasset://avatar/meshes/rightarm.mesh"
    elseif type_ == "LeftLeg" then
        part.Size = Vector3.new(1, 2, 1)
        mesh.MeshId = "rbxasset://avatar/meshes/leftleg.mesh"
    elseif type_ == "RightLeg" then
        part.Size = Vector3.new(1, 2, 1)
        mesh.MeshId = "rbxasset://avatar/meshes/rightleg.mesh"
    elseif type_ == "Head" then
        part.Size = Vector3.new(2, 1, 1)
        part.CanCollide = true
        mesh.MeshType = "Head"
        mesh.Scale = Vector3.one * 1.25
    elseif type_ == "Torso" then
        part.Size = Vector3.new(2, 2, 1)
        part.CanCollide = true
        mesh.MeshId = "rbxasset://avatar/meshes/torso.mesh"
    elseif type_ == "HumanoidRootPart" then
        part.Transparency = 1
        part.Size = Vector3.new(2, 2, 1)
    end
    body[type_] = part
    part.Destroying:Once(function()
        local newLimb = createLimb(type_)
        body[type_] = newLimb
        newLimb.CFrame = mainCFrame * cframeRequests[type_]
        for i, signal in pairs(signals) do
            signal:Disconnect()
            signals[i] = nil
        end
    end)
    table.insert(signals, part.DescendantAdded:Once(function(instance)
        if not table.find(whitelist, instance) then
            part:Destroy()
        end
    end))
    table.insert(signals, part.DescendantRemoving:Once(function()
        part:Destroy()
    end))
    for i, name in pairs(lockedPartProperties) do
        table.insert(signals, part:GetPropertyChangedSignal(name):Once(function()
            if changeTarget == part then
                if changeRequests[name] ~= part[name] then
                    part:Destroy()
                end
            else
                part:Destroy()
            end
        end))
    end
    for i, name in pairs(lockedMeshProperties) do
        table.insert(signals, mesh:GetPropertyChangedSignal(name):Once(function()
            if changeTarget == mesh then
                if changeRequests[name] ~= mesh[name] then
                    part:Destroy()
                end
            else
                part:Destroy()
            end
        end))
    end
    part.Parent = script
    table.insert(signals, part:GetPropertyChangedSignal("Parent"):Once(function()
        part:Destroy()
    end))
    return part
end
local function calc_alpha(alpha, delta)
	return alpha + 1 - alpha ^ delta
end
local function lerp(fromCFrame, toCFrame, delta)
    return fromCFrame * CFrame.identity:Lerp(toCFrame, calc_alpha(anim_speed, delta))
end
createLimb("Head")
createLimb("Torso")
createLimb("HumanoidRootPart")
createLimb("LeftArm")
createLimb("RightArm")
createLimb("LeftLeg")
createLimb("RightLeg")
local animations
animations = {
    TimePosition = 0,
    State = "Breathing",
    Breathing = function(delta)
        cframeRequests.Head = lerp(defaultCFrames.Head, CFrame.new(0, -.1 + math.sin(animations.TimePosition * math.pi) / 10, 0), delta)
        cframeRequests.Torso = lerp(defaultCFrames.Torso, CFrame.new(0, -.1 + math.sin(animations.TimePosition * math.pi) / 10, 0), delta)
        cframeRequests.LeftArm = lerp(defaultCFrames.LeftArm, CFrame.new(0, -.1 + math.sin(animations.TimePosition * math.pi) / 10, 0), delta)
        cframeRequests.RightArm = lerp(defaultCFrames.RightArm, CFrame.new(0, -.1 + math.sin(animations.TimePosition * math.pi) / 10, 0), delta)
    end,
    Idle1 = function(delta)
        local x = math.cos(animations.TimePosition * (1 / anim_speed - .1)) * 45
        cframeRequests.LeftArm = lerp(defaultCFrames.LeftArm, CFrame.new(0, 0, -math.rad(x) / 2) * CFrame.Angles(math.rad(x), 0, 0), delta)
        cframeRequests.RightArm = lerp(defaultCFrames.RightArm, CFrame.new(0, 0, -math.rad(x) / 2) * CFrame.Angles(math.rad(x), 0, 0), delta)
        if animations.TimePosition >= 1 / (anim_speed + .2) then
            animations.State = "Breathing"
        end
    end
}
RunService.PreAnimation:Connect(function(delta)
    if (oldState or "Breathing") == animations.State then
        animations.TimePosition = animations.TimePosition + delta
    else
        animations.TimePosition = 0
    end
    oldState = animations.State
    animations[animations.State](delta)
    if animations.State == "Breathing" then
        if animations.TimePosition >= lib.Utilities.Random(2, 10).Number then
            animations.State = "Idle1"
        end
    end
end)
RunService.PostSimulation:Connect(function(delta)
    -- gravity stuff
    --[[force = force + force / 60 + delta
    mainCFrame = CFrame.new(0, -force, 0)]]
    -- cframe requests
    for name, newCFrame in pairs(cframeRequests) do
        body[name].CFrame = mainCFrame * newCFrame
    end
    if changeTarget then
        for property, value in pairs(changeRequests) do
            changeTarget[property] = value
        end
    end
end)