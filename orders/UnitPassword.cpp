//---------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "UnitPassword.h"
//--------------------------------------------------------------------- 
#pragma resource "*.dfm"
TFormPassword *FormPassword;
//---------------------------------------------------------------------
__fastcall TFormPassword::TFormPassword(TComponent* AOwner)
	: TForm(AOwner)
{
}
//---------------------------------------------------------------------
void __fastcall TFormPassword::OKBtnClick(TObject *Sender)
{
	if(EditPassword->Text==Password)
		ResultOK=true;
	EditPassword->Text="";		
	Close();		
}
//---------------------------------------------------------------------------
void __fastcall TFormPassword::CancelBtnClick(TObject *Sender)
{
	ModalResult=mrCancel;
	Application->Terminate();
}
//---------------------------------------------------------------------------
void __fastcall TFormPassword::FormActivate(TObject *Sender)
{
	ResultOK=false;	
}
//---------------------------------------------------------------------------


