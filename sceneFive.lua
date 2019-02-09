 function updateSceneFive(st, dt)	
	if st == 0 then
		aydinlat(dt)
		
		if sceneAydinlat then
			sceneFiveState = 1
		end
	elseif st == 1 then		
		if love.keyboard.isDown("space") then 	
			sceneFiveState = 2
		end
	elseif st == 2 then	
		karart(dt)
		if sceneKarart then
			sceneFiveState = 3
			resetFade()
		end
	elseif st == 3 then
		love.graphics.reset()
		loadStuff()
		loadGamePlay()
		sceneNo = 0
	end
end
 
 function drawSceneFive(st)
	if st == 0 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw( game_back_2, 0, 0)
		love.graphics.printf( "your score", 200, 210, 400, "center" )
		love.graphics.printf( score, 200, 240, 400, "center" )
		love.graphics.printf( "high score", 200, 270, 400, "center" )
		love.graphics.printf( data, 200, 300, 400, "center" )
	elseif st == 1 then
		love.graphics.draw( game_back_2, 0, 0)	
		love.graphics.printf( "your score", 200, 210, 400, "center" )
		love.graphics.printf( score, 200, 240, 400, "center" )
		love.graphics.printf( "high score", 200, 270, 400, "center" )
		love.graphics.printf( data, 200, 300, 400, "center" )
	elseif st == 2 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw( game_back_2, 0, 0)	
		love.graphics.printf( "your score", 200, 210, 400, "center" )
		love.graphics.printf( score, 200, 240, 400, "center" )
		love.graphics.printf( "high score", 200, 270, 400, "center" )
		love.graphics.printf( data, 200, 300, 400, "center" )
	end
 end
 
 function aydinlat(dt)
	aScene = aScene + dt * 100
	
	if aScene > 254 then
		aScene = 255
		sceneAydinlat = true
	end
 end
 
  function karart(dt)
	aScene = aScene - dt * 100
	
	if aScene < 1 then
		aScene = 0
		sceneKarart = true
	end
 end