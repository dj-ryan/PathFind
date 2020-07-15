    
--    player = {yPlayerLocation}{}
    
    
    
--    function Player:
    
    
    
    
    -- size
    math.randomseed(os.time())
    --Y = math.random(3,100)
    --X = math.random(3,100)
    X = 20
    Y = 20
    
    size = Y * X
    playerValue = X + Y
    enemyValue = 0
    

    matrix = {}          -- create the matrix
    for i=1,Y do
      matrix[i] = {}     -- create a new row
      for j=1,X do
        matrix[i][j] = 0
      end
    end
    

    yBound = Y - 1
    xBound = X - 1
    
    
    yPlayerLocation = math.random(2,yBound)
    xPlayerLocation = math.random(2,xBound)
    
    yEnemyLocation = math.random(2,yBound)
    xEnemyLocation = math.random(2,xBound)
    
    matrix[yPlayerLocation][xPlayerLocation] = playerValue
    

    

    
    for i=1,Y do
      for j=1,X do
        if (not(i == yPlayerLocation and j == xPlayerLocation)) then
          if i <= yPlayerLocation and j <= xPlayerLocation then
            yDif = yPlayerLocation - i
            xDif = xPlayerLocation - j
            matrix[i][j] = playerValue - (yDif + xDif)
          elseif (i <= yPlayerLocation and j > xPlayerLocation) then
            yDif = yPlayerLocation - i
            xDif = xPlayerLocation - j
            matrix[i][j] = playerValue - (yDif - xDif)
          elseif (i > yPlayerLocation and j <= xPlayerLocation) then
            yDif = yPlayerLocation - i
            xDif = xPlayerLocation - j
            matrix[i][j] = playerValue - (xDif - yDif)
          elseif (i > yPlayerLocation and j > xPlayerLocation) then
            yDif = yPlayerLocation - i
            xDif = xPlayerLocation - j
            matrix[i][j] = playerValue + (yDif + xDif)
          end
        end
      end
    end
    
    
--    BOX MAKER

  boxWidth = 6
  boxHight = 6
  yBoxStart = 7
  xBoxStart = 7
  
  for i=yBoxStart,(yBoxStart + boxHight) do
    for j=xBoxStart,(xBoxStart + boxWidth) do
      -- matrix[i][j] = matrix[i][j] - 1
      matrix[i][j] = 0
    end
  end

    
  print("N: " .. Y .. " M: " .. X)
  print("Size: " .. size)
  print("Player start location: Y:" .. yPlayerLocation .. " X: " .. xPlayerLocation)
  print("Player value: " .. playerValue)
  print("Enemy start location: Y:" .. yEnemyLocation .. " X: " .. xEnemyLocation)
    for i=1,Y do
      print()
      for j=1,X do
        io.write(matrix[i][j] .. "\t")
      end
    end
    print()
    
        
