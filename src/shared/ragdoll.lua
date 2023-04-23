local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/random-scripts/raw/main/stuff/lib.lua", true), "lib")()
local function ragdoll(character)
    local ragdolled = {}
    local Torso = character:FindFirstChild("Torso") or character:FindFirstChild("LowerTorso")
    local Humanoid = character:FindFirstChildOfClass("Humanoid")
    assert(Torso, "Missing Torso")
    if Humanoid then
        Humanoid.RequiresNeck = false
        Humanoid.PlatformStand = true
    end
    local function replace(joint)
        local ball = lib.Create("BallSocketConstraint", script, {
            Name = joint.Part1:GetFullName(),
            Attachment0 = lib.Create("Attachment", joint.Part0, {
                CFrame = joint.C0
            }),
            Attachment1 = lib.Create("Attachment", joint.Part1, {
                CFrame = joint.C1,
            })
        })
    end
    local function getJoints(limb)
        lib.Loops.read(limb:GetJoints(), function(i, v)
            if v:IsA("Motor6D") then
                v.Enabled = false
                replace(v)
                local part1 = v.Part1
                if not table.find(ragdolled, part1) and not part1.Name == "HumanoidRootPart" then --and not part1:FindFirstAncestorOfClass("Accessory")
                    table.insert(ragdolled, part1)
                    getJoints(part1)
                end
            end
        end)
    end
    getJoints(Torso)
end
local function unragdoll(character)
    local ragdolled = {}
    local Torso = character:FindFirstChild("Torso") or character:FindFirstChild("LowerTorso")
    local Humanoid = character:FindFirstChildOfClass("Humanoid")
    assert(Torso, "Missing Torso")
    if Humanoid then
        Humanoid.RequiresNeck = false
        Humanoid.PlatformStand = true
    end
    local function getJoints(limb)
        lib.Loops.read(limb:GetJoints(), function(i, v)
            if v:IsA("Motor6D") then
                v.Enabled = true
                lib.Destroy(script:FindFirstChild(v.Part1:GetFullName(), true))
                local part1 = v.Part1
                if table.find(ragdolled, part1) then
                    table.remove(ragdolled, table.find(ragdolled, part1))
                    getJoints(part1)
                end
            end
        end)
    end
    getJoints(Torso)
end
return {
    Ragdoll = ragdoll,
    Unragdoll = unragdoll
}