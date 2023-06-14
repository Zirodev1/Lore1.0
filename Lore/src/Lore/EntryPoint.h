#pragma once

#ifdef LR_PLATFORM_WINDOWS

extern Lore::Application* Lore::CreateApplication();

int main(int argc, char** argv)
{
	Lore::Log::Init();

	auto app = Lore::CreateApplication();
	app->Run();
	delete app;
}

#endif
