--[[fov = 45

local scale = {studs = {20,20},s = {854,480},m = {1280,720}, l = {1920,1080}}
local xs,ys = scale.studs[1]/2,scale.studs[2]/2
local rayp = RaycastParams.new()
--rayp.FilterDescendantsInstances = {script,workspace:FindFirstChild("Base"),workspace:FindFirstChild("Wall")}
rayp.FilterDescendantsInstances = {script}
rayp.FilterType = Enum.RaycastFilterType.Blacklist
local tool = Instance.new("Tool",owner.Backpack)
local handle = Instance.new("Part",tool)
handle.Name = "Handle" 
handle.Size = Vector3.one
handle.Material = Enum.Material.SmoothPlastic
handle.Color = Color3.new(0, 0, 0)
tool.GripPos= Vector3.new(0,0,handle.Size.Z/2)
local debris = game:GetService("Debris")
local worldmodel = Instance.new("WorldModel",script)
local function angleBetweenVectors(u, v) -- https://devforum.roblox.com/t/getting-the-angle-between-two-vectors/349866/2
	return math.acos(u:Dot(v)/u.magnitude*v.magnitude)
end
local function raycast(origin,direction)
	return workspace:Raycast(origin,direction,rayp)
end

local function toHSB(color3)
	return Color3.toHSV(color3)
end
tool.Activated:Connect(function()
	for x = -xs,xs,.5 do
		for y = -ys,ys,.5 do
			task.spawn(function()
				--local ray = raycast(handle.Position,((handle.CFrame - handle.Position) * CFrame.Angles(math.rad((x / xs) * (fov)),math.rad((y / ys) * (fov)),0) * CFrame.new(0,0,-1000)).Position,rayp)
				local ray = raycast(handle.Position, ((handle.CFrame - handle.Position) * CFrame.new((x * xs) * (fov),(y * ys) * (fov),-10000)).Position,rayp)
				if ray then
					local Block = Instance.new("SpawnLocation",worldmodel) 
					Block.Enabled = false
					Block.Position = ray.Position
					Block.Anchored = true
					Block.Size = Vector3.one/2
					Block.CanCollide = false
					--Block.Material = Enum.Material.Neon
					Block.Color = ray.Instance.Color
					local currentPos = handle.Position
					local currentNormal = ((handle.CFrame - handle.Position) * CFrame.new((x / xs) * (fov),(y / ys) * (fov),-10000)).Position
					--local currentNormal = ((handle.CFrame - handle.Position) * CFrame.Angles(math.rad((x / xs) * (fov)),math.rad((y / ys) * (fov)),0) * CFrame.new(0,0,-10000)).Position
					local surfaceNormal = ray.Normal.Unit
					local lightDirection = game:GetService("Lighting"):GetSunDirection()
					local shadowRay = raycast(ray.Position+surfaceNormal*0.01, lightDirection * 1000)
					local shadow = math.cos(angleBetweenVectors(lightDirection, surfaceNormal)) / (1.25*10)
					if shadowRay then
						shadow -=  .25
					end
					shadow -= 1.25/2*-1
					local hue,saturation,brightness = toHSB(ray.Instance.Color)
					local maxshadowvalue = brightness
					local lightEnergy = math.cos(angleBetweenVectors(lightDirection, surfaceNormal)) * shadow* (1-maxshadowvalue)+maxshadowvalue
					local block = Instance.new("SpawnLocation",worldmodel) 
					block.Enabled = false
					block.CFrame = tool.Parent.HumanoidRootPart.CFrame*CFrame.new((xs+x)+.5,(ys+y)+.5,0)
					block.Size = Vector3.new(1,1,0)/2
					block.Color = Color3.new(ray.Instance.Color.R*lightEnergy,ray.Instance.Color.G*lightEnergy,ray.Instance.Color.B*lightEnergy)
					Block.Color = block.Color
					if ray.Instance.Reflectance > 0 then

						currentPos = ray.Position
						local norm = ray.Normal
						local reflect = (currentNormal - (2 * currentNormal:Dot(norm) * norm))
						local currentNormal = reflect
						local reflectray = raycast(currentPos,currentNormal)
						if reflectray then
							local surfaceNormal = reflectray.Normal
							local lightDirection = game:GetService("Lighting"):GetSunDirection()
							local shadowRay = raycast(reflectray.Position+surfaceNormal*0.01, lightDirection * 10000)
							local shadow = math.cos(angleBetweenVectors(lightDirection, surfaceNormal)) / (1.25*10)
							if shadowRay then
								shadow -=  .25
							end
							shadow -= 1.25/2*-1
							local hue,saturation,brightness = toHSB(reflectray.Instance.Color)
							local maxshadowvalue = brightness
							local lightEnergy = math.cos(angleBetweenVectors(lightDirection, surfaceNormal)) * shadow* (1-maxshadowvalue)+maxshadowvalue
							block.Color = block.Color:Lerp(Color3.new(reflectray.Instance.Color.R*lightEnergy,reflectray.Instance.Color.G*lightEnergy,reflectray.Instance.Color.B*lightEnergy),ray.Instance.Reflectance)
							Block.Color = block.Color
						else
							block.Color = block.Color:Lerp(Color3.new(0, 0.611765*lightEnergy, 0.917647*lightEnergy),ray.Instance.Reflectance)
							Block.Color = block.Color
						end
					end

					local success = pcall(function()
						return workspace.Terrain:GetMaterialColor(ray.Material) 
					end)
					if success and ray.Instance == workspace.Terrain then
						if workspace.Terrain:GetMaterialColor(ray.Material) then
							block.Color = Color3.new(workspace.Terrain:GetMaterialColor(ray.Material).R*lightEnergy,workspace.Terrain:GetMaterialColor(ray.Material).G*lightEnergy,workspace.Terrain:GetMaterialColor(ray.Material).B*lightEnergy)
							Block.Color = block.Color
						end
					end

					if ray.Material == Enum.Material.Water then
						currentPos = ray.Position
						local norm = ray.Normal
						local reflect = (currentNormal - (2 * currentNormal:Dot(norm) * norm))
						local currentNormal = reflect
						local reflectray = raycast(currentPos,currentNormal)
						local surfaceNormal = ray.Normal
						local lightDirection = game:GetService("Lighting"):GetSunDirection()
						local shadowRay = raycast(ray.Position+surfaceNormal*0.01, lightDirection * 10000)
						local shadow = math.cos(angleBetweenVectors(lightDirection, surfaceNormal)) / (1.25*10)
						if shadowRay then
							shadow -=  .25
						end
						shadow -= 1.25/2*-1
						local hue,saturation,brightness = toHSB(workspace.Terrain.WaterColor)
						local maxshadowvalue = brightness
						local lightEnergy = math.cos(angleBetweenVectors(lightDirection, surfaceNormal)) * shadow* (1-maxshadowvalue)+maxshadowvalue
						local reflectray = raycast(currentPos,currentNormal)
						--block.Color =   Color3.new(workspace.Terrain.WaterColor.R*lightEnergy,workspace.Terrain.WaterColor.G*lightEnergy,workspace.Terrain.WaterColor.G*lightEnergy)
						--Block.Color = block.Color
						if reflectray then
							local surfaceNormal = reflectray.Normal
							local lightDirection = game:GetService("Lighting"):GetSunDirection()
							local shadowRay = raycast(reflectray.Position+surfaceNormal*0.01, lightDirection * 10000)
							local shadow = math.cos(angleBetweenVectors(lightDirection, surfaceNormal)) / (1.25*10)
							if shadowRay then
								shadow -=  .25
							end
							shadow -= 1.25/2*-1
							local hue,saturation,brightness = toHSB(reflectray.Instance.Color)
							local maxshadowvalue = brightness
							local lightEnergy = math.cos(angleBetweenVectors(lightDirection, surfaceNormal)) * shadow* (1-maxshadowvalue)+maxshadowvalue
							block.Color =  block.Color:Lerp(Color3.new(reflectray.Instance.Color.R*lightEnergy,reflectray.Instance.Color.G*lightEnergy,reflectray.Instance.Color.B*lightEnergy),workspace.Terrain.WaterReflectance)
							Block.Color = block.Color
						else
							block.Color =  block.Color:Lerp(Color3.new(0, 0.611765, 0.917647),workspace.Terrain.WaterReflectance)
							Block.Color = block.Color
						end
					end

				else
					local block = Instance.new("SpawnLocation",worldmodel) 
					block.Enabled = false
					block.CFrame = tool.Parent.HumanoidRootPart.CFrame*CFrame.new((xs+x)+.5,(ys+y)+.5,0)
					block.Size = Vector3.new(1,1,0)/2
					block.Color = Color3.new(0, 0.611765, 0.917647)
				end
			end)
		end

	end
	task.wait(10)
	for i,v in ipairs(worldmodel:children()) do
		v:Destroy()
	end

end)]]
