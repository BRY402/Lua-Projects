local HttpService = game:GetService("HttpService")
local remote = Instance.new("RemoteFunction")
remote.Name = "CON_"..HttpService:GenerateGUID()
local commands = {clearConRemotes = function()
    for i, v in pairs(owner.PlayerGui:GetChildren()) do
        if string.sub(v.Name, 1, 4) == "CON_" and v ~= remote then
            v:Destroy()
        end
        if i % 10 == 0 then
            task.wait()
        end
    end
end}
remote.OnServerInvoke = function(player, commandName, ...)
    if player ~= owner then return "Invalid player" end
    local command = commands[commandName]
    if not command then return {Type = "error", Message = "Invalid command name"} end
    return command(...)
end
-- localscript
NLS([==[local remote = owner.PlayerGui:FindFirstChild("]==]..remote.Name..[==[")]==], owner.PlayerGui)
local oldNew = Instance.new
local Instance = {new = function(ClassName, Parent, Properties)
    local newInstance = oldNew(ClassName)
    if Properies then
        local count = 0
        for Property, Value in pairs(Properties) do
            if tonumber(Property) and typeof(Value) == "Instance" then
                Value.Parent = newInstance
            else
                newInstance[Property] = Value
            end
            count = count + 1
            if count % 10 == 0 then
                task.wait()
            end
        end
    end
    newInstance.Parent = Parent
    return newInstance
end}
local ConsoleUI = Instance.new("ScreenGui", owner:FindFirstChildOfClass("PlayerGui"), {
	Name = "ConsoleUI",
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    Instance.new("Frame", nil, {
        Name = "Console",
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        BackgroundTransparency = .5,
        BorderColor3 = Color3.new(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, .6, 0),
        Instance.new("TextBox", nil, {
            Name = "Input",
            BackgroundColor3 = Color3.fromRGB(40, 40, 40),
            BackgroundTransparency = .25,
            BorderColor3 = Color3.new(1, 1, 0),
            BorderSizePixel = 2,
            Position = UDim2.new(0, 2, 1, -30),
            Size = UDim2.new(1, -4, 0, 30),
            Font = Enum.Font.Code,
            PlaceholderText = "Click here to run a command.",
            Text = "",
            TextColor3 = Color3.new(1, 1, 1),
            TextSize = 18,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Bottom
        }),
        Instance.new("ScrollingFrame", nil, {
            Name = "Output",
            Active = true,
            BackgroundColor3 = Color3.fromRGB(30, 30, 30),
            BackgroundTransparency = .75,
            BorderColor3 = Color3.new(0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 1, -32),
            CanvasSize = UDim2.new(0, 0, 0, 0),
            ScrollBarThickness = 5,
            Instance.new("UIListLayout", Output, {SortOrder = Enum.SortOrder.LayoutOrder})
        })
    })
})
local Output = ConsoleUI.Console.Output
local commands = {output = function()
    local OutputMsg = Instance.new("TextLabel", Output, {
        Name = "OutputMsg",
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 15),
        Font = Enum.Font.Code,
        Text = "<font color='rgb(255,255,0)'>Player</font> <font color='rgb(0,255,255)'>Command</font> <font color='rgb(255,0,0)'>Arguments</font>",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left
    })
end}
local function exec(source, name)
    local source = string.gsub(string.gsub(string.gsub(source, "\n;", "\n"), ";", "\n"), "\t", "")
    local splitSource = string.split(source, "\n")
    local commandName = splitSource[1]
    table.remove(splitSource, 1)
    local command = commands[commandName]
    if not command then
        local data = remote:InvokeServer(commandName, table.unpack(splitSource))
        if data.Type == "Success" then return end
        error("From '"..name.."': "..data.Message)
    else
        local data = command(table.unpack(splitSource))
        if data.Type == "Success" then return end
        error("From '"..name.."': "..data.Message)
    end
end