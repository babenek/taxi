//---------------------------------------------------------------------------

#include <vcl.h>
#include <winsock2.h>
#pragma hdrstop

#include "UnitMain.h"

#include "UnitData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)

#pragma link "DBGridEh"
#pragma link "FIBDataSet"
#pragma link "FIBQuery"
#pragma link "GridsEh"
#pragma link "pFIBDataSet"
#pragma link "pFIBQuery"
#pragma link "pFIBStoredProc"
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

	MainHost=true;

	if ( HostName.UpperCase().Pos(PrimaryHost) ){
		DM->FIBDatabase->DBName="127.0.0.1:"+DBName;
		//DM->FIBDatabasePhones->DBName="127.0.0.1:"+DBPhone;
		}
	else{
		//MainHost=false;
		DM->FIBDatabase->DBName=PrimaryHost+":"+DBName;
		//DM->FIBDatabasePhones->DBName=PrimaryHost+":"+DBPhone;
		}

//	if(!DM->FIBDatabasePhones->Connected) DM->FIBDatabasePhones->Open();
//	if(!DM->FIBTransactionPhones->Active) DM->FIBTransactionPhones->StartTransaction();
	if(!DM->FIBDatabase->Connected) DM->FIBDatabase->Open();
	if(!DM->FIBTransaction->Active) DM->FIBTransaction->StartTransaction();
//_______________________________________________________________________________________________________


	if(StrToInt(Now().FormatString("hh"))<8){	// это еще ночная смена за вчера
		Calendar->Date=Now()-1;
		StaticTextDayNight->Tag=0;
		StaticTextDayNightClick(this);
		}
	else if(StrToInt(Now().FormatString("hh"))>20){// это уже ночная смена за сегодня
		Calendar->Date=Now();
		StaticTextDayNight->Tag=0;
		StaticTextDayNightClick(this);
		}
	else{// ну остается дневная смена за сегодня
		Calendar->Date=Now();
		StaticTextDayNight->Tag=1;
		StaticTextDayNightClick(this);
		}

