local prefix = "-"
local punished = {}
local d = game:GetService("Debris")
local plrs = game:GetService("Players")
local function getplr(name)
	for i,v in pairs(plrs:GetPlayers()) do
		if string.lower(string.sub(v.Name,0,#name)) == name then
			return v
		end
	end
end
owner.Chatted:Connect(function(msg)
	local msg = string.lower(msg)
	local smsg = string.split(msg," ")
	if smsg[1] == "/e" then
		table.remove(smsg,1)
	end
	if smsg[1] == prefix.."prefix" then
		prefix = smsg[2]
		print("Changed prefix to: "..prefix)
	elseif smsg[1] == prefix.."kill " then
		local plr = getplr(smsg[2])
		if plr.Character then
			for i,v in pairs(plr.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					d:AddItem(v,0)
				end
			end
		end
	elseif smsg[1] == prefix.."0g" then
		local plr = getplr(smsg[2])
		if plr.Character then
			for i,v in pairs(plr.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					local vf = Instance.new("VectorForce",v)
					local at = Instance.new("Attachment",v)
					vf.Name = "NogravityForce"
					vf.Attachment0 = at
					vf.RelativeTo = Enum.ActuatorRelativeTo.World
					vf.ApplyAtCenterOfMass = true
					vf.Force = Vector3.new(0,workspace.Gravity * v:GetMass() + v:GetMass(),0)
				elseif v:IsA("Humanoid") then
					v.PlatformStand = true
				end
			end
		end
	elseif smsg[1] == prefix.."g" then
		local plr = getplr(smsg[2])
		if plr.Character then
			for i,v in pairs(plr.Character:GetDescendants()) do
				if v:IsA("VectorForce") and v.Name == "NogravityForce" then
				d:AddItem(v,0)
				elseif v:IsA("Humanoid") then
					v.PlatformStand = false
				end
			end
		end
	elseif smsg[1] == prefix.."punish" then
		local plr = getplr(smsg[2])
		table.insert(punished,plr.Name)
	elseif smsg[1] == prefix.."unpunish" then
		local plr = getplr(smsg[2])
		table.remove(punished,table.find(punished,plr.Name))
	end
end)
while task.wait() do
	for i,v in pairs(punished) do
		local plr = plrs:FindFirstChild(v)
		if plr then
			plr.Character = nil
		end
	end
end