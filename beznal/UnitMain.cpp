//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "UnitMain.h"
#include "UnitPassword.h"
#include "UnitData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DBGridEh"
#pragma link "FIBDatabase"
#pragma link "FIBDataSet"
#pragma link "pFIBDatabase"
#pragma link "pFIBDataSet"
#pragma link "VersionInfoComponent"
#pragma link "FIBQuery"
#pragma link "pFIBQuery"
#pragma link "pFIBStoredProc"
#pragma link "PrnDbgeh"
#pragma link "GridsEh"
#pragma link "DBCtrlsEh"
#pragma link "DBLookupEh"
#pragma resource "*.dfm"
TFormOrders *FormOrders;
//---------------------------------------------------------------------------
__fastcall TFormOrders::TFormOrders(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormOrders::FormShow(TObject *Sender)
{
	PrimaryHost="localhost";
	SecondaryHost="127.0.0.1";
	AnsiString UserName="SYSDBA";
	AnsiString Password="masterkey";
	DBName=ExtractFilePath(Application->ExeName)+"TAXI.FDB";
	DBPhone=ExtractFilePath(Application->ExeName)+"PHONE.FDB";

	TIniFile *IniFile = new TIniFile(ExtractFilePath(Application->ExeName)+"dbconf.ini");
	if (IniFile->SectionExists("CONNECTIONS") == true){
		PrimaryHost = IniFile->ReadString("CONNECTIONS", "PRIMARY_HOST", PrimaryHost);
		SecondaryHost = IniFile->ReadString("CONNECTIONS", "SECONDARY_HOST", SecondaryHost);
		UserName = IniFile->ReadString("CONNECTIONS", "USERNAME", UserName);
		Password = IniFile->ReadString("CONNECTIONS", "PASSWORD", Password);
		DBName = IniFile->ReadString("CONNECTIONS", "DBNAME", DBName);
		DBPhone= IniFile->ReadString("CONNECTIONS", "DBNAME_PHONE", DBPhone);
		}
	else{
		IniFile->WriteString("CONNECTIONS","PRIMARY_HOST",PrimaryHost);
		IniFile->WriteString("CONNECTIONS","SECONDARY_HOST",SecondaryHost);
		IniFile->WriteString("CONNECTIONS","USERNAME", UserName);
		IniFile->WriteString("CONNECTIONS","PASSWORD", Password);
		IniFile->WriteString("CONNECTIONS","DBNAME",DBName);
		IniFile->WriteString("CONNECTIONS","DBNAME_PHONE",DBPhone);
		}
	delete IniFile;

	HostName = AnsiString::StringOfChar(' ', 64);
	gethostname(HostName.c_str(),64);


	if(MessageDlg("Подключится к основному серверу?", mtCustom, TMsgDlgButtons()<<mbYes<<mbNo, 0) != mrYes)
		PrimaryHost=SecondaryHost;

	if ( HostName.UpperCase().Pos(PrimaryHost) ){
		MainHost=true;
		DM->FIBDatabase->DBName="127.0.0.1:"+DBName;
		//DM->FIBDatabasePhones->DBName="127.0.0.1:"+DBPhone;
		}
	else{
		MainHost=false;
		DM->FIBDatabase->DBName=PrimaryHost+":"+DBName;
		//DM->FIBDatabasePhones->DBName=PrimaryHost+":"+DBPhone;
		}

//	if(!DM->FIBDatabasePhones->Connected) DM->FIBDatabasePhones->Open();
//	if(!DM->FIBTransactionPhones->Active) DM->FIBTransactionPhones->StartTransaction();
	if(!DM->FIBDatabase->Connected) DM->FIBDatabase->Open();
	if(!DM->FIBTransaction->Active) DM->FIBTransaction->StartTransaction();
//_______________________________________________________________________________________________________


	Caption="БЕЗНАЛЬЩИКИ v."+VersionInfoOrders->FileVersion+" Server:"+PrimaryHost;;

}
//---------------------------------------------------------------------------


void __fastcall TFormOrders::BitBtnRefreshClick(TObject *Sender)
{
	if(OpenDialogSQL->Execute()){
		DM->FIBDataSetOrders->Close();	
		DM->FIBDataSetOrders->SQLs->SelectSQL->Clear();
		DM->FIBDataSetOrders->SQLs->SelectSQL->LoadFromFile(OpenDialogSQL->FileName);
		DM->FIBDataSetOrders->ParamByName("V_YEAR")->AsInteger=StrToInt(EditYEAR->Text);
		DM->FIBDataSetOrders->ParamByName("V_MONTH")->AsInteger=StrToInt(EditMONTH->Text);
		DM->FIBDataSetOrders->Open();
		}
}
//---------------------------------------------------------------------------


