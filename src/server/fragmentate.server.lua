local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local fragmentable = workspace
local minimumsize = Vector3.new(1, 1, 1) -- this is the fragment quality
local list = {}
local function fragmentate(cframe, size, color, explosion_position, explosion_blastradius, backsurface, bottomsurface, frontsurface, leftsurface, rightsurface, topsurface, transparency, reflectance, material, anchored, heck, ree, same)
    local xi = size.X >= minimumsize.X * (1 + explosion_blastradius / 16) and 2 or 1
    local yi = size.Y >= minimumsize.Y * (1 + explosion_blastradius / 16) and 2 or 1
    local zi = size.Z >= minimumsize.Z * (1 + explosion_blastradius / 16) and 2 or 1
    if xi == 1 and yi == 1 and zi == 1 or (cframe.Position - explosion_position).magnitude > size.magnitude / 2 + explosion_blastradius then
        if xi == 1 and yi == 1 and zi == 1 then return end
            local part = Instance.new("Part", fragmentable)
            part.BrickColor = color
            part.FormFactor = "Custom"
			if heck then
            	part.Anchored = anchored
			else
				part.Anchored = false
			end
            part.Size = size
            part.BackSurface = backsurface
            part.BottomSurface = bottomsurface
            part.FrontSurface = frontsurface
            part.LeftSurface = leftsurface
            part.RightSurface = rightsurface
			if heck ~= true or ree == true then
				part:SetAttribute("Broken", true)
			end
            part.TopSurface = topsurface
			if redmode and ree and same ~= true then
				spawn(function()
					repeat
						part.Color = Color3.new(1, 0, 0)
						part.Material = Enum.Material.Neon
						task.wait()
					until part.Color == Color3.new(1, 0, 0) and part.Material == Enum.Material.Neon
				end)
			end
            part.Transparency = transparency
            part.Material = material
			if heck ~= true or ree then
				game:GetService("Debris"):AddItem(part, 10)
			end
            part.CFrame = cframe
            part.Reflectance = reflectance
            part:BreakJoints()
        return
    end
    local mody = math.random(-125, 125) / 1000
    for y = 1, yi do
        if math.random() > 0.5 then
            local modx = math.random(-125, 125) / 1000
            for x = 1, xi do
                local modz = math.random(-125, 125) / 1000
                for z = 1, zi do --offset = x / xi - 0.75 + modx)
                    fragmentate(cframe * CFrame.new(size.X * (xi == 1 and 0 or x / xi - 0.75 + modx), size.Y * (yi == 1 and 0 or y / yi - 0.75 + mody), size.Z * (zi == 1 and 0 or z / zi - 0.75 + modz)), 
                        Vector3.new(xi == 2 and size.X * (1 - 2 * math.abs(x / xi - 0.75 + modx)) or size.X, yi == 2 and size.Y * (1 - 2 * math.abs(y / yi - 0.75 + mody)) or size.Y, 
                        zi == 2 and size.Z * (1 - 2 * math.abs(z / zi - 0.75 + modz)) or size.Z), color, explosion_position, explosion_blastradius, 
                        z ~= zi and surface_between_splitted_parts or backsurface, y == 2 and surface_between_splitted_parts or bottomsurface, 
                        z == 2 and surface_between_splitted_parts or frontsurface, x == 2 and surface_between_splitted_parts or leftsurface, x ~= xi and surface_between_splitted_parts or rightsurface, 
                        y ~= yi and surface_between_splitted_parts or topsurface, transparency, reflectance, material, anchored, heck, ree, same)
                end
            end
        else
            local modz = math.random(-125, 125) / 1000
            for z = 1, zi do
                local modx = math.random(-125, 125) / 1000
                for x = 1, xi do
                    fragmentate(cframe * CFrame.new(size.X * (xi == 1 and 0 or x / xi - 0.75 + modx), size.Y * (yi == 1 and 0 or y / yi - 0.75 + mody), size.Z * (zi == 1 and 0 or z / zi - 0.75 + modz)), 
                        Vector3.new(xi == 2 and size.X * (1 - 2 * math.abs(x / xi - 0.75 + modx)) or size.X, yi == 2 and size.Y * (1 - 2 * math.abs(y / yi - 0.75 + mody)) or size.Y, 
                        zi == 2 and size.Z * (1 - 2 * math.abs(z / zi - 0.75 + modz)) or size.Z), color, explosion_position, explosion_blastradius, 
                        z ~= zi and surface_between_splitted_parts or backsurface, y == 2 and surface_between_splitted_parts or bottomsurface, 
                        z == 2 and surface_between_splitted_parts or frontsurface, x == 2 and surface_between_splitted_parts or leftsurface, x ~= xi and surface_between_splitted_parts or rightsurface, 
                        y ~= yi and surface_between_splitted_parts or topsurface, transparency, reflectance, material, anchored, heck, ree, same)
                end
            end
        end
    end            
end
local function start_fragmentation(position, radius, bigoof, smoloof, samecolor)
	if bigoof then
		workspace:FindFirstChildOfClass("Terrain"):FillBall(position, radius * 2, Enum.Material.Air)
	end
    local search = Region3.new(position - Vector3.new(radius, radius, radius) * 1.1, position + Vector3.new(radius, radius, radius) * 1.1)
    repeat
    local finish = false
    local parts = workspace:FindPartsInRegion3WithIgnoreList(search, list, 100)
    for i = 1, #parts do
        table.insert(list, 1, parts[i])
    end
    finish = true
    until #parts < 100 and finish
    for i = 1, #list do
        local part = list[i]
        if part:GetAttribute("Broken") ~= true and part ~= workspace:FindFirstChild("Base") and part:IsA("CornerWedgePart") == false and part:IsA("TrussPart") == false and part:IsA("WedgePart") == false and part.Parent and part:IsDescendantOf(fragmentable) and (part:GetMass() < 50000 or part.Anchored == true) and part.Name ~= "Baseplate" and (part.Transparency > .285 or (bigoof == true and (samecolor ~= true or part.Parent:FindFirstChildOfClass("Humanoid")))) and part.Name ~= "Base" and (part.Parent:FindFirstChildOfClass("Humanoid") == nil or smoloof == true) and (part.Parent.Parent:FindFirstChildOfClass("Humanoid") == nil or smoloof == true) then
			if bigoof ~= true then
				local thingy = part
				local humm = part.Parent
				thingy.Parent = nil
				task.wait(10)
				thingy.Parent = humm
			else
				part:Destroy()
			end
            fragmentate(part.CFrame, part.Size, part.BrickColor, position, radius, part.BackSurface, part.BottomSurface, part.FrontSurface, part.LeftSurface, part.RightSurface, part.TopSurface, part.Transparency, part.Reflectance, part.Material, part.Anchored, bigoof, smoloof, samecolor)
        end
    end
    list = {}
end
local Character = owner.Character
local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
local handle
local touchedEvent = lib.Utilities.newEvent("Touched", "Fire", "Function")
local tool = lib.Create("Tool", owner.Backpack, {
    Name = "Cool tool",
    lib.Create("Part", nil, {
        Name = "Handle",
        Size = Vector3.one,
        __self = function(part)
            handle = part
        end
    })
})
tool.Activated:Connect(function()
    if not touchedEvent.Touched:Wait(1.5, true) then return end
    start_fragmentation(handle.Position, 1, true)
end)
handle.Touched:Connect(touchedEvent.Fire)