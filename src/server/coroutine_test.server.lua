-- coroutine_test
local a = coroutine.create(function()
print("I got called!")
coroutine.yield()
print("the coroutine has been called twice.")
end)
coroutine.resume(a)
coroutine.resume(a)
print(coroutine.status(a))
-- UP TO DATE.