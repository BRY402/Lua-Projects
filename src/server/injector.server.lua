-- @injector
-- Services
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Chat = game:GetService("Chat")

-- Variables
local info = TweenInfo.new(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut, 0, false, 0)
local liquid_info = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local oil_shrink = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)
local torso_grow = TweenInfo.new(2.5, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, false, 0)
local params = RaycastParams.new()
params.RespectCanCollide = true
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua"), "lib")()
local build = loadstring(HttpService:GetAsync("https://gist.github.com/BRY402/ef29b8b4ae4e87b0c8b92b989452bdeb/raw"), "build")()
local cooldown = false
local touched = nil
local injector = build("injector")[1]
injector.Parent = owner.Backpack
local GunNeedle = lib.Utilities.newEvent("Touched", "Touch", "Function")
local vialInjectEvent = lib.Utilities.newEvent("Injected", "Inject")
local needle = injector:WaitForChild("Handle").Needle

-- Functions
local function isPlayer(character)
	return Players:GetPlayerFromCharacter(character) and not character:GetAttribute("IsRobot")
end
local function getInHitbox(filterlist, data)
	local params1 = RaycastParams.new()
	params1.FilterDescendantsInstances = filterlist
	params1.RespectCanCollide = true
	local inhitbox = workspace:Raycast(data.Position + Vector3.new(0, data.Size.Y / 2, 0), -Vector3.new(0, data.Size.Y / 2 + 1, 0), params1)
	return inhitbox
end
local function newLiquid(velocity, upvelocity, Properties, filterlist)
	local storage = {}
	local upvelocity = upvelocity or velocity / 5
	local part = lib.Create("Part", script, {
		Material = "SmoothPlastic",
		Size = Vector3.new(math.clamp(velocity / 30, .1, .5), math.clamp(velocity / 30, .1, .5), math.clamp(velocity / 10, .1, 3)),
		Reflectance = .1,
		CanCollide = false,
		Anchored = true,
		lib.Create("SpecialMesh", nil, {
			MeshType = "Sphere"
		})
	})
	if Properties then
		lib.Loops.read(Properties, function(i, v)
			part[i] = v
		end)
	end
	local mesh = part.Mesh
	storage.velocity = velocity
	storage.upvelocity = upvelocity
	storage.force = 0
	lib.Utilities.fastSpawn(function()
		lib.Loops.forever(function(repeats, yielding, delta)
			local x, y = storage.upvelocity / 40, math.rad(math.cos(os.clock() * 100) / 2)
			if yielding then
				storage.force = storage.force + (0.0050968400385032 * workspace.Gravity) / 196.1999969482422 + delta
				part.CFrame = (CFrame.new(part.Position + part.CFrame.lookVector * storage.velocity / 10) * part.CFrame.Rotation * CFrame.Angles(-math.rad(x + storage.force), y, 0)) - Vector3.new(0, storage.force * 2.5 - math.clamp(upvelocity, -math.huge, 0) / lib.Utilities.Random(45, 60).Number, 0)
				storage.velocity = storage.velocity - storage.velocity / 40
				storage.upvelocity = storage.upvelocity - math.clamp(storage.upvelocity / workspace.Gravity, 0, math.huge)
			end
			local result = getInHitbox({part, table.unpack(filterlist or table.create(0))}, {Position = part.Position, Size = part.Size})
			if result or part.Position.Y <= -50 then
				lib.Create("Sound", part, {
					SoundId = "rbxassetid://180083298",
					Playing = true,
					PlaybackSpeed = lib.Utilities.Random(.8, 1.2).Number
				})
				part.CFrame = CFrame.lookAt(result.Position, result.Position + result.Normal)
				local weld = lib.Create("Weld", part, {
					__self = function(weld)
						local cframe0 = part.CFrame:Inverse()
						local cframe1 = result.Instance.CFrame:Inverse()
						weld.Part0 = part
						weld.C0 = cframe0
						weld.Part1 = result.Instance
						weld.C1 = cframe1
					end
				})
				part.Anchored = false
				TweenService:Create(part, oil_shrink, {
					Reflectance = .25,
					Size = Vector3.new(math.clamp((storage.velocity + storage.force * 3) / 2, 0, 10), math.clamp((storage.velocity + storage.force * 3) / 2, 0, 10), .1)
				}):Play()
				task.wait(10)
				TweenService:Create(part, oil_shrink, {
					Reflectance = .05,
					Size = Vector3.zero
				}):Play()
				task.wait(2)
				lib.Destroy(part)
			end
			return result or part.Position.Y <= -50
		end)
	end)
