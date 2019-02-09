 function updateGameZero(st, dt)
	gmThreeSnd:play()
	
	if st == 0 then
		memoPicNo= 0
		gameState = 1
		gameZeroState = 1
		
		score = 0
		
		hero={}
		hero.x = 350    
		hero.y = 448
		hero.speed = 250
		
		rect={60,90}

		memoPosition = {0,0}
		
		isGood = true
		
		memoPos = {0, 0}    -- 670, 540 
		
		acc = 0.35
		t = 1
		
		dir=0
		d=true
		
		timeCounter = 0
		
		memoTable = {}
		est = 0

		siyahRectangleHeight = 550
		
	elseif st == 1 then
		charAnim3:update(dt)
		est = est + dt * 0.01
		
		hero.x = hero.x + (dt * hero.speed) * dir
		
		if  timeCounter > 50  then
			timeCounter = 0
			
			memoPos[1] = math.random(4, 20) * 30 
			if math.random(0,2) == 1 then
				isGood = true
				memoPicNo = 1		
			else
				isGood = false
			end
			
			table.insert(memoTable, {memoPos[1], memoPos[2], isGood, memoPicNo, t})
		else  
			timeCounter = timeCounter +  70 * dt + est
		end	
		
		updateZero(dt)
		
		if gameState == 2 then
			gmThreeSnd:stop()
			sceneNo = 7
		end
	end
 end
 
 function drawGameZero(st)
	if st == 1 then
		love.graphics.draw(game_back_1, 0, 0)
		
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
		
		drawZero()		
		
		love.graphics.draw(game_back_bar, 0, 0)
		
		love.graphics.print(score, 10, 10)
	end
 end
 
 function drawZero()
	for _, i in pairs(memoTable) do
		if i[3] then
			love.graphics.draw(goodFood, i[1], i[2])
		else
			love.graphics.draw(badFood, i[1], i[2])
		end
	end
end
 
function updateZero(dt)
	if love.keyboard.isDown("escape") then
		gmThreeSnd:stop()
		click:play()
		
		if score > tonumber(data) then
			love.filesystem.write( "sys.oge", score)
		end
		
		sceneNo = 9
	end
	
	for inX, i in pairs(memoTable) do			
		i[2] = i[2] + i[5] * i[5] * acc + est
		i[5] = i[5] + dt
		
		i[1] = i[1] + math.random(-est * 5, est * 5)
		if i[1] < 120 then 
			i[1]=120
		end
		if i[1] > 560 then 
			i[1] = 560
		end

		memoPosition = {i[1], i[2]}
		heroPos = {hero.x - 30, hero.y}
		if rectImgColl(rect, badMemo, heroPos, memoPosition) then
			table.remove(memoTable, inX)
			
			if i[3] then
				goodGet:play()
				score = score + 10
			else 
				badGet:play()
				if score > 30 then
					score = score - 30
				else
					score = 0
				end
			end
			memoVar = memoVar -1
		end
		
		if i[2] > 580 then
			table.remove(memoTable, inX)
		end
	end
end