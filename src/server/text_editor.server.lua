local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"), "lib")()
local function newwin(size, pos)
	local cf = ((owner.Character:FindFirstChild("HumanoidRootPart") or workspace.Terrain).CFrame * CFrame.Angles(0, math.rad(180), 0)) * CFrame.new(pos)
	local win = lib.Create("Part", script, {
		Name = "Window_"..HttpService:GenerateGUID(false),
		Material = "Air",
		Size = size,
		CanCollide = false,
		Anchored = true,
		Massless = true,
		CanTouch = false,
		Color = Color3.new(0, 0, 0),
		CFrame = cf
	})
	local surfg = lib.Create("SurfaceGui", win, {
		Name = "OutputGui",
		Adornee = win
	})
	local maing = lib.Create("ScrollingFrame", surfg, {
		Name = "MainScroll",
		Size = UDim2.new(1,0,.95,0),
		CanvasSize = UDim2.new(0,0,0,0),
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 6,
		lib.Create("Folder", nil, {
			Name = "Logs",
			lib.Create("UIListLayout", nil)
		})
	})
	local input = lib.Create("Part", script, {
		Name = "Window_"..HttpService:GenerateGUID(false),
		Material = "Air",
		Size = size * 3,
		CanCollide = false,
		Anchored = true,
		Massless = true,
		CanTouch = false,
		Color = Color3.new(0, 0, 0),
		CFrame = cf * CFrame.new(size.X * 3, size.Y / 2, 0)
	})
	local inputsurface = lib.Create("SurfaceGui", input, {
		Name = "InputGui",
		Adornee = input
	})
	local inputmain = lib.Create("ScrollingFrame", inputsurface, {
		Name = "MainScroll",
		Size = UDim2.new(1,0,.95,0),
		CanvasSize = UDim2.new(0,0,0,0),
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 6,
	})
	local textbox = lib.Create("TextLabel", inputmain, {
		Name = "InputText",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		TextXAlignment = "Left",
		TextYAlignment = "Top",
		AutomaticSize = "XY",
		Font = "Code",
		Text = "Code here",
		TextWrapped = false,
		RichText = true,
		TextSize = 25,
		TextColor3 = Color3.new(1, 1, 1)
	})
	return win, surfg, maing, cmdbar, input, inputsurface, inputmain, textbox
