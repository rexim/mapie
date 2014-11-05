module Core where

import Data.List
import Data.Maybe

data PathMap = PathMap { pathMapSource :: FilePath
                       , pathMapDest :: FilePath
                       }
type PathMaps = [PathMap]
type PathMapsT = PathMaps -> PathMaps

pathMap :: FilePath -> PathMap
pathMap filePath = PathMap { pathMapSource = filePath
                           , pathMapDest = filePath
                           }

