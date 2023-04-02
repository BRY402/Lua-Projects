-- lcc
-- Script --
local lc
local current
local handle
local jack
local ts = game:GetService("TweenService")
local t = TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
local dothis = {Size = Vector3.new(2.8,1.9,.85)}
for i,v in pairs(owner.Character:GetDescendants()) do
    if v:IsA("Accessory") and string.find(v.Name,"Jacket") then
        lc = v
    end
end
if lc then
    handle = lc.Handle
    current = handle.Size
    jack = handle:FindFirstChildOfClass("WrapLayer")
end
owner.Chatted:Connect(function(msg)
            if string.lower(msg) == "-toggle" then
                jack.Enabled = not jack.Enabled
                if jack.Enabled then
                handle.Transparency = 0
        else
            handle.Transparency = 1
                end
            end
            if string.lower(msg) == "-fit" then
                local this = ts:Create(handle,t,dothis)
		this:Play()
            end
            if string.lower(msg) == "-fix" then
                local this = ts:Create(handle,t,{Size = current})
		this:Play()
            end
        end)