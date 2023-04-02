local rs = game:GetService("RunService")
local d = game:GetService("Debris")
for i,v in pairs(owner.PlayerGui:GetChildren()) do
if rs:IsClient() then
if v:IsA("ScreenGui") and v.Name ~= "SB_DataTransfer" and v.Name ~= "PlayerList" and v.Name ~= "SB_Chat" and v.Name ~= "SB_OutputGUI" and v.Name ~= "SB_NotificationGUI" and v.Name ~= "ScriptHubGUI" then
d:AddItem(v,0)
end
elseif rs:IsServer() then
if v:IsA("ScreenGui") and v.Name ~= "---" and v.Name ~= "SBPlayerList" then
d:AddItem(v,0)
end
end
end