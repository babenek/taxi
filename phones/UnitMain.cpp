//$$---- Form CPP ----
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UnitMain.h"
#include "UnitData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DBGridEh"
#pragma link "FIBDatabase"
#pragma link "FIBDataSet"

#pragma link "pFIBDatabase"
#pragma link "pFIBDataSet"
#pragma link "VersionInfoComponent"
#pragma link "GridsEh"
#pragma link "GridsEh"
#pragma link "DBGridEh"
#pragma link "DBGridEh"
#pragma link "FIBDatabase"
#pragma link "FIBDataSet"
#pragma link "GridsEh"
#pragma link "pFIBDatabase"
#pragma link "pFIBDataSet"
#pragma link "VersionInfoComponent"
#pragma resource "*.dfm"
TFormMain *FormMain;
//---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormShow(TObject *Sender)
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
	//int tmp=64;
	gethostname(HostName.c_str(),64);


	if(MessageDlg("Подключится к основному серверу?", mtCustom, TMsgDlgButtons()<<mbYes<<mbNo, 0) != mrYes)
		PrimaryHost=SecondaryHost;

	if ( HostName.UpperCase().Pos(PrimaryHost) ){
		MainHost=true;
		//DM->FIBDatabase->DBName="127.0.0.1:"+DBName;
		DM->FIBDatabasePhones->DBName="127.0.0.1:"+DBPhone;
		}
	else{
		MainHost=false;
		//DM->FIBDatabase->DBName=PrimaryHost+":"+DBName;
		DM->FIBDatabasePhones->DBName=PrimaryHost+":"+DBPhone;
		}

	VersionInfo->Enabled=true;
	Caption="ТЕЛЕФОНЫ v.No "+VersionInfo->FileVersion +"   Сервер:"+DM->FIBDatabasePhones->DBName;
	VersionInfo->Enabled=false;


	if(!DM->FIBDatabasePhones->Connected) DM->FIBDatabasePhones->Open();
	DM->DataSetMain->Open();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormClose(TObject *Sender, TCloseAction &Action)
{
	DM->DataSetMain->Close();
	DM->FIBDatabasePhones->Close();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::DataSetMainBeforeOpen(TDataSet *DataSet)
{
	DM->DataSetMain->SQLs->SelectSQL->Clear();
	DM->DataSetMain->SQLs->SelectSQL->Add("SELECT UNIQP,PHONE,NAME,STREET,STREET_TYPE,HOUSE,FLAT,TOS FROM PHONES where uniqp>0");
	for (int n=0;n<DBGridEh1->Columns->Count;n++){
		if(DBGridEh1->Columns->Items[n]->Title->SortMarker==smDownEh){
			DM->DataSetMain->SQLs->SelectSQL->Add("order by "+DBGridEh1->Columns->Items[n]->FieldName);
			break;
			}
		if(DBGridEh1->Columns->Items[n]->Title->SortMarker==smUpEh){
			DM->DataSetMain->SQLs->SelectSQL->Add("order by "+DBGridEh1->Columns->Items[n]->FieldName+" desc");
			break;
			}
		}

}
//---------------------------------------------------------------------------

void __fastcall TFormMain::DBGridEh1TitleBtnClick(TObject *Sender, int ACol, TColumnEh *Column)
{
	if(Column->Title->SortMarker==smNoneEh)        Column->Title->SortMarker=smDownEh;
	else	if(Column->Title->SortMarker==smDownEh)  Column->Title->SortMarker=smUpEh;
	else                                           Column->Title->SortMarker=smNoneEh;
	DM->DataSetMain->CloseOpen(true);	
}
//---------------------------------------------------------------------------

