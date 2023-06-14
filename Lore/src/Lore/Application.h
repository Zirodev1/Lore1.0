#pragma once

#include "Core.h"
#include "Events/Event.h"
#include "Window.h"

namespace Lore
{
	class LORE_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	// TO be define in client
	Application* CreateApplication();
}
