--black arm warmers
script:Destroy()
script.Enabled = false
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local info = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local prefix = "-"
local display
local currentTextBox = nil
local imports = {Addons = {
	tpscript = "https://github.com/headsmasher8557/tpscript/blob/main/init.lua",
	loadstring = "https://gist.github.com/BRY402/f5c530a710e5db86a06d8ef155e9aab8/raw",
	comradio = "https://gist.github.com/BRY402/fc0952ccabd77cf77a7183517f4507ac/raw"
}}
local httpEnabled, _ = pcall(HttpService.GetAsync, HttpService, "https://example.com")
local function import(name)
	if httpEnabled then
		local returned = {loadstring(HttpService:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/"..name..".lua", true), name)()}
		return table.unpack(returned)
	else
		error("HttpService is disabled.")
	end
end
if httpEnabled then
	lib = import("lib")
	indexEvent = lib.Utilities.newEvent("OnIndex")
	newIndexEvent = lib.Utilities.newEvent("OnNewIndex")
	inputHandler = {
		expectingInput = false,
		inputEvent = lib.Utilities.newEvent("OnInput")
	}
else
	inputHandler = setmetatable({}, {
		__index = function()
			error("Input feature is disabled.")
		end,
		__newindex = function()
			error("Input feature is disabled.")
		end
	})
	local Debris = game:GetService("Debris")
	local instanceCache = {}
	local clonable = Instance.new("Script")
	clonable:Destroy()
	clonable.Enabled = false
	clonable.Archivable = true
	lib = {
		Destroy = function(target, delay_)
			Debris:AddItem(target, tonumber(delay_) or 0)
		end,
		Loops = {read = function(table_, func)
			local storage = {n = 0}
			for i, v in pairs(table_) do
				func(i, v)
				storage.n = storage.n + 1
				if storage.n % 10 == 0 then
					task.wait()
				end
			end
		end},
		Utilities = {Pack = function(...)
			local packed = table.pack(...)
			packed.n = nil
			return packed
		end}
	}
	lib.Create = function(ClassName, Parent, Properties)
		if not instanceCache[ClassName] then
			instanceCache[ClassName] = Instance.new(ClassName)
			instanceCache[ClassName].Archivable = true
		end
		local newInstance = clonable.Clone(instanceCache[ClassName])
		if Properties then
			lib.Loops.read(Properties, function(i, v)
				newInstance[i] = v
			end)
		end
		newInstance.Parent = Parent
		return newInstance
	end
end
local env = {}
local sandboxed_env = getfenv()
env.getfenv = function(level)
	if level and level > 1 then
		return getfenv(level)
	else
		return env
	end
end
env.threadMng = {}
env.threadMng.Threads = {}
env.tostring = tostring
env.getfraw = getfraw
env.load = function(name)
	if httpEnabled then
		return loadstring(HttpService:GetAsync(imports.Addons[name], true), name)()
	else
		error("HttpService is disabled.")
	end
end
env.import = import
env.io = {
	read = function(delay_)
		inputHandler.expectingInput = true
		local args = lib.Utilities.Pack(inputHandler.OnInput:Wait(delay_, false))
		inputHandler.expectingInput = false
		return table.unpack(args)
	end,
	write = function(str)
		currentTextBox.Text = currentTextBox.Text..str
	end,
	fire = function(...)
		inputHandler.OnInput:Fire(...)
	end
}
local rem = lib.Create("RemoteEvent", owner, {Name = HttpService:GenerateGUID(false)})
local function newwin(size,pos,ori)
	local resize = {Size = size}
	local reposition = {Position = Vector3.zero}
	local cf = ((owner.Character:FindFirstChild("HumanoidRootPart") or workspace.Terrain).CFrame * CFrame.Angles(0, math.rad(180), 0)) * CFrame.new(0, pos.Y, pos.Z)
	local win = lib.Create("Part", workspace, {
		Name = "Window_"..HttpService:GenerateGUID(false),
		Material = "Air",
		Size = Vector3.new(size.X, 0, size.Z),
		CanCollide = false,
		Massless = true,
		CanTouch = false,
		Color = Color3.new(0, 0, 0),
		Transparency = .65,
		CFrame = cf
	})
	win:SetNetworkOwner(owner)
	local surfg = lib.Create("SurfaceGui", owner, {
		Name = "TerminalGui",
		Adornee = win
	})
	local cmdbar = lib.Create("TextLabel", surfg, {
		Name = "CmdBar",
		Size = UDim2.new(1,0,.05,0),
		Position = UDim2.new(0,0,.95,0),
		BackgroundTransparency = 1,
		TextXAlignment = "Left",
		TextYAlignment = "Top",
		Font = "Code",
		Text = "Click here to run a command",
		TextSize = 15,
		TextColor3 = Color3.new(1, 1, 1),
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
	local at0 = lib.Create("Attachment", win, {
		Position = Vector3.new(0, -size.Y / 2, 0),
		Orientation = Vector3.new(180,0,180) + ori
	})
	local at1 = lib.Create("Attachment", owner.Character:FindFirstChild("HumanoidRootPart"), {Position = Vector3.new(pos.X, pos.Y, -pos.Z)})
	local ap = lib.Create("AlignPosition", win, {
		Attachment0 = at0,
		Attachment1 = at1,
		RigidityEnabled = true
	})
	local ao = lib.Create("AlignOrientation", win, {
		Attachment0 = at0,
		Attachment1 = at1,
		RigidityEnabled = true
	})
	surfg.Parent = win
	TweenService:Create(win, info, resize):Play()
	TweenService:Create(at0, info, reposition):Play()
	rem:FireClient(owner, win)
	return win, surfg, maing, cmdbar
end
local win, surfg, maing, cmdbar = newwin(Vector3.new(8.5,6.5,0), Vector3.new(0,1.5,4), Vector3.zero)
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
local function outputmsg(msg: string, color: Color3)
	if win.Parent ~= nil then
		local _, textbox = coroutine.resume(task.defer(function()
			local color = color or Color3.new(1, 1, 1)
			local storage = {
				isSame = false,
				currentText = tostring(msg)
			}
			local children = maing.Logs:GetChildren()
			if #children > 40 then
				lib.Destroy(maing.Logs:FindFirstChildOfClass("TextBox"))
			end
			if #storage.currentText > 16384 then
				storage.fullMsg = string.sub(storage.currentText, 0, 15000)
				storage.currentText = string.sub(storage.currentText, 15001, #storage.currentText)
			else
				storage.fullMsg = storage.currentText
			end
			local textbox = lib.Create("TextBox", nil, {
				Name = "OutputText",
				Size = UDim2.new(1,0,.05,0),
				BackgroundTransparency = 1,
				TextXAlignment = "Left",
				AutomaticSize = "XY",
				Font = "Code",
				Text = tostring(storage.fullMsg),
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
						currentTextBox = current_textbox
						return current_textbox
					end
				end
			end
			if not storage.isSame then
				textbox.Parent = maing.Logs
			end
			if storage.currentText ~= storage.fullMsg then
				outputmsg(tostring(storage.currentText), color)
			end
			return textbox
		end))
	end
	currentTextBox = textbox
	return textbox
end
local function exec(code)
	local storage = {}
	local new_thread = task.spawn(function()
		local success, fail = pcall(function()
			local func, fail = loadstring(code, "Terminal")
			if func then
				storage.args = lib.Utilities.Pack(setfenv(func, setmetatable(env, env.terminal.Internal.environmentMetatable))())
			else
				error(fail)
			end
		end)
		if not success then
			env.terminal.error(fail)
		end
	end)
	table.insert(env.threadMng.Threads, new_thread)
	return table.unpack(storage.args or table.create(0))
end
local function runcode(code)
	if httpEnabled and inputHandler.expectingInput then
		return
	end
	outputmsg(owner.Name.."/> "..code, Color3.new(1, 1, 1))
	local args = lib.Utilities.Pack(exec(code))
	if #args > 0 then
		env.display(table.unpack(args))
	end
end
owner.Chatted:Connect(function(msg)
	local smsg = string.split(msg," ")
	if smsg[1] == "/e" then
		table.remove(smsg,1)
	end
	if smsg[1] == prefix.."show" then
		win, surfg, maing, cmdbar = newwin(Vector3.new(8.5,6.5,0), Vector3.new(0,1.5,4), Vector3.zero)
	elseif smsg[1] == prefix.."hide" then
		local resize = {Size = Vector3.new(win.Size.X, 0, win.Size.Z)}
		local reposition = {Position = Vector3.new(0, -win.Size.Y / 2, 0)}
		TweenService:Create(win, info, resize):Play()
		local Attachment = win:FindFirstChild("Attachment")
		if Attachment then
			TweenService:Create(Attachment, info, reposition):Play()
		end
		lib.Destroy(win, 1.5)
	elseif smsg[1] == prefix.."exec" then
		table.remove(smsg,1)
		runcode(table.concat(smsg," "))
	end
end)
local terminal = {
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
	newwin = newwin,
	newlog = outputmsg,
	exec = exec,
	debug = {
		OnIndex = indexEvent and indexEvent.OnIndex or nil,
		OnNewIndex = newIndexEvent and newIndexEvent.OnNewIndex or nil,
		Call = function(func, metatable)
			local func = debug.info(func, "f")
			local env = {}
			env.getfenv = function(level)
				return env
			end
			local success, func = pcall(setfenv, func, setmetatable(env, {
				__index = function(self, i)
					if metatable.__index then
						return metatable.__index(self, i)
					else
						return rawget(self, i) or getfenv()[i]
					end
				end,
				__newindex = function(self, i, v)
					if metatable.__newindex then
						metatable.__newindex(self, i, v)
					else
						rawset(self, i, v)
					end
				end
			}))
			if metatable.__call then
				return function(...)
					return metatable.__call(func, ...)
				end
			else
				return func
			end
		end
	},
	Internal = {
		tostring = tostring,
		environmentMetatable = {
			__index = function(self, index)
				--indexEvent:Fire("From <env/>: retrieved index "..index)
				return rawget(self, index) or sandboxed_env[index]
			end,
			__newindex = function(self, index, value)
				--newIndexEvent:Fire("From <env/>: set index "..index.." with value: "..tostring(value).." ("..typeof(value)..")")
				rawset(self, index, value)
			end
		}
	}
}
env.terminal = terminal
function terminal.Internal:tabletostr(table_, name, main_table)
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
	storage.name = "["..(tonumber(name) or "\""..tostring(name).."\"").."]"
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
function terminal:read_table(table_)
	return self.Internal:tabletostr(table_, self.Internal.tostring(table_))
end
function tostring(arg)
	local arg = arg or ""
	if typeof(arg) == "table" then
		return terminal:read_table(arg)
	elseif typeof(arg) == "string" then
		return arg
	else
		return terminal.Internal.tostring(arg)
	end
end
env.display = function(...)
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
env.Packs = imports.Addons
env.Clear = function()
	lib.Loops.read(maing.Logs:GetChildren(), function(i, v)
		if v:IsA("TextBox") then
			lib.Destroy(v)
		end
	end)
end
env.decompile = function(func)
	local storage = {result = ""}
	local function getArgs(...)
		local args = lib.Utilities.Pack(...)
		lib.Loops.read(args, function(i, v)
			if typeof(v) == "string" then
				args[i] =  "'"..v.."'"
			elseif typeof(v) == "Vector3" or typeof(v) == "CFrame" or typeof(v) == "Color3" then
				args[i] = typeof(v)..".new("..tostring(v)..")"
			else
				args[i] = tostring(v)
			end
		end)
		return table.concat(args, ", ")
	end
	local function callNewIndex(self, index, value, fromTable)
		if typeof(value) == "function" then
			storage.result = storage.result..(not fromTable and "\n" or "")..index.." = "..decompile(value)
		else
			storage.result = storage.result..(not fromTable and "\n" or "")..index.." = "..tostring(value)
		end
	end
	local function callIndex(self, index, fromTable)
		local value = rawget(self, index) or getfenv()[index]
		if typeof(value) == "function" then
			return function(...)
				storage.result = storage.result..(not fromTable and "\n" or "")..index.."("..getArgs(...)..")"
				return value(...)
			end
		elseif typeof(value) == "table" then
			return setmetatable({}, {
				__index = function(self, index2)
					storage.result = storage.result.."\n"..index.."."
					return callIndex(value, index2, true)
				end,
				__newindex = callNewIndex
			})
		else
			storage.result = storage.result..(not fromTable and "\n" or "")..index
		end
		return value
	end
	local func = terminal.debug.Call(func, {
		__index = callIndex,
		__newindex = callNewIndex,
		__call = function(func, ...)
			storage.result = storage.result.."function("..getArgs(...)..")"
			return func(...)
		end
	})
	return function(...)
		local args = lib.Utilities.Pack(func(...))
		storage.result = storage.result.."\nend"
		return storage.result, table.unpack(args)
	end
end
env.clear = env.Clear
local Services = {}
function Services:GetServices()
	local ServiceTable = {}
	lib.Loops.read(game:GetChildren(), function(i, v)
		xpcall(function()
			if Services[v.ClassName] then
				table.insert(ServiceTable,v)
			end
		end,
		function()
			table.insert(ServiceTable,false)
		end)
	end)
	return ServiceTable
end
env.Services = setmetatable(Services,{__index = function(self,i)
	local v = rawget(Services, i)
	if v then
		return v
	else
		local s = game:FindService(i)
		return s
	end
end})
env.threadMng.kill = function()
	for i,v in pairs(env.threadMng.Threads) do
		if coroutine.status(v) ~= "dead" then
			if v ~= coroutine.running() then
				task.cancel(v)
				table.remove(env.threadMng.Threads,i)
				task.wait()
			end
		else
			table.remove(env.threadMng.Threads,i)
			task.wait()
		end
	end
	table.remove(env.threadMng.Threads,table.find(env.threadMng.Threads,coroutine.running()))
	coroutine.yield()
end
NLS([==[local rem = owner:FindFirstChild("]==]..rem.Name..[==[")
local prefix = "]==]..prefix..[==["
rem.OnClientEvent:Connect(function(win)
	if win and win.Parent ~= nil then
		local gui = win:FindFirstChild("TerminalGui")
		local textbox = gui.CmdBar
		local newtextbox = Instance.new("TextBox")
		newtextbox.Name = "CmdBar"
		newtextbox.Size = UDim2.new(1,0,.05,0)
		newtextbox.Position = UDim2.new(0,0,.95,0)
		newtextbox.BackgroundTransparency = 1
		newtextbox.TextXAlignment = "Left"
		newtextbox.TextYAlignment = "Top"
		newtextbox.PlaceholderText = "Click here to run a command"
		newtextbox.Font = "Code"
		newtextbox.Text = ""
		newtextbox.ClearTextOnFocus = false
		newtextbox.TextSize = 15
		newtextbox.TextColor3 = Color3.new(1,1,1)
		textbox:Destroy()
		newtextbox.Parent = gui
		newtextbox:GetPropertyChangedSignal("Text"):Connect(function()
			rem:FireServer("SyncText", newtextbox.Text)
		end)
		newtextbox.FocusLost:Connect(function(pressed)
			if pressed then
				rem:FireServer("RunText", newtextbox.Text)
			end
		end)
	end
end)]==], owner:FindFirstChildOfClass("PlayerGui"))
rem.OnServerEvent:Connect(function(plr,at,...)
	if plr == owner then
		local storage = {}
		if at == "SyncText" then
			storage.text = ...
			if storage.text == "" then
				storage.text = "Click here to run a command"
			end
			cmdbar.Text = storage.text
		elseif at == "RunText" then
			runcode(...)
		elseif at == "Hide" then
			lib.Destroy(win)
		elseif at == "Show" then
			win, surfg, maing, cmdbar = newwin(Vector3.new(8.5,6.5,0), Vector3.new(0,1.5,4), Vector3.zero)
		end
	end
end)
outputmsg(os.date("%X").." - Loaded terminal",Color3.new(0,1,0))
if not httpEnabled then
	terminal.warn("HttpService is disabled, some features might not work.")
end
Players.PlayerAdded:Connect(function(plr)
	outputmsg(os.date("%X").." - "..plr.Name.." has joined the server", Color3.new(0,1,0))
end)
Players.PlayerRemoving:Connect(function(plr)
	outputmsg(os.date("%X").." - "..plr.Name.." has left the server", Color3.new(0,1,0))
end)