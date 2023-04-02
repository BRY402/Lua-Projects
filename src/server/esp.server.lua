-- esp
NLS([==[-- Variables --
local gui = Instance.new("BillboardGui",script)
local esp = Instance.new("TextLabel",gui)
local color = Color3.fromRGB(255,0,0)
local textsize = 12
local deb = game:GetService("Debris")
local players = game:GetService("Players")
-- Properties --
gui.Name = "esp"
gui.ResetOnSpawn = false
gui.AlwaysOnTop = true
gui.LightInfluence = 0
gui.ExtentsOffset = Vector3.new(0,3,0)
gui.Size = UDim2.new(1.75, 0, 1.75, 0)
esp.Name = "Esp"
esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
esp.Text = ""
esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001)
esp.BorderColor3 = Color3.fromRGB(255,0,0)
esp.BorderSizePixel = 0
--esp.Font = "GothamSemibold"
esp.TextSize = textsize
esp.TextColor3 = color
-- Script --
for i,v in pairs (players:GetPlayers()) do
        if v ~= owner and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChildOfClass("Humanoid") then
		local guic = gui:Clone()
		local hl = Instance.new("Highlight",script)
		guic.Parent = script
		guic.Adornee = v.Character:FindFirstChild("Head")
		hl.Adornee = v.Character
		hl.OutlineColor = Color3.fromHSV(0,0,0)
		hl.FillTransparency = 0
		local hum = v.Character:FindFirstChildOfClass("Humanoid")
		guic.Esp.Text = v.Name.."\nHealth: "..hum.Health.."\nDisplayName: "..hum.DisplayName
		v.CharacterAdded:Connect(function()
		task.wait()
			local guic = gui:Clone()
			local hl = Instance.new("Highlight",script)
			guic.Parent = script
			guic.Adornee = v.Character:FindFirstChild("Head")
			hl.Adornee = v.Character
			hl.OutlineColor = Color3.fromHSV(0,0,0)
			hl.FillTransparency = 0
			local hum = v.Character:FindFirstChildOfClass("Humanoid")
			if hum then
				guic.Esp.Text = v.Name.."\nHealth: "..hum.Health.."\nDisplayName: "..hum.DisplayName
			end
		end)
	end
end
players.PlayerAdded:Connect(function(plr)
	local guic = gui:Clone()
	local hl = Instance.new("Highlight",script)
	guic.Parent = script
	guic.Adornee = v.Character:FindFirstChild("Head")
	hl.Adornee = v.Character
	hl.OutlineColor = Color3.fromHSV(0,0,0)
	hl.FillTransparency = 0
	v.Character:FindFirstChild("Head")
	local hum = plr.Character:FindFirstChildOfClass("Humanoid")
	guic.Esp.Text = v.Name.."\nHealth: "..hum.Health.."\nDisplayName: "..hum.DisplayName
	plr.CharacterAdded:Connect(function()
		local guic = gui:Clone()
		local hl = Instance.new("Highlight",script)
		guic.Parent = script
		guic.Adornee = plr.Character:FindFirstChild("Head")
		hl.Adornee = v.Character
		hl.OutlineColor = Color3.fromHSV(0,0,0)
		hl.FillTransparency = 0
		local hum = plr.Character:FindFirstChildOfClass("Humanoid")
		guic.Esp.Text = v.Name.."\nHealth: "..hum.Health.."\nDisplayName: "..hum.DisplayName
	end)
end)
]==],owner.PlayerGui)