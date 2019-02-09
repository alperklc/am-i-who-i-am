 function updateSceneTwo(st, dt)
	introSnd:play()
	
	if st == 0 then
		aydinlat(dt)
		
		if sceneAydinlat then
			sceneTwoState = 1
		end
	elseif st == 1 then		
		if love.keyboard.isDown("space") then 	
			sceneTwoState = 2
		end
	elseif st == 2 then	
		karart(dt)
		if sceneKarart then
			sceneTwoState = 3
			resetFade()
		end
	elseif st == 3 then
		aydinlat(dt)
		
		if sceneAydinlat then
			sceneTwoState = 4
		end
	elseif st == 4 then
		if love.keyboard.isDown("space") then 	
			sceneTwoState = 5
		end
	elseif st == 5 then
		karart(dt)
		
		if sceneKarart then
			sceneTwoState = 6
			resetFade()
		end
	elseif st == 6 then
		karart(dt)
		
		resetFade()
		introSnd:pause()
		sceneNo = 4				
	end
 end
 
 function drawSceneTwo(st)
	if st == 0 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(scn_3, 0, 0)
	elseif st == 1 then
		love.graphics.draw(scn_3, 0, 0)
	elseif st == 2 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(scn_3, 0, 0)	
	elseif st == 3 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(scn_4, 0, 0)
	elseif st == 4 then
		love.graphics.draw(scn_4, 0, 0)
	elseif st == 5 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(scn_4, 0, 0)
	elseif st == 6 then
		
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