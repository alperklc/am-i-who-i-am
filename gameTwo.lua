 function updateGameTwo(st, dt)
	gmSnd:play()
	
	if st == 0 then
		gameState = 1
		gameTwoState = 1
		
		hero={}
		hero.x = 350    
		hero.y = 448
		hero.speed = 300
		
		rect={60,90}

		memoPosition = {0,0}
		
		isGood = true
		
		memoPos = {1, 1}    -- 670, 540 
				
		acc = 0.35
		t = 1
		
		dir=0
		d=true
		
		timeCounter = 0
		
		memoTable={}

		siyahRectangleHeight = 550
		
	elseif st == 1 then
		charAnim2:update(dt)
		
		hero.x = hero.x + (dt * hero.speed) * dir
		
		if timeCounter > 50  then
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
			timeCounter = timeCounter + dt * 220
		end	
	
		updateTwo(dt)
		
		if gameState == 2 then
			gmSnd:stop()
			sceneNo = 5
		end
	end
 end
 
 function drawGameTwo(st)
	if st == 1 then
		love.graphics.draw(game_back_2, 0, 0)
		
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
			charAnim2:draw(hero.x, hero.y, 0, -1, 1, 30)
		elseif love.keyboard.isDown("d") then
			if hero.x >= 750 then
				dir = 0
			else
				dir = 1
			end
			
			d = true
			charAnim2:draw(hero.x, hero.y, 0, 1, 1, 30)
		else
			dir = 0
			if d == true  then
				love.graphics.draw(heroStable2, hero.x, hero.y, 0, 1, 1, 25)
			else
				love.graphics.draw(heroStable2, hero.x, hero.y, 0, -1, 1, 25)
			end
		end
		
		drawTwo()		
		
		love.graphics.draw(game_back_bar, 0, 0)
	end
 end
 
 function drawTwo()
	for _, i in pairs(memoTable) do
		if i[3] then
			if i[4]> 3 then
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


function updateTwo(dt)
	for inX, i in pairs(memoTable) do
		i[2] = i[2] + i[5] * i[5] * acc
		i[5] = i[5] + dt
		
		memoPosition = {i[1], i[2]}
		heroPos = {hero.x - 30, hero.y}
		
		if rectImgColl(rect, badMemo, heroPos , memoPosition) then
			table.remove(memoTable, inX)
			
			if i[3] then
				goodGet:play()
				
				if siyahRectangleHeight > 70 then		 
					siyahRectangleHeight = siyahRectangleHeight - 10
				elseif siyahRectangleHeight  <= 100 then
					gameState = 2															-- global game state changer		
				end	
			else
				badGet:play()
				
				if siyahRectangleHeight < 550 then
					siyahRectangleHeight = siyahRectangleHeight + 50
				end	
				if siyahRectangleHeight > 550 then
					siyahRectangleHeight = 550
				end
			end
		end
	end
end