--      while (not(xEnemyLocation == xPlayerLocation and yEnemyLocation == yPlayerLocation)) do
--        print("Enemy location: Y:" .. yEnemyLocation .. " X: " .. xEnemyLocation)
--        if matrix[yEnemyLocation + 1][xEnemyLocation] > matrix[yEnemyLocation][xEnemyLocation] then
--          if matrix[yEnemyLocation][xEnemyLocation + 1] > matrix[yEnemyLocation][xEnemyLocation] then
--            if (matrix[yEnemyLocation + 1][xEnemyLocation + 1] ~= 0) then 
--              yEnemyLocation = yEnemyLocation + 1
--              xEnemyLocation = xEnemyLocation + 1
--            else 
--              yEnemyLocation = yEnemyLocation + 1
--            end
--          elseif matrix[yEnemyLocation][xEnemyLocation - 1] > matrix[yEnemyLocation][xEnemyLocation] then
--            if (matrix[yEnemyLocation + 1][xEnemyLocation - 1] ~= 0) then 
--              yEnemyLocation = yEnemyLocation + 1
--              xEnemyLocation = xEnemyLocation - 1
--            else
--              yEnemyLocation = yEnemyLocation + 1
--            end
--          else
--            yEnemyLocation = yEnemyLocation + 1
--          end
--        elseif matrix[yEnemyLocation - 1][xEnemyLocation] > matrix[yEnemyLocation][xEnemyLocation] then
--          if matrix[yEnemyLocation][xEnemyLocation + 1] > matrix[yEnemyLocation][xEnemyLocation] then
--            if (matrix[yEnemyLocation - 1][xEnemyLocation + 1] ~= 0) then 
--              yEnemyLocation = yEnemyLocation - 1
--              xEnemyLocation = xEnemyLocation + 1
--            else
--              yEnemyLocation = yEnemyLocation - 1
--            end
--          elseif matrix[yEnemyLocation][xEnemyLocation - 1] > matrix[yEnemyLocation][xEnemyLocation] then
--            if (matrix[yEnemyLocation - 1][xEnemyLocation - 1] ~= 0) then
--              yEnemyLocation = yEnemyLocation - 1
--              xEnemyLocation = xEnemyLocation - 1
--            else
--              yEnemyLocation = yEnemyLocation - 1
--            end
--          else
--            yEnemyLocation = yEnemyLocation - 1
--          end
--        else
--          if matrix[yEnemyLocation][xEnemyLocation + 1] > matrix[yEnemyLocation][xEnemyLocation] then
--            xEnemyLocation = xEnemyLocation + 1
--          elseif matrix[yEnemyLocation][xEnemyLocation - 1] > matrix[yEnemyLocation][xEnemyLocation] then
--            xEnemyLocation = xEnemyLocation - 1
--          end
--        end
--      end


  while (not(xEnemyLocation == xPlayerLocation and yEnemyLocation == yPlayerLocation)) do
    yPlayerLocation = math.random(2,yBound)
    xPlayerLocation = math.random(2,xBound)
    
    print("New Player start location: Y:" .. yPlayerLocation .. " X: " .. xPlayerLocation)
    
    for i=1,Y do
      for j=1,X do
        if (not(i == yPlayerLocation and j == xPlayerLocation)) then
          if i <= yPlayerLocation and j <= xPlayerLocation then
            yDif = yPlayerLocation - i
            xDif = xPlayerLocation - j
            matrix[i][j] = playerValue - (yDif + xDif)
          elseif (i <= yPlayerLocation and j > xPlayerLocation) then
            yDif = yPlayerLocation - i
            xDif = xPlayerLocation - j
            matrix[i][j] = playerValue - (yDif - xDif)
          elseif (i > yPlayerLocation and j <= xPlayerLocation) then
            yDif = yPlayerLocation - i
            xDif = xPlayerLocation - j
            matrix[i][j] = playerValue - (xDif - yDif)
          elseif (i > yPlayerLocation and j > xPlayerLocation) then
            yDif = yPlayerLocation - i
            xDif = xPlayerLocation - j
            matrix[i][j] = playerValue + (yDif + xDif)
          end
        end
      end
    end
    
    boxWidth = 6
    boxHight = 6
    yBoxStart = 7
    xBoxStart = 7
  
    for i=yBoxStart,(yBoxStart + boxHight) do
      for j=xBoxStart,(xBoxStart + boxWidth) do
        -- matrix[i][j] = matrix[i][j] - 1
        matrix[i][j] = 0
      end
    end
    
    for i=1,10 do
      if (not(xEnemyLocation == xPlayerLocation and yEnemyLocation == yPlayerLocation)) then
        print("Enemy location: Y:" .. yEnemyLocation .. " X: " .. xEnemyLocation)
        if matrix[yEnemyLocation + 1][xEnemyLocation] > matrix[yEnemyLocation][xEnemyLocation] then
          if matrix[yEnemyLocation][xEnemyLocation + 1] > matrix[yEnemyLocation][xEnemyLocation] then
            if (matrix[yEnemyLocation + 1][xEnemyLocation + 1] ~= 0) then 
              yEnemyLocation = yEnemyLocation + 1
              xEnemyLocation = xEnemyLocation + 1
            else 
              yEnemyLocation = yEnemyLocation + 1
            end
          elseif matrix[yEnemyLocation][xEnemyLocation - 1] > matrix[yEnemyLocation][xEnemyLocation] then
            if (matrix[yEnemyLocation + 1][xEnemyLocation - 1] ~= 0) then 
              yEnemyLocation = yEnemyLocation + 1
              xEnemyLocation = xEnemyLocation - 1
            else
              yEnemyLocation = yEnemyLocation + 1
            end
          else
            yEnemyLocation = yEnemyLocation + 1
          end
        elseif matrix[yEnemyLocation - 1][xEnemyLocation] > matrix[yEnemyLocation][xEnemyLocation] then
          if matrix[yEnemyLocation][xEnemyLocation + 1] > matrix[yEnemyLocation][xEnemyLocation] then
            if (matrix[yEnemyLocation - 1][xEnemyLocation + 1] ~= 0) then 
              yEnemyLocation = yEnemyLocation - 1
              xEnemyLocation = xEnemyLocation + 1
            else
              yEnemyLocation = yEnemyLocation - 1
            end
          elseif matrix[yEnemyLocation][xEnemyLocation - 1] > matrix[yEnemyLocation][xEnemyLocation] then
            if (matrix[yEnemyLocation - 1][xEnemyLocation - 1] ~= 0) then
              yEnemyLocation = yEnemyLocation - 1
              xEnemyLocation = xEnemyLocation - 1
            else
              yEnemyLocation = yEnemyLocation - 1
            end
          else
            yEnemyLocation = yEnemyLocation - 1
          end
        else
          if matrix[yEnemyLocation][xEnemyLocation + 1] > matrix[yEnemyLocation][xEnemyLocation] then
            xEnemyLocation = xEnemyLocation + 1
          elseif matrix[yEnemyLocation][xEnemyLocation - 1] > matrix[yEnemyLocation][xEnemyLocation] then
            xEnemyLocation = xEnemyLocation - 1
          end
        end
      else
        print("Enemy location after search: Y:" .. yEnemyLocation .. " X: " .. xEnemyLocation)
        break
      end
    end
  end
    -- print("Enemy location after search: Y:" .. yEnemyLocation .. " X: " .. xEnemyLocation)
  
    
    
    
    
    
    