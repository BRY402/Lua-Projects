-- Dangerous
local hum = owner.Character:FindFirstChildOfClass("Humanoid")
local function touch(part)
if not hum.Jump then
local ehum = part.Parent:FindFirstChildOfClass("Humanoid")
if ehum then
hum:TakeDamage(hum.MaxHealth)
end
else
local ehum = part.Parent:FindFirstChildOfClass("Humanoid")
if ehum then
ehum:TakeDamage(ehum.MaxHealth)
end
end
end
hum.Touched:Connect(touch(part))
-- UPDATE!