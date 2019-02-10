function loadStuff()
	logo = love.graphics.newImage("img/logo.png")
	txt = love.graphics.newImage("img/start.png")
	txt_2 = love.graphics.newImage("img/start_2.png")
	scn_1 = love.graphics.newImage("img/scn_1.png")
	scn_2 = love.graphics.newImage("img/scn_2.png")	
	scn_3 = love.graphics.newImage("img/scn_3.png")
	scn_4 = love.graphics.newImage("img/scn_4.png")
	scn_5 = love.graphics.newImage("img/scn_5.png")
	scn_6 = love.graphics.newImage("img/scn_6.png")
	scn_7 = love.graphics.newImage("img/scn_7.png")
	scn_8 = love.graphics.newImage("img/scn_8.png")
	scn_9 = love.graphics.newImage("img/scn_9.png")
	scn_10 = love.graphics.newImage("img/scn_10.png")
	logoBlood = love.graphics.newImage("img/logo_kan.png")
	game_back_1 = love.graphics.newImage("img/game_back_1.png")
	game_back_2 = love.graphics.newImage("img/game_back_2.png")
	game_back_3 = love.graphics.newImage("img/game_back_3.png")
	game_back_bar = love.graphics.newImage("img/game_back_bar.png")	
	tut = love.graphics.newImage("img/tut.png")	
	tut_2 = love.graphics.newImage("img/tut_2.png")	
	
	love.window.setTitle("Am I Who I Am")
	--love.window.setFullscreen( true )
	
	logoAnim = newAnimation(logoBlood, 540, 60, 0.5, 0)
	logoAnim:setMode("once")
		
	introSnd = love.audio.newSource("snd/menu.mp3")
	click = love.audio.newSource("snd/click.mp3", "static")
	
	gmThreeSnd = love.audio.newSource("snd/gmThree.mp3")
	gmThreeSnd:setVolume(0.2)
	
	gmSnd = love.audio.newSource("snd/gmSnd.mp3")
	gmSnd:setVolume(0.2)
	
	scnFourSnd = love.audio.newSource("snd/scnFour.mp3", "static")
	
	badGet = love.audio.newSource("snd/bad.mp3", "static")
	goodGet = love.audio.newSource("snd/good.mp3", "static")
		
	sceneNo = 0
	
	won = false
	endless = false
	
	introState = 0
	sceneOneState = 0
	sceneTwoState = 0
	sceneThreeState = 0
	sceneFourState = 0
	sceneFiveState = 0
	
	gameState = 0
	gameOneState = 0
	gameTwoState = 0
	gameThreeState = 0
	gameZeroState = 0
	
	endCounter = 0
	
	sceneAydinlat = false
	sceneKarart = false
		
	r = 255
	alpha = 255
	
	siyahRectangleHeight = 550
	
	aScene = 0
	
	logoY = 280	
	
	love.audio.setVolume(20)
	
	math.randomseed(os.time())
	
	font = love.graphics.newFont("font.ttf", 24)
	love.graphics.setFont(font)
	
	love.filesystem.setIdentity("aiwia_sys")
end

function loadGamePlay()
	heroImg  = love.graphics.newImage("img/char_anim_1.png")
	heroStable =  love.graphics.newImage("img/char_stable_1.png")
	
	heroImg2  = love.graphics.newImage("img/char_anim_2.png")
	heroStable2 =  love.graphics.newImage("img/char_stable_2.png")
	
	heroImg3  = love.graphics.newImage("img/char_anim_3.png")
	heroStable3 =  love.graphics.newImage("img/char_stable_3.png")
	
	badMemo = love.graphics.newImage("img/p_5.png")
	goodMemo  = love.graphics.newImage("img/p_2.png")
	goodMemo1  = love.graphics.newImage("img/p_3.png")
	goodMemo2  = love.graphics.newImage("img/p_4.png")
	goodMemo3  = love.graphics.newImage("img/p_1.png")
	
	badFood = love.graphics.newImage("img/b_2.png")
	goodFood  = love.graphics.newImage("img/b_1.png")
		
	charAnim = newAnimation(heroImg, 95, 135, 0.1, 0)
	charAnim2 = newAnimation(heroImg2, 95, 135, 0.2, 0)
	charAnim3 = newAnimation(heroImg3, 95, 135, 0.2, 0)
	
	memoSize = 30
	
	badMemoAnim = newAnimation(badMemo, memoSize, memoSize, 0.3, 0)
	
	goodMemoAnim = newAnimation(goodMemo, memoSize, memoSize, 0.3, 0)

	hero = {}
	hero.x = 350    
	hero.y = 450
	hero.speed = 400
	memoPicNo = 2
	
	rect={60,90}

	memoPosition = {0,0}
	
	isGood = true
	
	memoPos = {0, 0}    -- 670, 540 
	
	memoVar =0
	acc = 0.001
	t = 1
	
	dir = 0
	d = true
	
	timeCounter = 0
	
	memoTable = {}
	
	point = 0
	
	fileWork()
end

function fileWork()
	file = love.filesystem.newFile('sys.oge')
	
	if not love.filesystem.exists('sys.oge') then
		file:open('w')
		file:write("x")
		file:close()
	else
		file:open('r')
		data = file:read()
		file:close()
		
		if data ~= "x" then
			won = true
		end
	end
end

function updateScene(nr, dt)
	if nr == 0 then
		updateIntro(introState, dt)
	elseif nr == 1 then
		updateSceneOne(sceneOneState, dt)
	elseif nr == 2 then
		updateGameOne(gameOneState, dt)
	elseif nr == 3 then
		updateSceneTwo(sceneTwoState,dt)
	elseif nr == 4 then
		updateGameTwo(gameTwoState, dt)
	elseif nr == 5 then
		updateSceneThree(sceneThreeState,dt)
	elseif nr == 6 then
		updateGameThree(gameThreeState, dt)
	elseif nr == 7 then
		updateSceneFour(sceneFourState,dt)
	elseif nr == 8 then
		updateGameZero(gameZeroState,dt)
	elseif nr == 9 then
		updateSceneFive(sceneFiveState,dt)
	end
end

function drawScene(nr)
	if nr == 0 then
		drawIntro(introState)
	elseif nr == 1 then
		drawSceneOne(sceneOneState)
	elseif nr == 2 then
		drawGameOne(gameOneState)
	elseif nr == 3 then
		drawSceneTwo(sceneTwoState)
	elseif nr == 4 then
		drawGameTwo(gameTwoState)
	elseif nr == 5 then
		drawSceneThree(sceneThreeState)
	elseif nr == 6 then
		drawGameThree(gameThreeState)
	elseif nr == 7 then
		drawSceneFour(sceneFourState)
	elseif nr == 8 then
		drawGameZero(gameZeroState)
	elseif nr == 9 then
		drawSceneFive(sceneFiveState)
	end
	
	--love.graphics.print(score)
end

function resetFade()
	sceneAydinlat = false
	sceneKarart = false
end