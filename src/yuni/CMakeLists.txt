if(CMAKE_BUILD_TOOL MATCHES "(msdev|devenv|nmake)")
    add_definitions(/W2)
elseif(CMAKE_COMPILER_IS_GNUCXX)
	add_definitions("-W" "-Wall" "-Wextra")
endif()


include("core.cmake")
include("algorithm.cmake")
include("dbi.cmake")
include("marshal.cmake")
include("uuid.cmake")
