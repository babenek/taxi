//$$---- Form CPP ----
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UnitVehicles.h"
#include "UnitData.h"
#include "UnitExchange.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DBGridEh"
#pragma link "GridsEh"
#pragma link "DBCtrlsEh"
#pragma link "DBLookupEh"
#pragma resource "*.dfm"
TFormVehicles *FormVehicles;
//---------------------------------------------------------------------------
__fastcall TFormVehicles::TFormVehicles(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------




void __fastcall TFormVehicles::ExchangeSet(TObject *Sender)
{
	DM->FIBDataSetExchange->Close();
	if(MessageDlg("Изменить действующий курс валюты?", mtCustom, TMsgDlgButtons()<<mbYes<<mbNo, 0) == mrYes)
		FormExchange->ShowModal();
	DM->FIBDataSetExchange->Open();
	EditCostChange(this);
	EditDurationChange(this);
}
//---------------------------------------------------------------------------

void __fastcall TFormVehicles::FormShow(TObject *Sender)
{
	Edit_KEY_THEME->Text="";
	Edit_MODEL->Text="";
	Edit_NUMBER->Text="";
	Edit_INFO->Text="";
	EditCost->Text="";
	EditDuration->Text="";
	EditRental->Text="";

	DM->FIBDataSetExchange->Open();
}
//---------------------------------------------------------------------------

void __fastcall TFormVehicles::FormCloseQuery(TObject *Sender, bool &CanClose)
{
	if(DM->FIBDataSetVehicles->State == dsEdit || DM->FIBDataSetVehicles->State == dsInsert){
		switch( MessageDlg("Данные изменены.\nСохранить?", mtCustom, TMsgDlgButtons()<<mbYes<<mbNo<<mbCancel, 0) ){
			case mrYes:
				DM->FIBDataSetVehicles->Post();
				DM->FIBTransactionUpdate->Commit();
				CanClose=true;
				break;
			case mrNo:
				if(DM->FIBTransactionUpdate->Active)
					DM->FIBTransactionUpdate->Rollback();
				CanClose=true;
				break;
			default:
				CanClose=false;
				break;
			};
		}
	DM->FIBDataSetExchange->Close();
}
//---------------------------------------------------------------------------

void __fastcall TFormVehicles::ButtonPostClick(TObject *Sender)
{
	if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
	DM->FIBStoredProc_VEHICLE_ADD->ParamByName("VI_THEME")->AsShort=StrToInt(Edit_KEY_THEME->Text);
	DM->FIBStoredProc_VEHICLE_ADD->ParamByName("VI_MODEL")->AsString=Edit_MODEL->Text;
	DM->FIBStoredProc_VEHICLE_ADD->ParamByName("VI_NUMBER")->AsString=Edit_NUMBER->Text;
	DM->FIBStoredProc_VEHICLE_ADD->ParamByName("VI_INFO")->AsString=Edit_INFO->Text;
	DM->FIBStoredProc_VEHICLE_ADD->ParamByName("VI_COST")->AsDouble=EditCost->Text.ToDouble();
	DM->FIBStoredProc_VEHICLE_ADD->ParamByName("VI_DURATION")->AsShort=StrToInt(EditDuration->Text);
	DM->FIBStoredProc_VEHICLE_ADD->ParamByName("VI_RENTAL")->AsDouble=EditRental->Text.ToDouble();
	try{
		DM->FIBStoredProc_VEHICLE_ADD->ExecProc();
		DM->FIBTransactionUpdate->Commit();
		}
	catch(...){
		DM->FIBTransactionUpdate->Rollback();
		MessageDlg("Что-то не добавляется...", mtError, TMsgDlgButtons() << mbOK, 0);
		}
	DM->FIBDataSetVehicles->CloseOpen(true);
}
//---------------------------------------------------------------------------
void __fastcall TFormVehicles::DateTimePickerStartChange(TObject *Sender)
{
	EditDuration->Text = IntToStr(DateTimePickerStop->Date - DateTimePickerStart->Date);
	EditDurationChange(Sender);
}
//---------------------------------------------------------------------------
void __fastcall TFormVehicles::EditCostChange(TObject *Sender)
{
	try {
		LabelCurrency->Caption = "~ "+FormatFloat("#.##",double(EditCost->Text.ToDouble() * DM->FIBDataSetExchange->FieldValues["RATE"]))+ +" y.e.";
		}
	catch(...){
		LabelCurrency->Caption = "";
		}
	EditDurationChange(Sender);
}
//---------------------------------------------------------------------------
void __fastcall TFormVehicles::EditDurationChange(TObject *Sender)
{
	try{
		LabelRent->Caption = "~ "+FormatFloat("#.##",double(EditCost->Text.ToDouble() / EditDuration->Text.ToDouble())) +" грн.";
		}
	catch(...){
		LabelRent->Caption = "";
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormVehicles::FormCreate(TObject *Sender)
{
	DateTimePickerStart->Date = Now();
	DateTimePickerStop->Date = Now();
}
//---------------------------------------------------------------------------


void __fastcall TFormVehicles::SpeedButtonApplyClick(TObject *Sender)
{
	if(DM->FIBDataSetVehicles->State == dsEdit) DM->FIBDataSetVehicles->Post(); Close();
}
//---------------------------------------------------------------------------


void __fastcall TFormVehicles::ButtonDeleteClick(TObject *Sender)
{
	if(MessageDlg("Машина будет удалена\nУверены?", mtConfirmation, TMsgDlgButtons()<<mbYes<<mbNo, 0)==mrYes){
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBQuery->SQL->Clear();
		DM->FIBQuery->SQL->Add("update vehicles set vhc_state=2 where uniqv="+IntToStr((int)DM->FIBDataSetVehicles->FieldValues["UNIQV"]));
		try{
			DM->FIBQuery->ExecQuery();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("Что-то не получается...", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		}
	DM->FIBDataSetVehicles->CloseOpen(true);
	DM->FIBDataSetArenda->CloseOpen(true);	
}
//---------------------------------------------------------------------------

