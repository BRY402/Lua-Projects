local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local frames = 60
local fpsgap = 1 / frames
local time = os.clock()
local window = lib.Create("Part", script, {
	Name = "Screen",
	Anchored = true,
	Size = Vector3.new(5,5,0),
	Material = "SmoothPlastic",
	CanCollide = false,
	Color = Color3.new(0,0,0),
	CFrame = owner.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
})
local gui = lib.Create("SurfaceGui", window, {
	Name = "Gui",
	Adornee = window
})
local X, Y = gui.AbsoluteSize.X, gui.AbsoluteSize.Y
local Objects = {}
local obj = {
	new = function()
		gui.Parent = owner
		local newgui = lib.Create("Frame", gui, {
			Size = UDim2.new(0, 100, 0, 75),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0)
		})
		newgui:SetAttribute("Velocity", UDim2.new(0, 0, 0, 0))
		newgui:SetAttribute("Anchored", false)
		newgui:SetAttribute("CanCollide", true)
		table.insert(Objects, newgui)
		gui.Parent = window
		return newgui
	end
}
local Physics = {Gravity = 1}
function Physics:IsColliding()

end
function Physics:Update()
	local newtime = os.clock()
	local took = newtime - time
	time = newtime
	for i, gui in pairs(Objects) do
		local velocity = gui:GetAttribute("Velocity")
		local x, y, sizeX, sizeY = gui.Position.X, gui.Position.Y, gui.Size.X, gui.Size.Y
		local inbounds1, inbounds2, inbounds3, inbounds4 = y.Offset < Y - (sizeY.Offset + velocity.Y.Offset), y.Offset >= -velocity.Y.Offset, x.Offset < X - (sizeX.Offset + velocity.X.Offset), x.Offset >= -velocity.X.Offset
		if inbounds1 and inbounds2 then
			gui:SetAttribute("Velocity", velocity + UDim2.new(0, 0, 0, Physics.Gravity))
		else
			local velocity = gui:GetAttribute("Velocity")
			local y = velocity.Y
			gui:SetAttribute("Velocity", UDim2.new(0, velocity.X.Offset, 0, -y.Offset / 2))
		end
		if inbounds3 and inbounds4 then
			local velocity = gui:GetAttribute("Velocity")
			local x = velocity.X
			local x = x.Offset == 0 and 0 or x.Offset < 0 and 1 or x.Offset > 0 and -1
			gui:SetAttribute("Velocity", velocity + UDim2.new(0, x / 2, 0, 0))
		else
			local velocity = gui:GetAttribute("Velocity")
			local x = velocity.X
			local y = velocity.Y
			local x = x.Offset == 0 and 0 or x.Offset < 0 and x.Offset + 2.5 or x.Offset > 0 and x.Offset - 2.5
			gui:SetAttribute("Velocity", UDim2.new(0, -x, 0, y.Offset))
		end
		gui.Position = gui.Position + gui:GetAttribute("Velocity")
		if i % 10 == 0 then
			task.wait()
		end
	end
	return took
end
local block = obj.new()
block:SetAttribute("Velocity", UDim2.new(0, 1000, 0, 0))
while true do
	task.wait()
	Physics:Update()
end