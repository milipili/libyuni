ynmessage(":: module dbi")

add_library(libyuni_dbi_static STATIC EXCLUDE_FROM_ALL
	private/dbi/connector-data.h
	private/dbi/connector-data.hxx
	private/dbi/connector-data.cpp
	private/dbi/channel.h
	private/dbi/channel.hxx
	private/dbi/channel.cpp

	private/dbi/adapter/sqlite/sqlite3.c
	private/dbi/adapter/sqlite/sqlite3.h
	private/dbi/adapter/sqlite/sqlite3ext.h

	dbi/dbi.h
	dbi/connector-pool.h
	dbi/connector-pool.hxx
	dbi/connector-pool.cpp
	dbi/error.h
	dbi/fwd.h
	dbi/transaction.h
	dbi/transaction.hxx
	dbi/transaction.cpp
	dbi/auto-commit.h
	dbi/row.h
	dbi/row.hxx
	dbi/column.h
	dbi/column.hxx
	dbi/settings.h
	dbi/settings.hxx
	dbi/cursor.h
	dbi/cursor.hxx
	dbi/cursor.cpp
	dbi/utils.h
	dbi/utils.cpp

	dbi/adapter.h
	dbi/adapter/entries.h
	dbi/adapter/adapter.h
	dbi/adapter/sqlite.h
	dbi/adapter/sqlite.cpp
)
target_link_libraries(libyuni_dbi_static PUBLIC yuni_core_static)
target_include_directories(libyuni_dbi_static PRIVATE "..")

target_compile_definitions(libyuni_dbi_static
	PRIVATE
		"-DSQLITE_THREADSAFE=2"
		# This option enables the sqlite3_unlock_notify() interface and its associated functionality
		"-DSQLITE_ENABLE_UNLOCK_NOTIFY=1"
		# foreign keys !
		"-DSQLITE_DEFAULT_FOREIGN_KEYS=1"
		# full text search engine
		"-DSQLITE_ENABLE_FTS4"
		# omit UTF16 support
		"-DSQLITE_OMIT_UTF16"
)
if(CMAKE_BUILD_TOOL MATCHES "(msdev|devenv|nmake)")
	set_source_files_properties("private/dbi/adapter/sqlite/sqlite3.c" PROPERTIES COMPILE_FLAGS /nowarn)
elseif(CMAKE_COMPILER_IS_GNUCXX)
	set_source_files_properties("private/dbi/adapter/sqlite/sqlite3.c" PROPERTIES COMPILE_FLAGS -w)
endif()
