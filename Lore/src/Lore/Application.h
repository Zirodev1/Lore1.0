#pragma once

#include "Core.h"

namespace Lore {


	class LORE_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// TO be define in client
	Application* CreateApplication();

}