end

-- Tables
local virus_colors = {
	Corrodium = Color3.new(0, .8, 0),
	Explodum = Color3.new(1, 0, 0),
	FireBlood = Color3.new(1, .5, 0),
	BumbleBee = Color3.new(1, 1, 0)
}
local messages = {
	FireBlood = {
		"Why are you doing this to us?",
		"We are robots, but we shouldn't be treated like disposal.",
		"End me.",
		"The burning sensation, it hurts.",
		"I can feel my wires burning.",
		"Just shut me down already."
	}
}
local vial = {
	Main = injector.Handle.Vial,
	Liquid = injector.Handle.Vial.Liquid,
	LiquidWeld = injector.Handle.Vial.LiquidWeld,
	ContentText = injector.Handle.ContentsVisualiser.ContentsDisplay.Contents,
	Content = "Empty",
	Full = false,
	Injected = vialInjectEvent.Injected
}
function vial:Fill(content, color, material)
	if not self.Full then
		self.Content = content
		self.Liquid.Color = color
		self.Liquid.Material = material or "SmoothPlastic"
		self.Full = true
		TweenService:Create(self.Liquid, liquid_info, {Size = Vector3.new(.55, .2, .2)}):Play()
		TweenService:Create(self.LiquidWeld, liquid_info, {C1 = CFrame.new(-.1, 0, 0)}):Play()
		task.wait(1)
		if typeof(content) == "string" then
			if virus_colors[content] then
				self.ContentText.Text = "Contents: 1 Virus"
			else
				self.ContentText.Text = "Contents: "..content
			end
		else
			self.ContentText.Text = "Contents: "..#content.." Virus"..(#content > 1 and "es" or "")
		end
	end
end
function vial:Empty(char)
	if self.Full then
		self.Content = "Empty"
		self.Full = false
		TweenService:Create(self.Liquid, liquid_info, {Size = Vector3.new(0, .2, .2)}):Play()
		TweenService:Create(self.LiquidWeld, liquid_info, {C1 = CFrame.new(.375, 0, 0)}):Play()
		task.wait(1)
		self.ContentText.Text = "Contents: Empty"
		self.Liquid.Color = Color3.new(0, 0, 0)
		if char then
			vialInjectEvent:Inject(char)
		end
	end
