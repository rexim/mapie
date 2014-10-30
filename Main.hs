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

pathMapAsCp :: PathMap -> String
pathMapAsCp pathMap = "cp -fv " ++ pathMapSource pathMap ++ " " ++ pathMapDest pathMap

generateScript :: PathMaps -> String
generateScript pathMaps = unlines $ map pathMapAsCp pathMaps

pathContains :: String -> PathMapsT
pathContains ss pathMaps = filter (isJust . find (==ss) . subsequences . pathMapDest) pathMaps

fork :: [PathMapsT] -> PathMapsT
fork ts = (\pathMaps -> concatMap (\t -> t pathMaps) ts)

forkMap :: [a] -> (a -> PathMapsT) -> PathMapsT
forkMap xs t = fork $ map t xs

copyTo :: String -> PathMapsT
copyTo dest pathMaps = map (\pathMap -> pathMap { pathMapDest = dest }) pathMaps
