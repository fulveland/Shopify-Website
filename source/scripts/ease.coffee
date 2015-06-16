angular.module "Ease", []

.service "Ease", (PureMath)->
  return Ease =
    
    linear: (input, inputMin = 0, inputMax = 1, outputMin = 0, outputMax = 1, clip = true)->
      return outputMin if inputMin is inputMax # Avoids a divide by zero
      input = PureMath.clip(input, inputMin, inputMax) if clip
      input -= inputMin
      input /= inputMax - inputMin
      input *= outputMax - outputMin
      input += outputMin
      return input
      
    cubic: (input, inputMin = 0, inputMax = 1, outputMin = 0, outputMax = 1, clip = true)->
      Ease.power(input, 3, inputMin, inputMax, outputMin, outputMax, clip)

    power: (input, power = 1, inputMin = 0, inputMax = 1, outputMin = 0, outputMax = 1, clip = true)->
      return outputMin if inputMin is inputMax # Avoids a divide by zero
      input = PureMath.clip(input, inputMin, inputMax) if clip
      outputDiff = outputMax - outputMin
      inputDiff = inputMax - inputMin
      p = (input-inputMin) / (inputDiff/2)
      if p < 1
        return outputMin + outputDiff/2 * Math.pow(p, power)
      else
        return outputMin + outputDiff/2 * (2 - Math.abs(Math.pow(p-2, power)))
