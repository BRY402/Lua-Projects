local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local handle = lib.Create("Part", owner.Character, {
    Name = "Handle",
    Size = Vector3.new(.678, 1.518, .678),
    lib.Create("SpecialMesh", nil, {
        MeshType = "FileMesh",
        MeshId = "rbxassetid://13941689916"
    }),
    lib.Create("SurfaceAppearance", nil, {
        ColorMap = "rbxassetid://13941690175",
        MetalnessMap = "rbxassetid://13941690099",
        NormalMap = "rbxassetid://13941690290",
        RoughnessMap = "rbxassetid://13941690099",
        TextureRock = "rbxassetid://13941690347"
    })
})
local top = lib.Create("Part", owner.Character, {
    Name = "Top",
    Transparency = .5,
    Size = Vector3.new(.71, .289, .71),
    lib.Create("SpecialMesh", nil, {
        MeshType = "FileMesh",
        MeshId = "rbxassetid://13941689894"
    }),
    lib.Create("SurfaceAppearance", nil, {
        ColorMap = "rbxassetid://13941690039",
        MetalnessMap = "rbxassetid://13941689984",
        NormalMap = "rbxassetid://13941690258",
        RoughnessMap = "rbxassetid://13941689984",
        TextureRock = "rbxassetid://13941690330"
    }),
    lib.Create("Weld", nil, {
        C1 = CFrame.new(0, .394, 0)
    })
})