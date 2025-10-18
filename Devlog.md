## Yayy flappy square game in Lua
> I write this ! Ok ?

Bruh i was watching how to create simple flappy bird game in
Python with Pygame library

_And I decided to use Lua and LOVE2D engine_
**to create a challange for me xD**

__*Engine used: LOVE2D*__
_Language : Lua_
_Creator: nqzz ( Nguyen Quan )_

No logs for this project as i watched the tutorial and follow it
step by step, and adjusted to be suitable for Lua syntax

>> Anw, enjoy >_<

YT 24'30s

> 36:02
Next is to create a point system

*Eh I 've just known that there is only one bird so we dont need to use function to simulate object* 22:25 10/16/2025

Fake flappy bird cuz the bird and tubes were just geometrical shapes :)

After all i renamed this to Flappy Square

**_IMPORTANT NOTE: COMMENT ALL THE LOVE REQUIRE LINES IN ALL FILES WHEN COMPLETED_**

>> Development stage: uncomment the line: require 'love' to hide some nonsense warnings :>
_If completed comment the love requirements line in all files_

98% Completed at 21:12 10/17/2025
No chracter image, tube image, bg image yet !


_A little explaination about how the function_
_love.graphics.draw(img, x, y, r, sx, sy, ox, oy, ...) work_

Disclaimer: This is the way that I CAN UNDERSTAND, maybe not true
1. Modifying the image base on the r, sx, sy, ox, oy

A rectangular image has 4 vertices:

0, 0                   | top left
imgWidth, 0            | top right
0, imgHeight           | bottom left
imWidth, imgHeight     | bottom right

By default, when you do not add the r, ox, oy arguments
the system will set it to 0
means no rotation, and center of rotation is the 0, 0 point ( top left vertice )

2. Draw the image

First it starts at given X, Y position
then draws the center of rotation
and the remaining part

3. Problems i have faced

- To choose the right center of rotation

Ya at first i just put at the center of the outline rectangle
-> Failed

Then i tried to put at the center of the image
-> It drew the bottom part of the tube,
and i find out that the center of the image is at the draw point

Finally, i set the bottom right vertice as the center of rotation
-> Ayo it was really OK, no drawing error now

Then i wrote this note <***>

Finished this at 11:39 10/18/2025

--:-- --/--/----: Flappy square
--:-- --/--/----: Flappy bird classic:>
12:20 10/18/2025: New game ( or not ): Rainbow flappy square


