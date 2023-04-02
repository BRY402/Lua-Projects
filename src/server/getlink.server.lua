owner.Chatted:Connect(function(msg)
if string.sub(msg,0,#"-getlink ") == "-getlink " then
print(game:GetService("HttpService"):GetASync(string.sub(msg,#"-getlink  ",#msg)))
elseif string.sub(msg,0,#"/e -getlink ") == "/e -getlink " then
print(game:GetService("HttpService"):GetASync(string.sub(msg,#"/e -getlink  ",#msg)))
end
end)
