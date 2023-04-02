local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua",true), "lib")()
local ReplicatorRemote = lib.Create("RemoteFunction", owner, {Name = HttpService:GenerateGUID()})
local types = {
    "Frame",
    "Textbox",
    "Label",
    "Button",
    "ImageLabel",
    "ImageButton"
}
local uis = {}
local blockedProperties = {"ID"}
local nls_source = [==[local ReplicatorRemote = owner:FindFirstChild(")]==]..ReplicatorRemote.Name..[==[")
]==]
NLS(nls_source, owner:FindFirstChildOfClass("PlayerGui"))
owner.CharacterAdded:Connect(function()
    NLS(nls_source, owner:FindFirstChildOfClass("PlayerGui"))
end)
local UI = {new = function(type_, data)
    assert(table.find(types, type_), "Invalid ui type")
    local UI = lib.Create(type_)
    local id = HttpService:GenerateGUID()
    uis[id] = UI
    local uiMeta = getmetatable(newproxy(true))
    local properties = {ID = id}
    uiMeta.__index = function(self, index)
        return properties[index]
    end
    uiMeta.__newindex = function(self, index, value)
        assert(not table.find(blockedProperties, index), "This property is locked.")
        properties[index] = value
    end
    lib.Loops.read(data, function(i, v)
        uiMeta[i] = v
    end)
    return uiMeta
end}
return UI