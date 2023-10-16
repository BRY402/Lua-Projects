local HttpService = game:GetService("HttpService")
local lib = loadstring(HttpService:GetAsync("https://github.com/BRY402/luau-scripts/raw/main/stuff/lib.lua"))()
local eye1 = lib.Create("Part", owner.Character, {
    Name = "Eye",
    Size = Vector3.one,
    Shape = "Ball",
    lib.Create("SpecialMesh", nil, {
        MeshType = "FileMesh",
        MeshId = "rbxassetid://11533174519",
        TextureId = "rbxassetid://11533235725"
    })
})
local eye2 = lib.Create("Part", owner.Character, {
    Name = "Eye",
    Size = Vector3.one,
    Shape = "Ball",
    lib.Create("SpecialMesh", nil, {
        MeshType = "FileMesh",
        MeshId = "rbxassetid://11533174519",
        TextureId = "rbxassetid://11533235725"
    })
})