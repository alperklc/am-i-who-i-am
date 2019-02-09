 function updateSceneFour(st, dt)
	scnFourSnd:play()
	
	if st == 0 then
		aydinlat(dt)
		
		if sceneAydinlat then
			sceneFourState = 1
		end
	elseif st == 1 then	
		karart(dt)
		if sceneKarart then
			sceneFourState = 2
			resetFade()
		end
	elseif st == 2 then
		aydinlat(dt)
		
		if sceneAydinlat then
			sceneFourState = 3
		end
	elseif st == 3 then
		if love.keyboard.isDown("space") then 	
			sceneFourState = 4
		end
	elseif st == 4 then
		karart(dt)
		
		if sceneKarart then
			sceneFourState = 5
			resetFade()
		end
	elseif st == 5 then
		aydinlat(dt)
		
		if sceneAydinlat then
			sceneFourState = 6
		end
	elseif st == 6 then	
		resetFade()
		
		if love.keyboard.isDown("space") then
			sceneFourState = 7
		end
	elseif st == 7 then
		karart(dt)
		
		if sceneKarart then
			sceneFourState = 8
			resetFade()
		end
	elseif st == 8 then
		aydinlat(dt)
		
		if sceneAydinlat then
			sceneFourState = 9
		end
	elseif st == 9 then
		karart(dt)
		
		if sceneKarart then
			if won then
				scnFourSnd:stop()
				love.graphics.reset()
				loadStuff()
				loadGamePlay()
				sceneNo = 0
			else
				sceneFourState = 10
			end
			
			resetFade()
		end
	elseif st == 10 then
		aydinlat(dt)
		
		if sceneAydinlat then
			resetFade()
			sceneFourState = 11
		end
	elseif st == 11 then		
		if love.keyboard.isDown("space") then
			file:open('w')
			file:write("0")
			file:close()
			scnFourSnd:stop()
			love.graphics.reset()
			loadStuff()
			loadGamePlay()
			sceneNo = 0
		end
	end
 end
 
 function drawSceneFour(st)
	if st == 0 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(scn_7, 0, 0)
	elseif st == 1 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(scn_7, 0, 0)
	elseif st == 2 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(scn_8, 0, 0)
	elseif st == 3 then
		love.graphics.draw(scn_8, 0, 0)
	elseif st == 4 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(scn_8, 0, 0)
	elseif st == 5 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(scn_9, 0, 0)
	elseif st == 6 then
		love.graphics.draw(scn_9, 0, 0)
	elseif st == 7 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(scn_9, 0, 0)
	elseif st == 8 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(scn_10, 0, 0)
	elseif st == 9 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(scn_10, 0, 0)
	elseif st == 10 then
		love.graphics.setColor(255, 255, 255, aScene)
		love.graphics.draw(tut_2, 0, 0)
	elseif st == 11 then
		love.graphics.draw(tut_2, 0, 0)
	end
	
	love.graphics.print(sceneFourState)
 end
 
 function aydinlat(dt)
	aScene = aScene + dt * 80
	
	if aScene > 254 then
		aScene = 255
		sceneAydinlat = true
	end
 end
 
 function karart(dt)
	aScene = aScene - dt * 80
	
	if aScene < 1 then
		aScene = 0
		sceneKarart = true
	end
 end