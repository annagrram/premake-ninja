require "ninja"

solution "ninjatestsln"
	location "build"
	configurations {"debug", "release"}

project "ninjatestprj_app"
	kind "ConsoleApp"
	location "build"
	language "C++"
	targetdir "build/bin_%{cfg.buildcfg}"

	files {"main.cpp"}
	includedirs {"test1", "test2"}
	links {"ninjatestprj_lib_test1", "ninjatestprj_lib_test2"}

	configuration "windows"
		links { "user32", "gdi32" }

	configuration "linux"
		links { "pthread" }
	-- todo add system libs for os x and linux

	filter "configurations:debug"
		defines {"DEBUG"}
		flags {"Symbols"}

	filter "configurations:release"
		defines {"NDEBUG"}
		optimize "On"

project "ninjatestprj_lib_test1"
	kind "StaticLib"
	location "build"
	language "C++"
	targetdir "build/bin_%{cfg.buildcfg}"

	files {"test1/**.cpp", "test1/**.c", "test1/**.h"}
	includedirs {"test1"}

	filter "configurations:debug"
		defines {"DEBUG"}
		flags {"Symbols"}

	filter "configurations:release"
		defines {"NDEBUG"}
		optimize "On"

project "ninjatestprj_lib_test2"
	kind "StaticLib"
	location "build"
	language "C++"
	targetdir "build/bin_%{cfg.buildcfg}"

	files {"test2/**.cpp", "test2/**.c", "test2/**.h"}
	includedirs {"test2"}

	filter "configurations:debug"
		defines {"DEBUG"}
		flags {"Symbols"}

	filter "configurations:release"
		defines {"NDEBUG"}
		optimize "On"
