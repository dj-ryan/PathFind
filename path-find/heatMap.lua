    math.randomseed(os.time())
    -- matrix size
    xSize = 10
    ySize = 10
    
    function isEdge (y, x)
        if y > ySize or y > ySize then
          return true
        elseif x > xSize or x < xSize then
          return true
        end
      return false
    end
    
    Entity = {}
    Entity.__index = Entity
    function Entity:Create(y,x)
        local this =
        {
            y = y,
            x = x,
        }
      setmetatable(this, Entity)
      return this
    end

    
    -- ++++++++++ Main ++++++++++
    
    
    matrixSize = ySize * xSize
    playerValue = ySize + xSize

    matrix = {}          -- create the matrix
    for i=1,ySize do
      matrix[i] = {}     -- create a new row
      for j=1,xSize do
        matrix[i][j] = 0
      end
    end
    
    yBound = ySize - 1
    xBound = xSize - 1
    
    player = Entity:Create(math.random(2,yBound),math.random(2,xBound))
    enemy = Entity:Create(math.random(2,yBound),math.random(2,xBound))

    for i=1,ySize do
      for j=1,xSize do
        if (not(i == player.y and j == player.x)) then
          if i <= player.y and j <= player.x then
            yDif = player.y - i
            xDif = player.x - j
            matrix[i][j] = playerValue - (yDif + xDif)
          elseif (i <= player.y and j > player.x) then
            yDif = player.y - i
            xDif = player.x - j
            matrix[i][j] = playerValue - (yDif - xDif)
          elseif (i > player.y and j <= player.x) then
            yDif = player.y - i
            xDif = player.x - j
            matrix[i][j] = playerValue - (xDif - yDif)
          elseif (i > player.y and j > player.x) then
            yDif = player.y - i
            xDif = player.x - j
            matrix[i][j] = playerValue + (yDif + xDif)
          end
        end
      end
    end
    
    
    
  print("Y size: " .. ySize .. " X size: " .. xSize)
  print("Area: " .. matrixSize)
  print("Player start location: Y:" .. player.y .. " X: " .. player.x)
  print("Player value: " .. playerValue)
  print("Enemy start location: Y:" .. enemy.y .. " X: " .. enemy.x)
  for i=1,ySize do
    for j=1,xSize do
      io.write(matrix[i][j] .. "\t")
    end
  print()
  end
   
