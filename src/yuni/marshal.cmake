ynmessage(":: module marshal (object serialization)")

add_library(libyuni_marshal_static STATIC EXCLUDE_FROM_ALL
	private/marshal/json/grammar.cpp
	private/marshal/json/grammar.h
	private/marshal/json/grammar.hxx
	private/marshal/json/internal-charsets.hxx
	private/marshal/json/internal-dfa.hxx
	private/marshal/json/internal-lalr.hxx
	private/marshal/json/internal-productions.hxx
	private/marshal/json/internal-symbols.hxx
	private/marshal/json/internal-table.hxx
	private/marshal/json/symbols.h

	marshal/fwd.h
	marshal/document.h
	marshal/document.cpp
	marshal/object.h
	marshal/object.hxx
	marshal/object.cpp
)
target_link_libraries(libyuni_marshal_static PUBLIC yuni_core_static)
target_include_directories(libyuni_marshal_static PRIVATE "..")
