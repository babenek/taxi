//$$---- Form CPP ----
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UnitMain.h"
#include "UnitData.h"
#include "UnitPassword.h"
#include "UnitVehicles.h"
#include "UnitArnAction.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DBCtrlsEh"
#pragma link "DBGridEh"
#pragma link "DBLookupEh"
#pragma link "GridsEh"
#pragma resource "*.dfm"
TFormMain *FormMain;
//---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormShow(TObject *Sender)
{if(DM->FIBDatabaseSamara->Connected)DM->FIBDatabaseSamara->Connected=false;

	AnsiString PrimaryHost="TAXI1";
	AnsiString SecondaryHost="ENERGY";
	AnsiString DBTaxiPath="C:\\SAMARA\\SAMARA.FDB";
	AnsiString DBPhonePath="C:\\SAMARA\\MART.FDB";

	TIniFile *TaxiIni = new TIniFile(ExtractFilePath(Application->ExeName)+"taxiconf.ini");
	if (TaxiIni->SectionExists("CONNECTIONS") == true){
		PrimaryHost = TaxiIni->ReadString("CONNECTIONS", "PRIMARY_HOST", "TAXI1");
		SecondaryHost = TaxiIni->ReadString("CONNECTIONS", "SECONDARY_HOST", "ENERGY");
		DBTaxiPath= TaxiIni->ReadString("CONNECTIONS", "DBTAXI_PATH", "C:\\SAMARA\\SAMARA.FDB");
		DBPhonePath= TaxiIni->ReadString("CONNECTIONS", "DBPHONE_PATH", "C:\\SAMARA\\MART.FDB");
		}
	else{
		TaxiIni->WriteString("CONNECTIONS","PRIMARY_HOST",PrimaryHost);
		TaxiIni->WriteString("CONNECTIONS","SECONDARY_HOST",SecondaryHost);
		TaxiIni->WriteString("CONNECTIONS","DBTAXI_PATH",DBTaxiPath);
		TaxiIni->WriteString("CONNECTIONS","DBPHONE_PATH",DBPhonePath);
		}
//	delete TaxiIni;
	AnsiString Password="1234";
	if (TaxiIni->SectionExists("SECURITY") == true){
		Password = TaxiIni->ReadString("SECURITY", "PASSWORD", "1234");
		}
	else{
		TaxiIni->WriteString("SECURITY","PASSWORD",Password);
		}
	FormPassword->Password=Password;
	delete TaxiIni;


	AnsiString HostName = "0123456789ABCDEF0123456789ABCDEF";
	int tmp=32;
	gethostname(HostName.c_str(),tmp);

	if ( HostName.UpperCase().Pos("BABENEX") ){  //  ;)
		if(MessageDlg("BABENEX ?", mtConfirmation, TMsgDlgButtons()<<mbYes<<mbNo, 0) == mrYes){
			MainHost=true;
			PrimaryHost="BABENEX";
			DM->FIBDatabaseSamara->DBName="127.0.0.1:"+DBTaxiPath;
			//DM->FIBDatabasePhones->DBName="127.0.0.1:"+DBPhonePath;
			}
		else{
			if(MessageDlg("Подключится к основному серверу?", mtCustom, TMsgDlgButtons()<<mbYes<<mbNo, 0) != mrYes)
				PrimaryHost=SecondaryHost;
			if ( HostName.UpperCase().Pos(PrimaryHost) ){
				MainHost=true;
				DM->FIBDatabaseSamara->DBName="127.0.0.1:"+DBTaxiPath;
				}
			else{
				MainHost=false;
				DM->FIBDatabaseSamara->DBName=PrimaryHost+":"+DBTaxiPath;
				}
			}
		}
	else{
		if(MessageDlg("Подключится к основному серверу?", mtCustom, TMsgDlgButtons()<<mbYes<<mbNo, 0) != mrYes)
			PrimaryHost=SecondaryHost;

		if ( HostName.UpperCase().Pos(PrimaryHost) ){
			FormMain->MainHost=true;
			DM->FIBDatabaseSamara->DBName="127.0.0.1:"+DBTaxiPath;
			//DM->FIBDatabasePhones->DBName="127.0.0.1:"+DBPhonePath;
			}
		else{
			FormMain->MainHost=false;
			DM->FIBDatabaseSamara->DBName=PrimaryHost+":"+DBTaxiPath;
			//DM->FIBDatabasePhones->DBName=PrimaryHost+":"+DBPhonePath;
			}
		}

	DM->FIBDatabaseSamara->Connected=true;
	DM->FIBTransactionSamara->Active=true;

	DM->FIBDataSetArendaActions->CloseOpen(true);
//	DBLookupComboboxEh_S_ARN_ACTION->KeyValue=0;

	DM->FIBDataSetSmena->CloseOpen(true);
	DM->FIBDataSetVehicles->CloseOpen(true);
	DM->FIBDataSetArenda->CloseOpen(true);
//	DateTimePickerArnDate->Date=Now();
//	MonthCalendar->Date=Now();
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::CheckBoxProtectClick(TObject *Sender)
{
	if (!CheckBoxProtect->Checked)
		FormPassword->ShowModal();

	if(!FormPassword->ResultOK)
		CheckBoxProtect->Checked=true;

	DM->FIBDataSetSmena->CloseOpen(true);
	DM->FIBDataSetArenda->CloseOpen(true);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::CheckBoxOneOnlyClick(TObject *Sender)
{
	DM->FIBDataSetArenda->CloseOpen(true);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::SpeedButton2Click(TObject *Sender)
{
	if(DM->FIBDataSetSmena->FieldValues["UNIQS"] == 0)
		FormVehicles->Show();
	else
		MessageDlg("Доступно только для администрации!", mtError, TMsgDlgButtons() << mbOK, 0);
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::ButtonAccountChargeClick(TObject *Sender)
{
	if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
	DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_UNIQV")->AsInteger=DM->FIBDataSetVehicles->FieldValues["UNIQV"];
	DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_ARN_ACTION")->AsShort=2;
	DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_SMN_START")->AsInteger=DM->FIBDataSetSmena->FieldValues["UNIQS"];;
	DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_ARN_DATE")->AsDate=Now();
	DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_MONEY")->AsDouble=EditMoney->Text.ToDouble();
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

	EditMoney->Text="";
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ButtonPayClick(TObject *Sender)
{
	if(DM->FIBDataSetSmena->FieldValues["UNIQS"] == 0)
		FormArnAction->Show();
	else{
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_UNIQV")->AsInteger=DM->FIBDataSetVehicles->FieldValues["UNIQV"];
		DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_ARN_ACTION")->AsShort=3;
		DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_SMN_START")->AsInteger=DM->FIBDataSetSmena->FieldValues["UNIQS"];
		DM->FIBStoredProc_VEHICLE_PAY->ParamByName("VI_ARN_DATE")->AsDate=DM->FIBDataSetSmena->FieldValues["SMN_DATE"];
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

	EditMoney->Text="";
}
//---------------------------------------------------------------------------



void __fastcall TFormMain::ButtonRollbackClick(TObject *Sender)
{
	if(DM->FIBDataSetSmena->FieldValues["UNIQS"] == 0){
		if(DM->FIBDataSetArenda->FieldValues["ARN_STATE"] == 0){
			if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
				DM->FIBStoredProc_VEHICLE_ROLLBACK->ParamByName("VI_UNIQA")->AsInteger=DM->FIBDataSetArenda->FieldValues["UNIQA"];
				try{
					DM->FIBStoredProc_VEHICLE_ROLLBACK->ExecProc();
					DM->FIBTransactionUpdate->Commit();
					}
				catch(...){
					DM->FIBTransactionUpdate->Rollback();
					MessageDlg("Откат не удался :(", mtError, TMsgDlgButtons() << mbOK, 0);
					}
			}
		else{
			MessageDlg("Можно только текущее состояние", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		DM->FIBDataSetArenda->CloseOpen(true);
		//DM->FIBDataSetVehicles->CloseOpen(true);
		}
	else{
		MessageDlg("Доступно только для администрации!", mtError, TMsgDlgButtons() << mbOK, 0);
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::EditMoneyKeyPress(TObject *Sender, char &Key)
{
	if(Key == VK_RETURN){
      ButtonAccountChargeClick(Sender);
		}
}
//---------------------------------------------------------------------------

