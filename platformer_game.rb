require 'ruby2d'

set width: 1104
set height: 621

WALK_SPEED = 4

background = Image.new('background.png')

hero = Sprite.new(
  'hero.png',
  width: 78,
  height: 99,
  clip_width: 78,
  time: 250,
  y: 300,
  animations: {
    walk: 1..2,
    climb: 3..4,
    cheer: 5..6
  }
)

on :key_held do |event|
  case event.key
    when 'left'
      hero.play animation: :walk, loop: true, flip: :horizontal
      
      if hero.x > 0
        hero.x -= WALK_SPEED
      else
        if background.x < 0
          background.x += WALK_SPEED
        end
      end
    when 'right'
      hero.play animation: :walk, loop: true

      if hero.x < (Window.width - hero.width)
        hero.x += WALK_SPEED
      else
        if (background.x - Window.width) > -background.width
          background.x -= WALK_SPEED
        end
      end
    when 'up'
      hero.play animation: :climb, loop: true
    when 'down'
      hero.play animation: :climb, loop: true, flip: :vertical
    when 'c'
      hero.play animation: :cheer
  end
end

on :key_up do
  hero.stop 
end

show