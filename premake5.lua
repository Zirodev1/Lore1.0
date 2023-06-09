workspace "Lore"
	architecture "x64"
	
	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

--Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Lore/vendor/GLFW/include"

include "Lore/vendor/GLFW"

project "Lore"
	location "Lore"
	kind "SharedLib"
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-in/" .. outputdir .. "/%{prj.name}")

	pchheader "lrpch.h"
	pchsource "Lore/src/lrpch.cpp"
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}
	
	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links
	{
		"GLFW",
		"opengl32.lib",
		"dwmapi.lib"
	}
	
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		
		defines
		{
			"LR_PLATFORM_WINDOWS",
			"LR_BUILD_DLL",
			"_WINDLL"
		}
		
		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}
	
	filter "configurations:Debug"
		defines "LR_DEBUG"
		symbols "On"
		
	filter "configurations:Release"
		defines "LR_RELEASE"
		optimize "On"
		
	filter "configurations:Dist"
		defines "LR_DIST"
		optimize "On"
		

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-in/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}
	
		includedirs
	{
		"Lore/vendor/spdlog/include",
		"Lore/src"
	}
	
	links
	{
		"Lore"
	}
	
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		
		defines
		{
			"LR_PLATFORM_WINDOWS"
		}
		
	filter "configurations:Debug"
		defines "LR_DEBUG"
		symbols "On"
		
	filter "configurations:Release"
		defines "LR_RELEASE"
		optimize "On"
		
	filter "configurations:Dist"
		defines "LR_DIST"
		optimize "On"
	