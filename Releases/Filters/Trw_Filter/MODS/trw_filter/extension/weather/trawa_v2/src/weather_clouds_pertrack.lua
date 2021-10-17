-- Calculates base Y coordinate of a cloud from a circle of clouds near horizon
calculateHorizonCloudYCoordinate = ({
  spa = function (dir) return 20 end,
  ks_laguna_seca = function (dir) return 22 end
})[ac.getTrackId()] or function (pos) return 12 end
