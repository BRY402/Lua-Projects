script:Destroy()
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local PNLS = loadstring(HttpService:GetAsync("https://gist.github.com/BRY402/1a733979f3c8c49ac610a122ba80a088/raw",true))()
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"), "lib")()
local function newwin(size, pos)
	local cf = ((owner.Character:FindFirstChild("HumanoidRootPart") or workspace.Terrain).CFrame * CFrame.Angles(0, math.rad(180), 0)) * CFrame.new(pos)
	local win = lib.Create("Part", workspace, {
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
		Name = "TerminalGui",
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
	return win, surfg, maing, cmdbar
end
local win, surfg, maing, cmdbar = newwin(Vector3.new(8, 6, 0), Vector3.new(0, 0, 4))
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
if RunService:IsClient() then
	error("Script must be server side to run")
elseif RunService:IsServer() then
	local running = {}
	local function cancel(target)
		local ran = running[target]
		lib.Destroy(target.script)
		task.cancel(ran.Thread)
		output.warn("Stopped "..target)
		running[target] = nil
		lib.Loops.read(ran.Instances, function(i,v)
			lib.Destroy(v)
		end)
	end
	local function getlink(link, name)
		if running[name] then
			task.cancel(running[name].Thread)
		end
		running[name] = {Instances = {}}
		local target = running[name]
		target.Thread = task.spawn(function()
			local success, fail = pcall(function()
				local env = getfenv()
				local func, fail = loadstring(HttpService:GetAsync(link), name)
				outputmsg(os.date("%X").." - Running ("..name..")", Color3.new(0, 1, 1))
				if func then
					local env = setmetatable({
						Instance = {
							new = function(Class, Parent)
								local newInstance = lib.Create(Class, Parent)
								table.insert(target.Instances, newInstance)
								return newInstance
							end
						},
						NLS = function(Source, Parent)
							outputmsg(os.date("%X").." - Running local (NLS - "..Parent:GetFullName()..")", Color3.new(0, 1, 1))
							NLS(Source, Parent)
						end,
						NS = function(Source, Parent)
							outputmsg(os.date("%X").." - Running (NS - "..Parent:GetFullName()..")", Color3.new(0, 1, 1))
							NS(Source, Parent)
						end,
						print = display,
						warn = output.warn,
						script = lib.Create("Script", workspace, {Name = name})
					},{
						__index = function(self, i)
							return rawget(self, i) or env[i]
						end,
						__newindex = rawset
					})
					setfenv(func, env)()
					target.script = env.script
				else
					error(fail)
				end
			end)
			if not success then
				output.error(fail)
			end
		end)
	end
	local links = {
		fake_char = "https://gist.github.com/BRY402/1292d57bfed7f11dadecae43b0846724/raw",
		injector = "https://gist.github.com/BRY402/b81f2790715c4b26686e4196e16fcfdb/raw"
	}
	owner.Chatted:Connect(function(msg)
		local smsg = string.split(msg," ")
		if smsg[1] == "/e" then
			table.remove(smsg,1)
		end
		if smsg[1] == "-load" then
			local loaded = smsg[2]
			if links[loaded] then
				getlink(links[loaded], loaded)
			end
		elseif smsg[1] == "-stop" then
			local target = smsg[2]
			if target == "-all" then
				lib.Loops.read(running, function(i, v)
					cancel(i)
				end)
			else
				if running[target] then
					cancel(target)
				end
			end
		elseif smsg[1] == "-rebuild" then
			lib.Destroy(win)
			win, surfg, maing, cmdbar = newwin(Vector3.new(8.5, 6.5, 0), Vector3.new(0, 0, 4))
		elseif smsg[1] == "-remove" then
			lib.Destroy(win)
		elseif smsg[1] == "-clear" then
			lib.Loops.read(maing.Logs:GetChildren(), function(i, v)
				if v:IsA("TextBox") then
					lib.Destroy(v)
				end
			end)
		end
	end)
end
outputmsg(os.date("%X").." - Loaded output",Color3.new(0,1,0))
Players.PlayerAdded:Connect(function(plr)
	outputmsg(os.date("%X").." - "..plr.Name.." has joined the server", Color3.new(0,1,0))
end)
Players.PlayerRemoving:Connect(function(plr)
	outputmsg(os.date("%X").." - "..plr.Name.." has left the server", Color3.new(0,1,0))
end)