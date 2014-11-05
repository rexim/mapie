module Generator where

import Core

pathMapAsCp :: PathMap -> String
pathMapAsCp pathMap = "cp -fv " ++ pathMapSource pathMap ++ " " ++ pathMapDest pathMap

generateScript :: PathMaps -> String
generateScript pathMaps = unlines $ map pathMapAsCp pathMaps
