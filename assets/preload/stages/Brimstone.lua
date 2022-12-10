local t = 0
local s = 0

function onCreate()
    makeLuaSprite('bg', 'buried/brimstoneBack', 1075, 450)
    addLuaSprite('bg',false)
    setGraphicSize('bg', getProperty('bg.width') * 2.0)

    makeLuaSprite('floor', 'buried/floor', 1075, 450)
    addLuaSprite('floor',false)
    setGraphicSize('floor', getProperty('floor.width') * 2.0)

    makeLuaSprite('death', 'buried/graves', 1075, 450)
    addLuaSprite('death',false)
    setGraphicSize('death', getProperty('death.width') * 2.0)

    makeLuaSprite('Ui1', 'buried/buried_center', -75, 40)
    addLuaSprite('Ui1',false)
    setGraphicSize('Ui1', getProperty('Ui1.width') * 2.8)
    setObjectCamera('Ui1', 'hud')

    makeLuaSprite('Ui2', 'buried/buried_center opp', 825, 550)
    addLuaSprite('Ui2',false)
    setGraphicSize('Ui2', getProperty('Ui2.width') * 2.8)
    setObjectCamera('Ui2', 'hud')
end