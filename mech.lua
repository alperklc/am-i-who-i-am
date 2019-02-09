function imgColl(imgA, imgB, pointA, pointB)	
	return  pointA[1] < pointB[1] + imgB:getWidth() 
		and pointB[1] < pointA[1] + imgA:getWidth()
		and pointA[2] < pointB[2] + imgB:getHeight()
		and pointB[2] < pointA[2] + imgA:getHeight()
end

function rectImgColl(whA, imgB, pointA, pointB)
	return  pointA[1] < pointB[1] + imgB:getWidth() 
		and pointB[1] < pointA[1] + whA[1]
		and pointA[2] < pointB[2] + imgB:getHeight()
		and pointB[2] < pointA[2] + whA[2]
end

function rectColl(whA, whB, pointA, pointB)
	return  pointA[1] < pointB[1] + whB[1] 
		and pointB[1] < pointA[1] + whA[1]
		and pointA[2] < pointB[2] + whB[2]
		and pointB[2] < pointA[2] + whA[2]
end