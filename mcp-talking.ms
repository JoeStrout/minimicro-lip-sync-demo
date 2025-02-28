clear
mainImage = file.loadImage("mcp.png")
gfx.drawImage mainImage, 480-mainImage.width/2, 320-mainImage.height/2

jawSprite = new Sprite
jawSprite.image = file.loadImage("mcp-jaw.png")
jawSprite.x = 541; jawSprite.y = 151
jawSprite2 = new Sprite
jawSprite2.image = jawSprite.image
jawSprite2.x = 411; jawSprite2.y = 151
display(4).sprites = [jawSprite, jawSprite2]

list.swap = function(i,j)
	temp = self[i]
	self[i] = self[j]
	self[j] = temp
end function
c = jawSprite2.corners
c.swap(0,1); c.swap(2,3)  // (flips the image horizontally)
jawSprite2.setCorners c

openMouth = function(amount)
	c = jawSprite.corners
	dy = 32 * amount
	c[0][1] = c[1][1] - dy  // bottom inner corner
	c[3][1] = c[2][1] - dy  // top inner corner
	jawSprite.setCorners c
	c = jawSprite2.corners
	c[0][1] = c[1][1] - dy  // bottom inner corner
	c[3][1] = c[2][1] - dy  // top inner corner
	jawSprite2.setCorners c
end function

speech = file.loadSound("happyNewYear.ogg")

speech.play
amount = 0
while speech.isPlaying
	a = speech.amp
	target = a * 5  // (found experimentally)
	amount = (amount + target*4) / 5
	openMouth amount
	yield
end while
openMouth 0