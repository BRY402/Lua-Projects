local http = game:GetService("HttpService")
local run = game:GetService("RunService")
local lib = loadstring(http:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local frames = 60
local fpsgap = 1 / frames
local time = os.clock()
local p = lib.Create("Part",script,{Name = "Screen",
Anchored = true,
Size = Vector3.new(5,5,0),
Material = "SmoothPlastic",
CanCollide = false,
Color = Color3.new(0,0,0),
CFrame = owner.Character.HumanoidRootPart.CFrame})
local gui = lib.Create("SurfaceGui",p,{Name = "Gui",
Adornee = p})
local X,Y = gui.AbsoluteSize.X,gui.AbsoluteSize.Y
local Objects = {}
local Obj = {new = function()
	gui.Parent = owner
	local newgui = lib.Create("Frame",gui,{Size = UDim2.new(0,100,0,75),
	BorderSizePixel = 0,
	Position = UDim2.new(0,0,0,0)})
	newgui:SetAttribute("Velocity",UDim2.new(0,0,0,0))
	newgui:SetAttribute("Anchored",false)
	newgui:SetAttribute("CanCollide",true)
	table.insert(Objects,newgui)
	gui.Parent = p
	return newgui
end}
local Physics = {Gravity = 1}
function Physics:Update()
	local newtime = os.clock()
	local lag = newtime - time
	time = newtime
	table.foreach(Objects,function(i,cgui)
		local cx,cy,six,siy = cgui.Position.X,cgui.Position.Y,cgui.Size.X,cgui.Size.Y
		local inbounds1,inbounds2,inbounds3,inbounds4 = cy.Offset < Y - siy.Offset,cy.Offset > -Y + siy.Offset,true,true
		if inbounds1 and inbounds2 and inbounds3 and inbounds4 then
			cgui:SetAttribute("Velocity",cgui:GetAttribute("Velocity") + UDim2.new(0,0,0,-Physics.Gravity))
			cgui.Position = cgui.Position + cgui:GetAttribute("Velocity")
		else
			local vel = cgui:GetAttribute("Velocity").Y
			cgui:SetAttribute("Velocity",UDim2.new(0,0,0,0))
		end
	end)
end
Obj.new()
while task.wait() do
	Physics:Update()
end