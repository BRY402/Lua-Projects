NLS([==[if not game:GetService("RunService"):IsClient() then return warn("This is a client script") end
owner.Chatted:Connect(function(msg)
    local split = msg:split(" ")
    if split[1]=="/e" or split[1]=="/emote" then table.remove(split,1) end
    if split[1]=="/cv" then
        local player = game:GetService("Players"):FindFirstChild(split[2])
        if player then
            for i,v in pairs(player:GetChildren()) do
                --print(v.Name:sub(1,9))
				--print(v.Name)
                if v.Name:sub(1,9)=="SB_Output" then
                    local ty = v.Name:sub(11)
                    --print(ty)
                    if ty==(split[3] or "Output") then
                        local n = v:Clone()
						print(n.Value)
						game:GetService("Debris"):AddItem(n,2)
                        n.Parent = owner
                    end
                end
            end
        end
    end
end)
-- USAGE
print("-- USAGE:\nCV copies a person's SB_Output:* values to your player.")
warn([[[/e | /emote] /cv (Person) (ValueType)
ValueTypes i know:
Script
Output]])
print();print('Note: you may experience lag while it is copying');print(' and while the output is making the instances associated with the string values you copied.')
-- AVOIDANCE
print('-- AVOIDANCE:\nTo avoid CV, you can:')
warn('1. Rejoin')
warn('2. Use an instance bypass to destroy the SB_Output values')]==],owner.PlayerGui)