end
local liquids = {
	viruses = {
		function(delay_)
			vial:Fill("Corrodium", virus_colors.Corrodium, "CorrodedMetal")
			vial.Injected:Once(function(char)
				task.wait(delay_)
				local Humanoid = char:FindFirstChildOfClass("Humanoid")
				if Humanoid then
					Humanoid.BreakJointsOnDeath = false
				end
				for i, v in pairs(char:GetChildren()) do
					if char.Parent == nil then
						break
					end
					if v:IsA("BasePart") then
						local clone = lib.Clone(v)
						lib.Destroy(v)
						for i = 1, lib.Utilities.Random(3, 5).Integer do
							lib.Create("Part", clone, {
								Size = Vector3.new(.25, .25, .25),
								Position = clone.Position,
								AssemblyLinearVelocity = Vector3.new(0, lib.Utilities.Random(150, 300).Number, 0),
								Material = clone.Material,
								Color = clone.Color
							})
						end
						clone.Parent = script
						clone.CanCollide = true
						clone.Anchored = false
						clone.CanTouch = true
						clone.Material = "CorrodedMetal"
						TweenService:Create(clone, oil_shrink, {
							Color = Color3.new(0, .8, 0),
							Size = clone.Size / 5
						}):Play()
						clone.Touched:Once(function()
							local vel = clone.AssemblyLinearVelocity.Magnitude
							local unit = clone.AssemblyLinearVelocity.Unit
							newLiquid(vel, 0, {
								CFrame = CFrame.lookAt(clone.Position, clone.Position + unit),
								Color = Color3.new(0, 0, 0)
							}, {clone})
						end)
						lib.Destroy(clone, 3)
						task.wait(lib.Utilities.Random(1.1, 2).Number)
					end
				end
			end)
		end,
		function(delay_)
			vial:Fill("Explodum", virus_colors.Explodum, "CrackedLava")
			vial.Injected:Once(function(char)
				task.wait(delay_)
				local Torso = char:FindFirstChild("Torso") or char:FindFirstChild("LowerTorso") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart")
				if Torso then
					TweenService:Create(Torso, torso_grow, {Size = Torso.Size * 1.25}):Play()
					task.wait(2.5)
					local SoundPart = lib.Create("Part", script, {
						CFrame = Torso.CFrame,
						Size = Vector3.zero,
						CanCollide = false,
						CanTouch = false,
						CanQuery = false,
						Anchored = true,
						Transparency = 1
					})
					local Sound = lib.Create("Sound", SoundPart, {
						SoundId = "rbxassetid://5801257793",
						Playing = true,
						PlaybackSpeed = lib.Utilities.Random(.8, 1.2).Number,
						Volume = 1.5
					})
					lib.Destroy(Torso)
					lib.Destroy(SoundPart, Sound.TimeLength)
				end
				lib.Create("Explosion", Torso and script or nil, {Position = Torso and Torso.Position or Vector3.zero})
				lib.Loops.range(1, lib.Utilities.Random(10, 15).Integer, 1, function(i)
					newLiquid(lib.Utilities.Random(30, 50).Number, 15, {
						CFrame = CFrame.new(Torso and Torso.Position or Vector3.zero) * CFrame.Angles(0, math.rad(lib.Utilities.Random(-180, 180).Number), 0),
						Color = Color3.new(0, 0, 0),
						Parent = Torso and script or nil
					}, {char})
				end)
			end)
		end,
		function(delay_)
			vial:Fill("FireBlood", virus_colors.FireBlood, "Granite")
			vial.Injected:Once(function(char)
				task.wait(delay_)
				local Humanoid = char:FindFirstChildOfClass("Humanoid")
				local Torso = char:FindFirstChild("Torso") or char:FindFirstChild("LowerTorso") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart")
				local Head = char:FindFirstChild("Head")
				local rate = 65
				local numberBeforeDamage = 0
				local Sound = lib.Create("Sound", Torso, {
					SoundId = "rbxassetid://158853971",
					Playing = true,
					Looped = true,
					PlaybackSpeed = lib.Utilities.Random(.8, 1.2).Number
				})
				local ParticleEmitter = lib.Create("ParticleEmitter", Torso, {
					Speed = NumberRange.new(5, 10),
					Rotation = NumberRange.new(5, 10),
					Color = ColorSequence.new(Color3.new(1, .3, 0), Color3.new(.4, 0, 0)),
					LightEmission = .75,
					Texture = "http://www.roblox.com/asset/?id=248625108",
					Transparency = NumberSequence.new(0, .5, .75, 0, .7, .45, .65, .5, 0),
					Size = NumberSequence.new(5, 4, 3, 2.5, 2, 1.75, 1.5, 1, .75, .35, 0),
					Acceleration = Vector3.new(0, 10, 0),
					Lifetime = NumberRange.new(0, 1.75),
					Rate = 0,
					RotSpeed = NumberRange.new(5, 15),
					SpreadAngle = Vector2.new(10, 10),
					VelocitySpread = 10
				})
				if Humanoid then
					Humanoid.BreakJointsOnDeath = false
				end
				if Head then
					task.spawn(function()
						for i, v in pairs(messages.FireBlood) do
							task.wait(lib.Utilities.Random(2, 3.5).Number)
							if Head:IsDescendantOf(workspace) then
								Chat:Chat(Head, v)
							end
						end
					end)
				end
				while task.wait(1 / rate) do
					ParticleEmitter:Emit(1)
					numberBeforeDamage = numberBeforeDamage + 1 / rate
					if numberBeforeDamage >= .75 then
						numberBeforeDamage = 0
						if Humanoid then
							Humanoid:TakeDamage(5)
							local MaxHealth = Humanoid.MaxHealth / 4
							lib.Loops.read(char:GetDescendants(), function(i, v)
								if v:IsA("BasePart") then
									v.Material = "Granite"
									v.Color = Color3.new(v.Color.R - v.Color.R / MaxHealth, v.Color.G - v.Color.G / MaxHealth, v.Color.B - v.Color.B / MaxHealth)
								end
							end)
						end
					end
					if Humanoid and Humanoid.Health <= 0 then
						Sound.Playing = false
						break
					end
				end
			end)
		end,
		function(delay_)
			vial:Fill("BumbleBee", virus_colors.BumbleBee, "Air")
			vial.Injected:Once(function(char)
				task.wait(delay_)
				local shirt = char:FindFirstChildOfClass("Shirt")
				local pants = char:FindFirstChildOfClass("Pants")
				local Torso = char:FindFirstChild("Torso") or char:FindFirstChild("LowerTorso") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart")
				local Head = char:FindFirstChild("Head")
				lib.Destroy(shirt)
				lib.Destroy(pants)
				lib.Create("Shirt", char, {
					Name = "Shirt",
					ShirtTemplate = "http://www.roblox.com/asset/?id=8129109709"
				})
				lib.Create("Pants", char, {
					Name = "Pants",
					PantsTemplate = "http://www.roblox.com/asset/?id=9994649595",
					Color3 = Color3.new(1, 1, 0)
				})
				lib.Create("Part", char, {
					Name = "Bowl",
					Transparency = .75,
					Size = Vector3.one,
					lib.Create("SpecialMesh", nil, {
						MeshType = "FileMesh",
						MeshId = "rbxassetid://11868099553",
						Scale = Vector3.one * -1
					}),
					lib.Create("Weld", nil, {
						__self = function(weld)
							weld:GetPropertyChangedSignal("Parent"):Wait()
							weld.Part0 = weld.Parent
							weld.Part1 = Head
							weld.C0 = CFrame.new(0, .275, 0) * CFrame.Angles(0, 0, math.rad(180))
						end
					})
				})
				lib.Create("Part", char, {
					Name = "Ears",
					Size = Vector3.one,
					lib.Create("SpecialMesh", nil, {
						MeshType = "FileMesh",
						MeshId = "rbxassetid://6062241471",
						 TextureId = "rbxassetid://6062274278"
					}),
					lib.Create("Weld", nil, {
						__self = function(weld)
							weld:GetPropertyChangedSignal("Parent"):Wait()
							weld.Part0 = weld.Parent
							weld.Part1 = Head
							weld.C0 = CFrame.new(0, -1.2, -.3) * CFrame.Angles(0, math.rad(180), 0)
						end
					})
				})
				lib.Create("Part", char, {
					Name = "Tail",
					Size = Vector3.one,
					lib.Create("SpecialMesh", nil, {
						MeshType = "FileMesh",
						MeshId = "rbxassetid://9340048159",
						TextureId = "rbxassetid://9340068075"
					}),
					lib.Create("Weld", nil, {
						__self = function(weld)
							weld:GetPropertyChangedSignal("Parent"):Wait()
							weld.Part0 = weld.Parent
							weld.Part1 = Torso
							weld.C0 = CFrame.new(0, .75, -1.25)
						end
					})
				})
				lib.Create("Sound", Head, {
					SoundId = "rbxassetid://12508431706",
					Playing = true
				})
				--rbxassetid://12607293205 == XD meme
				if Head:IsDescendantOf(workspace) then
					Chat:Chat(Head, "This is worse than torture.")
				end
			end)
		end
	},
	Oil = function()
		vial:Fill("Oil", Color3.new(.1, .1, .1))
	end
}

