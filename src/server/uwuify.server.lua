NLS([==[local box = script.Parent.SB_Chat.Frame.ChatBarParentFrame.Frame:GetChildren()[2].Frame.ChatBar
local input = script.Parent.SB_OutputGUI.Task.InputBar
local faces = {" UwU"," OwO"," UvU", " >W<", ""}
if owner.UserId ~= 420193860 then
locked = true
else
locked = false
end
box.FocusLost:Connect(function()
choice = faces[math.random(1,4)]
box.Text = string.gsub(box.Text,"r","w")
box.Text = string.gsub(box.Text,"l","w")
box.Text = string.gsub(box.Text,"R","W")
box.Text = string.gsub(box.Text,"L","W")
box.Text = string.gsub(box.Text,"n","ny")
box.Text = string.gsub(box.Text,"N","NY")
if locked then
box.Text = string.gsub(string.lower(box.Text),"sw","hah")
box.Text = string.gsub(string.lower(box.Text),"games","hah")
box.Text = string.gsub(string.lower(box.Text),"ps","hah")
end
box.Text = box.Text..choice.."~"
end)
if locked then
input.FocusLost:Connect(function()
input.Text = "x/print('Nope @w@')"
end)
end]==],owner.PlayerGui)