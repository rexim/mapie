module Transformers where

import Data.Maybe
import Data.List
    
import Core

pathContains :: String -> PathMapsT
pathContains ss pathMaps =
    filter (isJust . find (==ss) . subsequences . pathMapDest) pathMaps

fork :: [PathMapsT] -> PathMapsT
fork ts = (\pathMaps -> concatMap (\t -> t pathMaps) ts)

forkMap :: [a] -> (a -> PathMapsT) -> PathMapsT
forkMap xs t = fork $ map t xs

copyTo :: String -> PathMapsT
copyTo dest pathMaps = map (\pathMap -> pathMap { pathMapDest = dest }) pathMaps
