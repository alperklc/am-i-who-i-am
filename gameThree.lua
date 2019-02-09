 function updateGameThree(st, dt)
	gmThreeSnd:play()
	
	if st == 0 then
		memoPicNo= 0
		gameState = 1
		gameThreeState = 1
		
		hero={}
		hero.x = 350    
		hero.y = 448
		hero.speed = 250
		
		rect={60,90}

		memoPosition = {0,0}
		
		isGood = true
		
		memoPos = {0, 0}    -- 670, 540 
		
		acc = 0.30
		t = 1
		
		dir=0
		d=true
		
		timeCounter = 0
		
		memoTable = {}
		

		siyahRectangleHeight = 550
		
		
		
	elseif st == 1 then
		charAnim3:update(dt)
		
		hero.x = hero.x + (dt * hero.speed) * dir
	
		if  timeCounter > 50  then
			timeCounter = 0
			
			memoPos[1] = math.random(4, 20) * 30 
			if math.random(0,2) == 1 then
				isGood = true
				memoPicNo = math.random(0,4)		
			else
				isGood = false
			end
			
			table.insert(memoTable, {memoPos[1], memoPos[2], isGood, memoPicNo, t})
		else  
			timeCounter = timeCounter + 60 * dt
		end	
		
		updateThree(dt)
		
		if gameState == 2 then
			gmThreeSnd:stop()
			sceneNo = 7
		end
	end
 end
 
 function drawGameThree(st)
	if st == 1 then
		love.graphics.draw(game_back_3, 0, 0)
		
		love.graphics.setColor(255, 0, 0)	   --kirmizi rectangle icin renk ayari
		love.graphics.rectangle("fill", 30, 0, 50, 600)	--kirmizi rectangle	
		
		love.graphics.setColor(0, 0, 0)		
		love.graphics.rectangle("fill", 30, 10, 50, siyahRectangleHeight)--siyah rectangle
		
		love.graphics.setColor(255, 255, 255)
		
		if love.keyboard.isDown("a") then
			if hero.x <= 150 then
				dir = 0
			else
				dir = -1
			end
			
			d = false
			charAnim3:draw(hero.x, hero.y, 0, -1, 1, 30)
		elseif love.keyboard.isDown("d") then
			if hero.x >= 750 then
				dir = 0
			else
				dir = 1
			end
			
			d = true
			charAnim3:draw(hero.x, hero.y, 0, 1, 1, 30)
		else
			dir = 0
			if d == true  then
				love.graphics.draw(heroStable3, hero.x, hero.y, 0, 1, 1, 25)
			else
				love.graphics.draw(heroStable3, hero.x, hero.y, 0, -1, 1, 25)
			end
		end
		
		drawThree()		
		
		love.graphics.draw(game_back_bar, 0, 0)
	end
 end
 
 
 function drawThree()
	for _, i in pairs(memoTable) do
		if i[3] then
			if  i[4]> 3 then
				love.graphics.draw(goodMemo, i[1], i[2])
			elseif i[4] > 2 then
				love.graphics.draw(goodMemo1, i[1], i[2])
			elseif i[4] > 1 then
				love.graphics.draw(goodMemo2, i[1], i[2])
			else 
				love.graphics.draw(goodMemo3, i[1], i[2])
			end
		else
			love.graphics.draw(badMemo, i[1], i[2])
		end
	end
end
 
function updateThree(dt)
	
	for inX, i in pairs(memoTable) do			
		i[2] = i[2] + i[5] * i[5] * acc
		i[5] = i[5] + dt
		
		i[1] = i[1] + math.random(-10, 10)
		if i[1] < 120 then 
			i[1] = 120
		end
		if i[1] > 560 then 
			i[1] = 560
		end

		memoPosition = {i[1], i[2]}
		heroPos = {hero.x, hero.y}
		if rectImgColl(rect, badMemo, heroPos, memoPosition) then
			table.remove(memoTable, inX)
			
			if i[3] then
				goodGet:play()
				if siyahRectangleHeight > 50 then		 
					siyahRectangleHeight = siyahRectangleHeight - 25
					
				elseif siyahRectangleHeight  <= 75 then
					gameState = 2															-- global game state changer		
				end	
			else 
				badGet:play()
				if siyahRectangleHeight < 550 then
					siyahRectangleHeight = siyahRectangleHeight + 50
				end	
				if siyahRectangleHeight >550 then
					siyahRectangleHeight = 550
				end
			end
			memoVar = memoVar -1
		end
	end
end