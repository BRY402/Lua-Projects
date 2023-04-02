local scripts = script:GetChildren()
for i, v in scripts do
    if v:IsA("Script") then
        v.Disabled = true
    end
end