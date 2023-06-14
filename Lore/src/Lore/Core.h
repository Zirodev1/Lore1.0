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

#ifdef LR_ENABLE_ASSERTS
#define LR_ASSERT(x, ...) { if(!(x)) { LR_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#define LR_CORE_ASSERT(x, ...) { if(!(x)) { LR_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
#define LR_ASSERT(x, ...)
#define LR_CORE_ASSERT(x, ...)

#endif

#define BIT(x) (1 << x)
