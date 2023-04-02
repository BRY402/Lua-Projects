-- clone
owner.Character.Archivable = true
c = owner.Character:Clone()
c.Parent = script
anim = owner.Character.Animate:Clone()
c.Animate:Destroy()
anim.Parent = c
owner.Character.Archivable = false
-- UP TO DATE.