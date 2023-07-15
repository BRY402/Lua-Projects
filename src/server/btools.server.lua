-- note for future self: i could've done this all in the same instance.new but it wouldnt be as readable
local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua", true))()
local tool = lib.Create("Tool", owner.Backpack, {
	Name = "Building Tools", 
	ToolTip = "A tool for building", 
	lib.Create("Part", nil, {
		Name = "Handle", 
		Material = "SmoothPlastic", 
		Size = Vector3.new(1, 1, 1)
	})
})
local remote = lib.Create("RemoteFunction", owner.PlayerGui, {
	Name = "SyncRemote_"..HttpService:GenerateGUID()
})
remote.OnServerInvoke = function(Player, Data)
	if Player == owner then
		local DataType = Data.SyncType
		if DataType == "GetAnchored" then
			return Data.Part.Anchored
		elseif DataType == "SyncLoaded" then
			return tool
		elseif DataType == "SyncMove" then
			Data.Target.CFrame = Data.CFrame
		elseif DataType == "SyncResize" then
			Data.Target.Size = Data.Size
			Data.Target.CFrame = Data.CFrame
		elseif DataType == "SyncRotate" then
			Data.Target.CFrame = Data.CFrame
		end
	end
end
NLS([==[-- credits to wapplee for some of these functions
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local mouse = owner:GetMouse()
local remote = script.Parent:FindFirstChild("]==]..remote.Name..[==[")
local tool = remote:InvokeServer({SyncType = "SyncLoaded"})
local Increments = {Rotate = 90, 
	Move = 1, 
	Resize = 1
	}
local Storage = {Mode = "Move", 
	Target = nil, 
	CFrame = CFrame.identity, 
	Size = Vector3.zero, 
	Anchored = false, 
	Saved = {CFrame = CFrame.identity, 
		Size = Vector3.zero}
	}
local function roundBy(Rounded, Amount)
	return math.round(Rounded / Amount) * Amount
end
local function absVector(Vector)
	return Vector3.new(math.abs(Vector.X), math.abs(Vector.Y), math.abs(Vector.Z))
end
local function downEvent()
	Storage.Anchored = Storage.Target.Anchored
	Storage.Target.Anchored = true
	if Storage.Mode == "Move" or Storage.Mode == "Rotate" then
		Storage.Saved.CFrame = Storage.Target.CFrame
	elseif Storage.Mode == "Resize" then
		Storage.Saved.CFrame = Storage.Target.CFrame
		Storage.Saved.Size = Storage.Target.Size
	end
end
local function dragEvent(Face, Dist)
	if Storage.Mode == "Move" then
		local NormalId = Vector3.fromNormalId(Face)
		local Dist = roundBy(Dist, Increments.Move)
		Storage.CFrame = CFrame.new(NormalId * Dist)
		Storage.Target.CFrame = Storage.Saved.CFrame * Storage.CFrame
	elseif Storage.Mode == "Resize" then
		local NormalId = Vector3.fromNormalId(Face)
		local Dist = roundBy(Dist, Increments.Resize)
		Storage.Size = absVector(NormalId) * Dist
		Storage.CFrame = CFrame.new((NormalId * Dist) / 2)
		Storage.Target.Size = Storage.Saved.Size + Storage.Size
		Storage.Target.CFrame = Storage.Saved.CFrame * Storage.CFrame
	elseif Storage.Mode == "Rotate" then
		local Dist = math.deg(Dist)
		local Angle
		local AngleAxis = math.rad(roundBy(Dist, Increments.Rotate))
		if Face == Enum.Axis.X then
			Angle = CFrame.Angles(AngleAxis, 0, 0)
		elseif Face == Enum.Axis.Y then
			Angle = CFrame.Angles(0, AngleAxis, 0)
		elseif Face == Enum.Axis.Z then
			Angle = CFrame.Angles(0, 0, AngleAxis)
		end
		Storage.CFrame = Angle
		Storage.Target.CFrame = Storage.Saved.CFrame * Storage.CFrame
	end
end
local function sync()
	if Storage.Mode == "Move" then
		remote:InvokeServer({SyncType = "SyncMove", 
			Target = Storage.Target, 
			CFrame = Storage.Saved.CFrame * Storage.CFrame})
	elseif Storage.Mode == "Resize" then
		remote:InvokeServer({SyncType = "SyncResize", 
			Target = Storage.Target, 
			CFrame = Storage.Saved.CFrame * Storage.CFrame, 
			Size = Storage.Saved.Size + Storage.Size})
	elseif Storage.Mode == "Rotate" then
		remote:InvokeServer({SyncType = "SyncRotate", 
			Target = Storage.Target, 
			CFrame = Storage.Saved.CFrame * Storage.CFrame})
	end
end
local function upEvent()
	Storage.Target.Anchored = remote:InvokeServer({SyncType = "GetAnchored", Part = Storage.Target})
	sync()
end
local guis = Instance.new("Folder", nil)
local handles = Instance.new("Handles", guis)
local archandles = Instance.new("ArcHandles", guis)
local selection = Instance.new("SelectionBox", guis)
guis.Name = "HandleGuis"
handles.MouseButton1Down:Connect(downEvent)
handles.MouseButton1Up:Connect(upEvent)
handles.MouseDrag:Connect(dragEvent)
handles.Color3 = Color3.new(1, 1, 0)
archandles.MouseButton1Down:Connect(downEvent)
archandles.MouseButton1Up:Connect(upEvent)
archandles.MouseDrag:Connect(dragEvent)
selection.LineThickness = .01
selection.Color3 = handles.Color3
local function changeMode(mode)
	Storage.Mode = mode
	if mode == "Move" then
		archandles.Adornee = nil
		handles.Color3 = Color3.new(1, 1, 0)
		handles.Adornee = Storage.Target
		selection.Color3 = handles.Color3
	elseif mode == "Resize" then
		archandles.Adornee = nil
		handles.Color3 = Color3.new(0, 1, 1)
		handles.Adornee = Storage.Target
		selection.Color3 = handles.Color3
	elseif mode == "Rotate" then
		handles.Adornee = nil
		archandles.Adornee = Storage.Target
		selection.Color3 = Color3.new(0, 1, 0)
	end
end
mouse.Move:Connect(function()
	if not Storage.Target then
		local target = mouse.Target
		selection.Adornee = target
	end
end)
mouse.Button1Down:Connect(function()
	if guis.Parent == script then
		local target = mouse.Target
		if target then
			Storage.Target = target
			selection.Adornee = Storage.Target
		else
			selection.Adornee = nil
		end
		if Storage.Mode == "Move" or Storage.Mode == "Resize" then
			handles.Adornee = selection.Adornee
			archandles.Adornee = nil
		elseif Storage.Mode == "Rotate" then
			archandles.Adornee = selection.Adornee
			handles.Adornee = nil
		end
	end
end)
UserInputService.InputBegan:Connect(function(Key, Processed)
	if not Processed then
		if Key.KeyCode == Enum.KeyCode.Z then
			changeMode("Move")
		elseif Key.KeyCode == Enum.KeyCode.X then
			changeMode("Resize")
		elseif Key.KeyCode == Enum.KeyCode.C then
			changeMode("Rotate")
		end
	end
end)
tool.Equipped:Connect(function()
	guis.Parent = script
end)
tool.Unequipped:Connect(function()
	guis.Parent = nil
end)]==], owner.PlayerGui)