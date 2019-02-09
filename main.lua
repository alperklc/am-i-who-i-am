function love.load()
	require("AnAl")
	require("func")
	require("intro")
	require("mech")
	require("sceneOne")
	require("sceneTwo")
	require("sceneThree")
	require("sceneFour")
	require("sceneFive")
	require("gameOne")
	require("gameTwo")
	require("gameThree")
	require("gameZero")

	loadStuff()
	loadGamePlay()
end

function love.update(dt)
	updateScene(sceneNo, dt)
end

function love.draw()
	drawScene(sceneNo)
end