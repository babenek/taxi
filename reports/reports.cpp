//$$---- EXE CPP ----
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("UnitMain.cpp", FormMain);
USEFORM("UnitOrder.cpp", FormOrder);
USEFORM("UnitPassword.cpp", FormPassword);
USEFORM("UnitData.cpp", DM); /* TDataModule: File Type */
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
	try
	{
		Application->Initialize();
		Application->Title = "Отчеты";
		Application->CreateForm(__classid(TFormMain), &FormMain);
		Application->CreateForm(__classid(TFormOrder), &FormOrder);
		Application->CreateForm(__classid(TFormPassword), &FormPassword);
		Application->CreateForm(__classid(TDM), &DM);
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
