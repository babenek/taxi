//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UnitOrder.h"
#include "UnitMain.h"
#include "UnitData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "FIBQuery"
#pragma link "pFIBQuery"
#pragma resource "*.dfm"
TFormOrder *FormOrder;
//---------------------------------------------------------------------------
__fastcall TFormOrder::TFormOrder(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormOrder::BitBtnOKClick(TObject *Sender)
{
	   FIBQuerySetRep->SQL->Clear();
		FIBQuerySetRep->SQL->Add("update reports set "+LabelField->Caption+"="+EditCost->Text+" where key_week="+IntToStr(Tag));

      if(MessageDlg("Выполнить: \"update reports set "+LabelField->Caption+"="+EditCost->Text+" where key_week="+IntToStr(Tag)+"\" ?", mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes){
			if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		   try{
	   		FIBQuerySetRep->ExecQuery();
			DM->FIBTransactionUpdate->Commit();
		   	}
		   catch(...){
	   		DM->FIBTransactionUpdate->Rollback();
	   		MessageDlg("Ошибка?!", mtError, TMsgDlgButtons() << mbOK, 0);
		   	}
         }

}
//---------------------------------------------------------------------------
