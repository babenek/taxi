//$$---- EXE CPP ----
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("UnitData.cpp", DM); /* TDataModule: File Type */
USEFORM("UnitClients.cpp", FormClients);
USEFORM("UnitOrder.cpp", FormOrder);
USEFORM("UnitMain.cpp", FormMain);
USEFORM("UnitMarker.cpp", FormMarker);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
	try
	{
		Application->Initialize();
		Application->CreateForm(__classid(TFormMain), &FormMain);
		Application->CreateForm(__classid(TDM), &DM);
		Application->CreateForm(__classid(TFormClients), &FormClients);
		Application->CreateForm(__classid(TFormOrder), &FormOrder);
		Application->CreateForm(__classid(TFormMarker), &FormMarker);
		Application->Run();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	catch (...)
	{
		try
		{
			throw Exception("");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}
//---------------------------------------------------------------------------
