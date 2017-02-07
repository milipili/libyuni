ynmessage(":: module uuid")

if (NOT APPLE AND NOT WIN32)
	find_path(uuid_incl_dir NAMES
		uuid/uuid.h PATHS /usr/include /usr/local/include /opt/local/include /sw/include)
	if(NOT uuid_incl_dir)
		ynmessage("   uuid disabled (requires uuid/uuid.h)")
		return()
	endif()
endif()

add_library(libyuni_uuid_static STATIC EXCLUDE_FROM_ALL
	uuid/uuid.h
	uuid/uuid.hxx
	uuid/uuid.cpp
	uuid/fwd.h
)
target_link_libraries(libyuni_uuid_static PUBLIC yuni_core_static)
if (uuid_incl_dir)
	target_include_directories(libyuni_uuid_static PRIVATE "${uuid_incl_dir}")
endif()

if (APPLE)
	target_link_libraries(libyuni_uuid_static PUBLIC CoreFoundation)
elseif(WIN32)
	target_link_libraries(libyuni_uuid_static PUBLIC ole32 rpcrt4)
endif()
