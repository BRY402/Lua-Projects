owner.Character.Archivable = true
local backup = owner.Character:Clone()

function god(char)
	local cchar = char:Clone()
	owner.Character = nil
	cchar.Name = owner.Name..'   [string "SB_Script"]:3'
	wait(.5)
	owner.Character = cchar
	cchar.Parent = workspace
end

god(owner.Character)