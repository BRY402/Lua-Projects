-- click_tp
NLS([==[
local mouse = owner:GetMouse()
mouse.Button1Down:Connect(function() owner.Character.Torso.CFrame = mouse.Hit  end)
]==],owner.PlayerGui)
-- UPDATE!