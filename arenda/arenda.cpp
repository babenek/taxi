
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("UnitData.cpp", DM); /* TDataModule: File Type */
USEFORM("UnitMain.cpp", FormMain);
USEFORM("UnitPassword.cpp", FormPassword);
USEFORM("UnitVehicles.cpp", FormVehicles);
USEFORM("UnitExchange.cpp", FormExchange);
USEFORM("UnitArnAction.cpp", FormArnAction);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
	try
	{
		Application->Initialize();
		Application->CreateForm(__classid(TDM), &DM);
		Application->CreateForm(__classid(TFormMain), &FormMain);
		Application->CreateForm(__classid(TFormPassword), &FormPassword);
		Application->CreateForm(__classid(TFormVehicles), &FormVehicles);
		Application->CreateForm(__classid(TFormExchange), &FormExchange);
		Application->CreateForm(__classid(TFormArnAction), &FormArnAction);
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
