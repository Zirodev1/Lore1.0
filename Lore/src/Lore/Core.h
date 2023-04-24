#pragma once

#ifdef LR_PLATFORM_WINDOWS
	#ifdef LR_BUILD_DLL
		#define LORE_API __declspec(dllexport)
	#else
		#define LORE_API __declspec(dllimport)
	#endif // DEBUG
#else
	#error Lore only supports Windows!
#endif // LR_PLATFORM_WINDOWS

