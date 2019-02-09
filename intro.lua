 function updateIntro(st, dt)
	logoAnim:play()
	
	if st == 0 then
		introSnd:play()
		
		if r > 1 then
			r = r - dt * 200
			if r < 0 then
				r = 0
			end 			
		else
			introState = 1
		end
			
		g = 0
		b = 0
		love.graphics.setBackgroundColor( r, g, b )
		
	elseif st == 1 then
		if logoY > 150 then
			logoY = logoY - dt * 100
		else
			introState = 2
		end
	elseif st == 2 then
		if love.keyboard.isDown("space") then
			click:setVolume(0.5)
			click:play()
			introState = 3
		elseif love.keyboard.isDown("p") and won then
			click:setVolume(0.5)
			click:play()
			introSnd:stop()
			endless = true
			introState = 3
		end
	elseif st == 3 then
		logoAnim:update(dt)
		
		alpha = alpha - dt * 100
		
		if alpha < 1 then
			love.graphics.reset()
			
			introState = 4
		end
		
		if endless then
			sceneNo = 8
		end
	elseif st == 4 then
		if love.keyboard.isDown("space") then
			sceneNo = 1
		end
	end
end

function drawIntro(st)
	if st == 1 then
		love.graphics.draw(logo, 120, logoY)
	elseif st == 2 then
		love.graphics.draw(logo, 120, logoY)
		love.graphics.draw(txt, 283, 300)
		
		if won then
			love.graphics.draw(txt_2, 257, 350)
		end
	elseif st == 3 then
		logoAnim:draw(134, logoY + 68, 0, 1, 1, 0, 0)
		love.graphics.setColor(255, 255, 255, alpha)
		love.graphics.draw(logo, 120, logoY)
		love.graphics.draw(txt, 283, 300)
		if won then
			love.graphics.draw(txt_2, 257, 350)
		end
	elseif st == 4 then
		love.graphics.draw(tut, 0, 0)
	end
end