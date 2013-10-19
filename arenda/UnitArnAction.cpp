//$$---- Form CPP ----
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UnitArnAction.h"
#include "UnitData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DBCtrlsEh"
#pragma link "DBGridEh"
#pragma link "DBLookupEh"
#pragma resource "*.dfm"
TFormArnAction *FormArnAction;
//---------------------------------------------------------------------------
__fastcall TFormArnAction::TFormArnAction(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormArnAction::SpeedButton4Click(TObject *Sender)
{
	if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
	DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_UNIQV")->AsInteger=DM->FIBDataSetVehicles->FieldValues["UNIQV"];
	DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_ARN_ACTION")->AsShort=DBLookupComboboxEh_SMN_ACTION->KeyValue;
	DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_SMN_START")->AsInteger=DM->FIBDataSetSmena->FieldValues["UNIQS"];
	DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_ARN_DATE")->AsDate=DateTimePickerArendaDate->Date;
	if(EditMoney->Text.Length())
		DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_MONEY")->AsDouble=EditMoney->Text.ToDouble();
	else
		DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_MONEY")->Clear();
	if(EditArnInfo->Text.Length()) DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_INFO")->AsString=EditArnInfo->Text;
	else DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_INFO")->Clear();
	
	try{
		DM->FIBStoredProc_VEHICLE_PAY->ExecProc();
		DM->FIBTransactionUpdate->Commit();
		}
	catch(...){
		DM->FIBTransactionUpdate->Rollback();
		MessageDlg("Что-то не добавляется...", mtError, TMsgDlgButtons() << mbOK, 0);
		}
		DM->FIBDataSetArenda->CloseOpen(true);
		DM->FIBDataSetVehicles->RecordModified(true);
		DM->FIBDataSetVehicles->Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TFormArnAction::FormShow(TObject *Sender)
{
	DateTimePickerArendaDate->Date=Now();
	EditMoney->Text = "";	
}
//---------------------------------------------------------------------------

