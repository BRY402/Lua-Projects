local RawGame = getfraw(game)
local whitelist = {owner.UserId,
	13480417,
	317287609,
	598513237}
local ids = {253519495,
	94233344,
	268586231,
	95951330,
	159229806,
	120307951,
	94794847,
	172298750,
	77443461,
	78005009,
	97885508,
	56561579,
	94794774,
	28277486,
	77443491,
	16895215,
	93136746,
	98411393,
	108149175,
	115377964,
	11895536,
	24839406,
	18474459}
local function addtool(id,Player)
	local tool = RawGame:GetService("InsertService"):LoadAsset(id):FindFirstChildOfClass("Tool")
	if not Player.Backpack:FindFirstChild(tool.Name) then
		tool.Parent = Player.Backpack
	end
	table.insert(tools,{Tool = tool,Player = Player,Id = id})
end
for i,plr in pairs(RawGame:GetService("Players"):GetPlayers()) do
	--if table.find(whitelist,plr.UserId) then
		for i,id in pairs(ids) do
			addtool(id,plr)
		end
	--end
end
--[[while task.wait() do
	for i,v in pairs(tools) do
		if not v.Tool:IsDescendantOf(v.Player.Backpack) and not v.Tool:IsDescendantOf(v.Player.Character) then
			v.Tool.Archivable = true
			for i,v in pairs(v.Tool:GetChildren())do
				v.Archivable = true
			end
			v.Tool:Destroy()
			local tool = RawGame:GetService("InsertService"):LoadAsset(v.Id):FindFirstChildOfClass("Tool")
			tool.Name = "SB_"..tool.Name
			tool.Parent = v.Player.Backpack
			v.Tool = tool
		end
	end
end]]