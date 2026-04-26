---
layout: post
title: "On The Math Of \"Dragonsweeper\""
date: 2026-04-21
categories: [blog]
---

Recently, a game called [Dragonsweeper](https://danielben.itch.io/dragonsweeper) has been featured by several gaming YouTubers and live streamers.
It's a fun experience, and you can play it for free right now in your browser.
If you've already played it, feel free to skip the rest of this section.

The concept of the game is based on the classic [Minesweeper](https://en.wikipedia.org/wiki/Minesweeper_(video_game)), which is probably best known by being one of the pre-installed games on older Windows systems, but given a fantasy RPG theme.

A 13x10 grid is generated with mostly enemies and a few special tiles, which we will come to later.
At the start, the entire grid is hidden, except for a diamond shape at your (random) starting position, and the name-providing dragon at the center, which has to be slain to win the game.
For the gameplay loop, you click on tiles in the grid, revealing their content and, in case it is one of the many aforementioned enemies, you battle them.

![Screenshot of the board](/assets/dragonsweeper-2.png)

A "battle" is simple: Each enemy has a "value" from 1 to 11. Your character, "Jorge", loses that many hit points.
If Jorge survives, you can collect the same number in gold coins, which allow you to level up.
If Jorge's hit points reach a negative value (0 is fine), you lose the game and have to start over.
Leveling up fully heals you and gives you a boost to your max hit points as well.

# Basic Math & Strategy

Jorge starts the game with 5 hit points and requires 4 gold coins to level up.
It sounds simple: you could fight an enemy of value 4 (or any combination of smaller enemies), leaving you at 1 hit point and enough gold coins to level up. 
The difficulty comes from the fact that gold requirements for level ups grow more quickly than Jorge's hit points.
There seems to be no formula, but the values are:

<table>
  <tr>
    <th>Level</th>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <td>4</td>
    <td>5</td>
    <td>6</td>
    <td>7</td>
    <td>8</td>
    <td>9</td>
    <td>10</td>
    <td>11</td>
    <td>12</td>
    <td>13</td>
    <td>14</td>
    <td>15</td>
    <td>16</td>
    <td>17</td>
  </tr>
  <tr>
    <th>Hit Points</th>
    <td>5</td>
    <td>5</td>
    <td>6</td>
    <td>6</td>
    <td>7</td>
    <td>7</td>
    <td>8</td>
    <td>8</td>
    <td>9</td>
    <td>9</td>
    <td>10</td>
    <td>10</td>
    <td>11</td>
    <td>11</td>
    <td>12</td>
    <td>12</td>
    <td>13</td>
  </tr>
  <tr>
    <th>Gold for next level</th>
    <td>4</td>
    <td>5</td>
    <td>7</td>
    <td>9</td>
    <td>9</td>
    <td>10</td>
    <td>12</td>
    <td>12</td>
    <td>12</td>
    <td>15</td>
    <td>18</td>
    <td>21</td>
    <td>21</td>
    <td>25</td>
    <td>25</td>
    <td>25</td>
    <td>25</td>
  </tr>
</table>

When reaching level 17 and 13 hit points, you can slay the dragon and beat the game, unless you want to go for a high score.
After that, every level up requires 25 gold coins.

Already at level 3, you require more gold coins than Jorge has hit points, so you cannot level up by battling monsters alone.
(Since gold coins carry over during level up, if you max out on levels 1 and 2, you can still reach level 4 by carry-over, but no more.)

In total, assuming you max out every level, i.e. only level up once Jorge's hit points reach exactly zero, there is a difference of 94 between required gold coins and available hit points to beat the game.

The first option to continue playing here, is to use one of the 9 health scrolls, which restore Jorge's hit points without gaining gold coins. 
This is a suboptimal strategy though, since you can think of the health scrolls as having the same value as Jorge's max hit points when activated. 
So, to maximize your chances at winning and reaching a high score, you want to save the health scrolls for as long as possible.

The second option other than battling is to collect "free" gold coins. There are several tiles that do so:
- There are [three chests](https://itch.io/post/12116813) providing 5 gold coins each.
- There is one egg, which, as far as I could tell, always spawns next to the dragon, and provides 3 gold coins.
- The gnome sits on an empty space and, when revealed, teleports randomly to another one. If there are no more empty spaces, it provides 9 gold coins.
- The "Lich" enemy, when defeated, deactivates all the 9 mines on the board. Collecting them gives 3 gold coins each.

The total amount of non-battle gold coins available sums up to 54 gold coins.
That leaves only 40 coins missing that you need to gain by using health scrolls. 
As said earlier, there are 9 of those, so even if you were to use them all at level 1, you would gain 45 extra coins, giving you enough to beat the dragon.

Of course, that's a simplified view, since you aren't able to discover all 9 health scrolls at level 1. 
But it does reveal the main strategy of the game: It's not about beating monsters, as one might intuitively think when starting to play. 
It's actually about avoiding as much combat as possible to find the special gold tiles and health scrolls.

# Achievements

At the time that I am writing this, there are four "achievements" listed in the game:
- Lovers Survive: Win without battling either Romeo or Juliet.
- Clear Board: clear every single tile from the board.
- Future Generation: Win without destroying the egg.
- Rat Pacifist: Win without battling any rats (rat king is okay).

"Clear Board" and the other three achievements are mutually exclusive, as they are opposite challenges.
"Rat Pacifist", while removing the advantage of the Rat King and making the game more luck-based, does not really change the math.

Assuming you want to do "Lovers Survive" and "Future Generation" at the same time, what would change? 
Each of the two "lovers" drops a health scroll, and the egg provides 3 gold coins, so you are down to at most 51 coins and 7 health scrolls.
That means you need to gain at least 43 coins from those scrolls, averaging at about 6 per scroll.
Again, not really that difficult. The real challenge comes from surviving long enough to actually find the scrolls, and from not destroying the egg by chance.

"Clear Board" is more a bit more interesting. The game is nice enough to provide a list of all enemies on the board.

![List of enemies](/assets/dragonsweeper-1.png)

The Beholder-esque creature is labeled "x?" but in my tests, it always spawned two times. 
That gives a total combined value of all enemies of: 292.

Not mentioned before, there are also six "wall" tiles in each game. 
For this purpose, they can basically be considered as enemies with combat value 3 that only yield 1 gold coin after defeat.
If you want to battle every enemy and every wall, it will cost Jorge 292 + 6*3 = 310 hit points.

The total amount of gold you can reach is thus 292 + 54 + 6 + 13 (for the dragon) = 365, which is also the highest possible score shown on the victory screen.

<table>
  <tr>
    <th>Level</th>
    <td>15</td>
    <td>16</td>
    <td>17</td>
    <td>18</td>
    <td>19</td>
    <td>20</td>
    <td>21</td>
    <td>22</td>
  </tr>
  <tr>
    <th>Hit Points</th>
    <td>12</td>
    <td>12</td>
    <td>13</td>
    <td>13</td>
    <td>14</td>
    <td>14</td>
    <td>15</td>
    <td>15</td>
  </tr>
  <tr>
    <th>Cumulative Hit Points</th>
    <td>124</td>
    <td>136</td>
    <td>149</td>
    <td>162</td>
    <td>176</td>
    <td>190</td>
    <td>205</td>
    <td>220</td>
  </tr>
  <tr>
    <th>Total gold to reach</th>
    <td>180</td>
    <td>205</td>
    <td>230</td>
    <td>255</td>
    <td>280</td>
    <td>305</td>
    <td>330</td>
    <td>355</td>
  </tr>
</table>

The highest level you can reach is 22, giving you a total of 220 hit points to use and gain 220 gold coins from battles without scrolls.
Compared to the 310 hit points required to battle all enemies, you are still missing 90 hit points to reach the max score.
These, you have to get from the 9 health scrolls, averaging at a value of 10 per scroll. 
That's actually a challenge - any scroll you use before reaching level 11, quite far into the game already, has been used "below value".

# Hats off to the developer

When I started playing the game, even though I have spent quite a bit of time on Minesweeper in the past, I felt frustrated because it felt like Dragonsweeper is very much based on chance, and that you, as the player, have little influence on whether you will actually win.
After coming back to it though and looking at the math, I can actually respect the effort that must have gone into it. 
Just the fact that the gold coins required to level up are not a linear or quadratic formula, but seem to be a hand-crafted list of values, makes me appreciate it more.
