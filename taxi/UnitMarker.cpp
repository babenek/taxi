//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UnitMarker.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormMarker *FormMarker;
//---------------------------------------------------------------------------
__fastcall TFormMarker::TFormMarker(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormMarker::FormShow(TObject *Sender)
{
	MaskEditMarker->Text="";	
}
//---------------------------------------------------------------------------
