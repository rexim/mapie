test1 :: PathMaps
test1 = [PathMap { pathMapSource = "/tmp/a.txt"
                 , pathMapDest   = "/tmp/a.txt"
                 }
        ]

test2 :: PathMaps
test2 = [ PathMap { pathMapSource = "/tmp/a.txt"
                  , pathMapDest   = "/tmp/a.txt"
                  }

        , PathMap { pathMapSource = "/tmp/foo.txt"
                  , pathMapDest   = "/tmp/foo.txt"
                  }

        , PathMap { pathMapSource = "/tmp/herp.txt"
                  , pathMapDest   = "/tmp/herp.txt"
                  }

        , PathMap { pathMapSource = "/tmp/derp.png"
                  , pathMapDest   = "/tmp/derp.png"
                  }
        ]

test3 = forkMap ["/hello", "/world"] copyTo . pathContains "txt"

lwjglFiles = [ "macosx/liblwjgl.jnilib"
             , "macosx/openal.dylib"
             , "linux/libopenal.so"
             , "linux/libopenal64.so"
             , "linux/liblwjgl64.so"
             , "linux/liblwjgl.so"
             , "windows/lwjgl64.dll"
             , "windows/OpenAL32.dll"
             , "windows/lwjgl.dll"
             , "windows/OpenAL64.dll"
             , "solaris/libopenal.so"
             , "solaris/libopenal64.so"
             , "solaris/liblwjgl64.so"
             , "solaris/liblwjgl.so"
             ]

copyOsLibs name = pathContains name |> forkMap [name ++ "/x86/", name ++ "/x86_64/"] copyTo
repackLwjglNatives = forkMap ["macosx", "linux", "windows"] copyOsLibs