end
local win, surfg, maing, cmdbar, input, inputgui, inputscroll, inputtext = newwin(Vector3.new(8, 6, 0), Vector3.new(0, 0, 4))
local function getText(textbox)
	local split_text = string.split(textbox.Text, " ")
	if split_text[2] == "-" then
		table.remove(split_text, 1)
	end
	local counted = tonumber(string.match(split_text[#split_text], "%d+"))
	if counted then
		table.remove(split_text, #split_text)
	end
	return table.concat(split_text, " "), counted
end
local function outputmsg(msg: string,color: Color3)
	if win.Parent ~= nil then
		local storage = {isSame = false}
		local children = maing.Logs:GetChildren()
		if #children > 40 then
			lib.Destroy(maing.Logs:FindFirstChildOfClass("TextBox"))
		end
		local textbox = lib.Create("TextBox", nil, {
			Name = "OutputText",
			Size = UDim2.new(1,0,.05,0),
			BackgroundTransparency = 1,
			TextXAlignment = "Left",
			AutomaticSize = "XY",
			Font = "Code",
			Text = tostring(msg),
			TextWrapped = false,
			Active = false,
			ClearTextOnFocus = false,
			TextEditable = false,
			RichText = true,
			TextSize = 15,
			TextColor3 = color
		})
		local current_textbox = children[#children]
		storage.isSame = current_textbox and current_textbox:IsA("TextBox") and current_textbox.TextColor3 == textbox.TextColor3
		if storage.isSame then
			if storage.isSame then
				local text = getText(textbox)
				local current_text, counted = getText(current_textbox)
				storage.isSame = text == current_text
				if storage.isSame then
					current_textbox.Text = textbox.Text.." (x"..((counted or 1) + 1)..")"
					return current_textbox
				end
			end
		end
		if not storage.isSame then
			textbox.Parent = maing.Logs
		end
		return textbox
	end
end
local output = {
	print = function(...)
		local args = {}
		lib.Loops.read(lib.Utilities.Pack(...), function(i, v)
			table.insert(args, tostring(v))
		end)
		outputmsg("> "..table.concat(args," "), Color3.new(1, 1, 1))
	end,
	warn = function(...)
		local args = {}
		lib.Loops.read(lib.Utilities.Pack(...), function(i, v)
			table.insert(args, tostring(v))
		end)
		outputmsg(os.date("%X").. " - "..table.concat(args," "), Color3.new(1, .5, 0))
	end,
	error = function(f)
		outputmsg(os.date("%X").. " - "..f, Color3.new(1, 0, 0))
	end,
	Internal = {tostring = tostring}
}
function output.Internal:tabletostr(table_, name, main_table)
	local tostring = self.tostring
	if main_table then
		self.main_table = main_table
	else
		self.main_table = table_
	end
	local storage = {
		repeats = 0,
		result = ""
	}
	storage.name = "["..tostring(name).."]"
	storage.result = storage.name.." = {"
	lib.Loops.read(table_, function(i, v)
		local i = tonumber(i) and i or '"'..i..'"'
		if typeof(v) == "table" then
			if v == self.main_table then
				storage.result = storage.result.."\n  {CYCLIC},"
			else
				local new_str = self:tabletostr(v, i, self.main_table):gsub("\n", "\n  ")
				storage.result = storage.result.."\n  "..new_str..","
			end
		elseif typeof(v) == "Instance" then
			storage.result = storage.result.."\n  ["..i.."] = "..v:GetFullName()..","
		elseif typeof(v) == "string" then
			local back = string.find(v, "\n") and "[==[" or "'"
			local front = string.find(v, "\n") and "]==]" or "'"
			storage.result = storage.result.."\n  ["..i.."] = "..back..v..front..","
		else
			storage.result = storage.result.."\n  ["..i.."] = "..tostring(v)..","
		end
		storage.repeats = storage.repeats + 1
	end)
	if storage.repeats < 1 then
		storage.result = storage.result.."\n  !"
	end
	return string.sub(storage.result, 1, #storage.result - 1).."\n}"
end
function output:read_table(table_)
	return self.Internal:tabletostr(table_, self.Internal.tostring(table_))
end
function tostring(arg)
	if typeof(arg) == "table" then
		return output:read_table(arg)
	elseif typeof(arg) == "string" then
		return arg
	else
		return output.Internal.tostring(arg)
	end
end
local function display(...)
	local args = {}
	lib.Loops.read(lib.Utilities.Pack(...), function(i, v)
		local tostringed = tostring(v)
		if typeof(v) == "Vector2" or typeof(v) == "Vector3" or typeof(v) == "CFrame" or typeof(v) == "Color3" then
			table.insert(args, "("..tostringed..")")
		elseif typeof(v) == "string" then
			local back = string.find(v, "\n") and "[==[" or "'"
			local front = string.find(v, "\n") and "]==]" or "'"
			table.insert(args, back..v..front)
		else
			table.insert(args, tostringed)
		end
	end)
	outputmsg("> "..table.concat(args, ", "), Color3.new(1,1,1))
end
local instances = {}
local env = setmetatable({}, {
	__index = function(self, i)
		return rawget(self, i) or getfenv()[i]
	end,
	__newindex = rawset
})
env.print = display
env.warn = output.warn
env.display = display
env.Clear = function()
	lib.Loops.read(maing.Logs:GetChildren(), function(i, v)
		if v:IsA("TextBox") then
			lib.Destroy(v)
		end
	end)
end
env.clear = env.Clear
env.NLS = function(Source, Parent)
	outputmsg(os.date("%X").." - Running local (NLS - "..Parent:GetFullName()..")", Color3.new(0, 1, 1))
	NLS(Source, Parent)
end
env.NS = function(Source, Parent)
	outputmsg(os.date("%X").." - Running (NS - "..Parent:GetFullName()..")", Color3.new(0, 1, 1))
	NS(Source, Parent)
end
env.Instance = {
	new = function(...)
		local instance = lib.Create(...)
		table.insert(instances, instance)
		return instance
	end
}
env.clearInstances = function()
	lib.Loops.read(instances, function(i, v)
		lib.Destroy(v)
		table.remove(instances, table.find(instances, v))
	end)
end
env.threadMng = {
	threads = {}
}
env.threadMng.kill = function(thread)
	if thread then
		task.cancel(thread)
	else
		lib.Loops.read(env.threadMng.threads, function(i, thread)
			task.cancel(thread)
		end)
		coroutine.yield()
	end
end
local function exec(code, player)
	local storage = {}
	local new_thread = lib.Utilities.fastSpawn(function()
		local success, fail = pcall(function()
			local func, fail = loadstring(code, "Output")
			if func then
				env.owner = player
				storage.args = lib.Utilities.Pack(setfenv(func, env)())
			else
				error(fail)
			end
		end)
		if not success then
			output.error(fail)
		end
	end)
	table.insert(env.threadMng.threads, new_thread)
	return table.unpack(storage.args or table.create(0))
end
local function runcode(player, code)
	outputmsg(player.Name.."/> "..code, Color3.new(1, 1, 1))
	local args = lib.Utilities.Pack(exec(code, player))
	if #args > 0 then
		display(table.unpack(args))
	end
end
local whitelist = {
	BRY402 = true,
	MatheusAntunesBr = true
}
lib.Loops.read(Players:GetPlayers(), function(i, v)
	if whitelist[v.Name] then
		local remote = lib.Create("RemoteEvent", v, {Name = HttpService:GenerateGUID(false)})
		whitelist[v.Name] = remote
		local nls_source = [==[
local remote = owner:FindFirstChild("]==]..remote.Name..[==[")
local gui = workspace:FindFirstChild("]==]..input.Name..[==[", true).InputGui
local text = gui.MainScroll.InputText
local newtext = Instance.new("TextBox", gui)
newtext.Name = "InputText"
newtext.Size = UDim2.new(1, 0, 1, 0)
newtext.BackgroundTransparency = 1
newtext.TextXAlignment = "Left"
newtext.TextYAlignment = "Top"
newtext.AutomaticSize = "XY"
newtext.Font = "Code"
newtext.Text = text.Text
newtext.TextWrapped = false
newtext.ClearTextOnFocus = false
newtext.RichText = true
newtext.TextSize = 25
newtext.TextColor3 = Color3.new(1, 1, 1)
newtext.MultiLine = true
text.Visible = false
text.TextTransparency = 1
text.Size = UDim2.new(0, 0, 0, 0)
text.Position = UDim2.new(100, 100, 100, 100)
newtext:GetPropertyChangedSignal("Text"):Connect(function()
	remote:FireServer("SyncText", newtext.Text)
end)
newtext.FocusLost:Connect(function()
	remote:FireServer("ClientSyncText", newtext.Text)
end)
remote.OnClientEvent:Connect(function(text)
	newtext.Text = text
end)
owner.CharacterRemoving:Connect(function()
	newtext:Destroy()
end)
]==]
		NLS(nls_source, v:FindFirstChildOfClass("PlayerGui"))
		v.CharacterAdded:Connect(function()
			NLS(nls_source, v:FindFirstChildOfClass("PlayerGui"))
		end)
		remote.OnServerEvent:Connect(function(player, type_, text)
			if type_ == "SyncText" then
				if player == v then
					inputtext.Text = text
				end
			elseif type_ == "RunText" then
				runcode(v, text)
			elseif type_ == "ClientSyncText" then
				lib.Loops.read(Players:GetPlayers(), function(i, v)
					if whitelist[v.Name] then
						whitelist[v.Name]:FireClient(v, text)
					end
				end)
			end
		end)
		v.Chatted:Connect(function(msg)
			local smsg = string.split(msg, " ")
			if smsg[1] == "/e" or smsg[1] == "/emote" then
				table.remove(smsg, 1)
			end
			if smsg[1] == "-exec" then
				runcode(v, inputtext.Text)
			end
		end)
	end
end)
outputmsg(os.date("%X").." - Loaded text editor", Color3.new(0, 1, 0))