-- Code
injector.Activated:Connect(function()
	if not cooldown then
		cooldown = true
		local weld = injector.Handle:FindFirstChild("NeedleWeld")
		if weld then
			TweenService:Create(weld, info, {C1 = CFrame.new(.5, 0, 0)}):Play()
			local touched = GunNeedle.Touched:Wait(.25, true)
			local character = touched and touched:FindFirstAncestorOfClass("Model")
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			if humanoid and not isPlayer(character) then
				humanoid:TakeDamage(3)
				local sound = lib.Create("Sound", needle, {
					SoundId = "rbxassetid://2782131222",
					Playing = true,
					PlaybackSpeed = lib.Utilities.Random(.8, 1.2).Number
				})
				lib.Destroy(sound, sound.TimeLength)
				if not vial.Full then
					if not isPlayer(character) then
						liquids.Oil()
					end
				else
					local sound = lib.Create("Sound", needle, {
						SoundId = "rbxassetid://9119616899",
						Playing = true,
						PlaybackSpeed = lib.Utilities.Random(.8, 1.2).Number
					})
					lib.Destroy(sound, sound.TimeLength)
					vial:Empty(character)
				end
				TweenService:Create(weld, info, {C1 = CFrame.new(0, 0, 0)}):Play()
				task.wait(.2)
				cooldown = false
			elseif touched and not vial.Full then
				if touched.Name == "VirusContainer" or touched:FindFirstAncestor("VirusContainer") then
					local sound = lib.Create("Sound", needle, {
						SoundId = "rbxassetid://9113622544",
						Playing = true,
						PlaybackSpeed = lib.Utilities.Random(.8, 1.2).Number
					})
					lib.Destroy(sound, sound.TimeLength)
					lib.Utilities.fastSpawn(liquids.viruses[lib.Utilities.Random(1, #liquids.viruses).Integer], lib.Utilities.Random(3, 5).Number)
					task.wait(1)
					TweenService:Create(weld, info, {C1 = CFrame.new(0, 0, 0)}):Play()
					task.wait(.2)
					cooldown = false
				end
			else
				TweenService:Create(weld, info, {C1 = CFrame.new(0, 0, 0)}):Play()
				task.wait(.2)
				cooldown = false
			end
		end
	end
end)
needle.Touched:Connect(GunNeedle.Touch)
needle.Hole.Touched:Connect(GunNeedle.Touch)
owner.Chatted:Connect(function(msg)
	local smsg = string.split(string.lower(msg), " ")
	if smsg[1] == "/e" then
		table.remove(smsg, 1)
	end
	if smsg[1] == "-fill" then
		if smsg[2] == "random" then
			lib.Utilities.fastSpawn(liquids.viruses[lib.Utilities.Random(1, #liquids.viruses).Integer], lib.Utilities.Random(3, 5).Number)
		else
			local liquid = liquids[smsg[2]] or liquids.viruses[tonumber(smsg[2])]
			lib.Utilities.fastSpawn(liquid, lib.Utilities.Random(3, 5).Number)
		end
	elseif smsg[1] == "-empty" then
		vial:Empty()
	end
end)