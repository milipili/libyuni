ynmessage(":: module algorithm")

add_library(libyuni_algorithm_static STATIC EXCLUDE_FROM_ALL
	algorithm/luhn.h
	algorithm/luhn.hxx
	algorithm/luhn.cpp
)
target_link_libraries(libyuni_algorithm_static PUBLIC libyuni_core_static)