//	if(!DM->FIBDatabasePhones->Connected) //DM->FIBDatabasePhones->Open();
//	if(!DM->FIBTransactionPhones->Active) DM->FIBTransactionPhones->StartTransaction();
	if(!DM->FIBDatabase->Connected) DM->FIBDatabase->Open();
	if(!DM->FIBTransaction->Active) DM->FIBTransaction->StartTransaction();
	if(!FIBDataSet_S_USER->Active) FIBDataSet_S_USER->Open();
	if(!FIBDataSetSmena->Active) FIBDataSetSmena->Open();
	CurrentSmena=0;
	SmenaWeekend=0;
	UserCount=0;
	LoginOk=false;
	if(!MainHost) Timer->Enabled=true;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::SpeedButtonCancelClick(TObject *Sender)
{
	LoginOk=false;
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::SpeedButtonOkClick(TObject *Sender)
{
	LoginOk=false;
			if (FIBDataSetSmena->RecordCount==1){
				TDate tmp=FIBDataSetSmena->FieldValues["SMN_DATE"];
				CurrentSmena=FIBDataSetSmena->FieldValues["UNIQS"];
				SmenaWeekend=FIBDataSetSmena->FieldValues["SMN_WEEKEND"];  				
				if (FIBDataSetSmena->FieldValues["SMN_DAY_NIGHT"]==0)
					Caption="САМАРА v."+VersionInfo->FileVersion
										+"   Смена № "+IntToStr(CurrentSmena)
										+" ДЕНЬ"+tmp.FormatString("  dddd dd mmmm yyyy   ")
										+FIBDataSetSmena->FieldValues["USR_LIST"]+"  >> "+HostName
										+" Server:"+PrimaryHost;
				else
					Caption="CAMAPA v."+VersionInfo->FileVersion+
										+"   Смена № "+IntToStr(CurrentSmena)
										+" НОЧЬ"+tmp.FormatString("  dddd dd mmmm yyyy   ")+
										FIBDataSetSmena->FieldValues["USR_LIST"]+"  >> "+HostName
										+" Server:"+PrimaryHost;
				LoginOk=true;
				//TimerCheck->Enabled=true;
				}
			else if (FIBDataSetSmena->RecordCount==0){
				ButtonOK->Enabled=false;
				MessageDlg("Нет активных смен!\nТребуется вход: \"Старший диспетчер\"", mtError, TMsgDlgButtons() << mbOK, 0);
				}
			else{
				ButtonOK->Enabled=false;
				MessageDlg("Ошибочное количество активных смен (>1)!\nТребуется вмешательство Старшего диспетчера\"", mtError, TMsgDlgButtons() << mbOK, 0);
				}
			FIBDataSetSmena->Close();
	Timer->Enabled=false;		
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ButtonAddClick(TObject *Sender)
{
	UserCount=DBGridEh_S_USER->SelectedRows->Count;
	if ( UserCount > 0){
		CodUser=new short[UserCount];
		TDataSet *pDS = DBGridEh_S_USER->DataSource->DataSet;
		for (int n=0; n < UserCount; n++){
			pDS->GotoBookmark((void *)DBGridEh_S_USER->SelectedRows->Items[n].c_str());
			ListBoxUsers->Items->Add(pDS->Fields->FieldByName("NAME_USER")->Value);
			*(CodUser+n)=pDS->Fields->FieldByName("COD_USER")->Value;
			}
		DBGridEh_S_USER->Enabled=false;
		ButtonAdd->Enabled=false;
		ButtonClear->Enabled=true;
		ButtonOK->Enabled=false;
		ButtonSmenaStart->Enabled=true;
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ButtonClearClick(TObject *Sender)
{
	DBGridEh_S_USER->SelectedRows->Clear();
	ListBoxUsers->Items->Clear();
	delete [] CodUser;
	UserCount=0;
	DBGridEh_S_USER->Enabled=true;
	ButtonClear->Enabled=false;
	ButtonSmenaStart->Enabled=false;
   ButtonAdd->Enabled=true;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ButtonSmenaStopClick(TObject *Sender)
{   
	if(!MainHost){
		MessageDlg("Допускается только с главного компьютера", mtInformation, TMsgDlgButtons()<<mbOK, 0);
		FIBDataSetSmena->CloseOpen(true);      
		return;
		}
																				
	if(StrToInt((Now()-TDateTime(FIBDataSetSmena->FieldValues["SMN_TIME_START"])).FormatString("hh")) < 11){ // Смена не отработала 11 часов!
		if(MessageDlg("Смена отработала не достаточно времени!\nЗакрыть ее в любом случае?", mtConfirmation, TMsgDlgButtons()<<mbYes<<mbNo, 0) != mrYes){
			FIBDataSetSmena->CloseOpen(true);      			
			return;
			}
		}

	if(FIBDataSetSmena->FieldValues["UNIQS"].Type() == varInteger){
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		FIBStoredProcSmenaStop->ParamByName("VI_UNIQS")->AsInteger=FIBDataSetSmena->FieldValues["UNIQS"];
		FIBStoredProcSmenaStop->ExecProc();
		try{DM->FIBTransactionUpdate->Commit();}
		catch(...){ DM->FIBTransactionUpdate->Rollback(); }
		}
	else{
		MessageDlg("Ошибка при завершении смены! \nПроверить системный код смены.", mtError, TMsgDlgButtons() << mbOK, 0);
		}
	FIBDataSetSmena->CloseOpen(true);      
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::StaticTextDayNightClick(TObject *Sender)
{
	if (StaticTextDayNight->Tag == 0){// 0 - начало, то-есть день
		StaticTextDayNight->Tag = 1; // переключаем на НОЧЬ
		StaticTextDayNight->Color = clBlack;
		StaticTextDayNight->Font->Color = clWhite;
		StaticTextDayNight->Caption="НОЧЬ";
		}
	else{
		StaticTextDayNight->Tag = 0; // переключаем на ДЕНЬ
		StaticTextDayNight->Color = clWhite;
      StaticTextDayNight->Font->Color = clBlack;
      StaticTextDayNight->Caption="ДЕНЬ";
   	}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ButtonSmenaStartClick(TObject *Sender)
{
	if(!MainHost){
		MessageDlg("Допускается только с главного компьютера", mtInformation, TMsgDlgButtons()<<mbOK, 0);
		FIBDataSetSmena->CloseOpen(true);      
		return;
		}

	if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
	try{
		AnsiString tmps="";
		for (int n=0;n<ListBoxUsers->Items->Count;n++)
			tmps+=(ListBoxUsers->Items->Strings[n]+";  ");
		FIBStoredProcSmenaStart->ParamByName("VI_USR_LIST")->AsString = tmps;
		FIBStoredProcSmenaStart->ParamByName("VI_DATE")->AsDate = Calendar->Date;
		FIBStoredProcSmenaStart->ParamByName("VI_DAY_NIGHT")->AsShort = StaticTextDayNight->Tag;
		FIBStoredProcSmenaStart->ExecProc();
		DM->FIBTransactionUpdate->Commit();
		CurrentSmena=FIBStoredProcSmenaStart->ParamByName("VO_UNIQS")->AsInteger;
		}
	catch(...){
		DM->FIBTransactionUpdate->Rollback();		
		MessageDlg("Не добавляется смена !", mtError, TMsgDlgButtons() << mbOK, 0);
		}		

//	if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
//	try{
//		for(int n=0;n<UserCount;n++){
//			FIBStoredProcSmenaAddUser->ParamByName("VI_UNIQS")->AsInteger=CurrentSmena;
//			FIBStoredProcSmenaAddUser->ParamByName("VI_KEY_USER")->AsShort=*(CodUser+n);
//			FIBStoredProcSmenaAddUser->ExecProc();
//			}
//		DM->FIBTransactionUpdate->Commit();
//		}
//	catch(...){
//		DM->FIBTransactionUpdate->Rollback();
//		MessageDlg("Не добавляется список пользователей!", mtError, TMsgDlgButtons() << mbOK, 0);
//		}
	FIBDataSetSmena->CloseOpen(true);
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::FIBDataSetSmenaAfterOpen(TDataSet *DataSet)
{
	if(FIBDataSetSmena->RecordCount>0){
		ButtonSmenaStop->Enabled = true;
		ButtonSmenaStart->Enabled=false;
		Calendar->Enabled=false;
		StaticTextDayNight->Enabled=false;
		DBGridEh_S_USER->Enabled=false;
		ButtonAdd->Enabled=false;
		ButtonClear->Enabled=false;
		ButtonOK->Enabled=true;
		}
	else{
		ButtonSmenaStop->Enabled = false;
		ButtonSmenaStart->Enabled= UserCount;
		Calendar->Enabled=true;
		StaticTextDayNight->Enabled=true;
		DBGridEh_S_USER->Enabled=!UserCount;
		ButtonAdd->Enabled=!UserCount;
		ButtonClear->Enabled=UserCount;
		ButtonOK->Enabled=false;
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::FIBDataSetSmenaAfterRefresh(
      TDataSet *DataSet)
{
	if (FIBDataSetSmena->RecordCount>0){
		ButtonOK->Enabled=true;
      ButtonSmenaStop->Enabled=true;
      ButtonSmenaStart->Enabled=false;
   	}
	else{
		ButtonOK->Enabled=false;
		ButtonSmenaStop->Enabled=false;
		ButtonSmenaStart->Enabled=true;
   	}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::FIBDataSetSmenaSMN_WEEKENDGetText(
      TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="будни";
		else if(Sender->Value == 1) Text="праздник";
		else Text="";
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::FIBDataSetSmenaSMN_DAY_NIGHTGetText(
      TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="день";
   	else if(Sender->Value == 1) Text="ночь";
      else Text="";
      }	
}
//---------------------------------------------------------------------------






