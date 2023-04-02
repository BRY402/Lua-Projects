-- rams
local at0 = Instance.new("Attachment",owner.Character.Torso)
local at1 = Instance.new("Attachment",owner.Character["Left Arm"])
local at00 = Instance.new("Attachment",owner.Character.Torso)
local at11 = Instance.new("Attachment",owner.Character["Right Arm"])
at0.Position = Vector3.new(1,.5,0)
at00.Position = Vector3.new(-1,.5,0)
at1.Position = Vector3.new(0,.75,0)
at11.Position = Vector3.new(0,.75,0)
local r1 = Instance.new("BallSocketConstraint",owner.Character.Torso)
local r2 = Instance.new("BallSocketConstraint",owner.Character.Torso)
r1.Attachment0 = at0
r1.Attachment1 = at1
r2.Attachment0 = at00
r2.Attachment1 = at11
owner.Character.Torso["Left Shoulder"]:Destroy()
owner.Character.Torso["Right Shoulder"]:Destroy()
-- UP TO DATE.