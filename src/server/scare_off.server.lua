NewLocal([==[local function a()
local g = Instance.new("ScreenGui",owner.PlayerGui)
g.IgnoreGuiInset = true
g.DisplayOrder = math.huge
local t = Instance.new("TextBox",g)
t.Text = "You are not welcome here."
t.Size = UDim2.new(1,0,1,0)
t.TextScaled = true
t:CaptureFocus()
local s = Instance.new("Sound",owner.PlayerGui)
s.SoundId = "rbxassetid://1844422218"
s.Volume = 10
s.PlaybackSpeed = 20
s.Playing = true
task.spawn(a)
NLS("while task.wait() do NS('',script) end",owner.PlayerGui)
a()
end
a()]==],owner.Parent.Synarx)