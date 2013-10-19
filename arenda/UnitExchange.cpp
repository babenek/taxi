//$$---- Form CPP ----
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UnitExchange.h"
#include "UnitData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormExchange *FormExchange;
//---------------------------------------------------------------------------
__fastcall TFormExchange::TFormExchange(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormExchange::ButtonExchangeSetClick(TObject *Sender)
{
	if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
	try{
		DM->FIBStoredProcExchangeSet->ParamByName("VI_RATE")->AsDouble=EditExchange->Text.ToDouble();
		}
	catch(...){
		MessageDlg("Курс валюты?\nНепонятно...", mtError, TMsgDlgButtons() << mbOK, 0);
		DM->FIBTransactionUpdate->Rollback();
		return;
		}

	try{
		DM->FIBStoredProcExchangeSet->ExecProc();
		DM->FIBTransactionUpdate->Commit();
		}
	catch(...){
		DM->FIBTransactionUpdate->Rollback();
		MessageDlg("Невозможно \nПопробуйте еще раз", mtError, TMsgDlgButtons() << mbOK, 0);
		return;
		}
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TFormExchange::FormShow(TObject *Sender)
{
	DM->FIBStoredProcExchangeGet->ExecProc();
	EditExchange->Text = DM->FIBStoredProcExchangeGet->ParamByName("VO_RATE")->AsString;
	Caption = "Курс № "+ DM->FIBStoredProcExchangeGet->ParamByName("VO_UNIQE")->AsString;

}
//---------------------------------------------------------------------------
void __fastcall TFormExchange::EditExchangeKeyPress(TObject *Sender, char &Key)
{
	if(Key==VK_RETURN) ButtonExchangeSetClick(Sender);	
}
//---------------------------------------------------------------------------

