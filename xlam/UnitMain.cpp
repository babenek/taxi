//---------------------------------------------------------------------------

#include <vcl.h>
//#include <winsock.h>
#pragma hdrstop

#include "UnitMain.h"

#include <exception>
#include <iostream>
#include <Registry.hpp>
#include "UnitData.h"
#include "Wininet.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DBGridEh"
#pragma link "FIBDatabase"
#pragma link "pFIBDatabase"
#pragma link "FIBDataSet"
#pragma link "FIBQuery"
#pragma link "pFIBDataSet"
#pragma link "pFIBQuery"
#pragma link "pFIBStoredProc"
#pragma link "VersionInfoComponent"
#pragma link "VersionInfoUI"
#pragma link "SIBEABase"
#pragma link "SIBFIBEA"
#pragma link "GridsEh"
#pragma link "GridsEh"
#pragma link "IdIOHandlerStack"
#pragma resource "*.dfm"
TFormMain *FormMain;
//---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner)	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormShow(TObject *Sender)
{// ясный-красный, если в начале программы, значит функция для креейта всякой лабуды с чем дальше буду работать
//02.04.06 = 38809
	if(!DM->FIBDatabase->Connected){

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

		if (HostName.UpperCase().Pos(PrimaryHost) ){
			MainHost=true;
			DM->FIBDatabase->DBName="127.0.0.1:"+DBName;
			//DM->FIBDatabasePhones->DBName="127.0.0.1:"+DBPhone;
			}
		else{
			MainHost=false;
			DM->FIBDatabase->DBName=PrimaryHost+":"+DBName;
			//DM->FIBDatabasePhones->DBName=PrimaryHost+":"+DBPhone;
			}

		//if(!DM->FIBDatabasePhones->Connected) DM->FIBDatabasePhones->Open();
		//if(!DM->FIBTransactionPhones->Active) DM->FIBTransactionPhones->StartTransaction();
		if(!DM->FIBDatabase->Connected) DM->FIBDatabase->Open();
		if(!DM->FIBTransaction->Active) DM->FIBTransaction->StartTransaction();

			//	DM->FIBDatabase->ConnectParams->UserName=UserName;
			//	DM->FIBDatabase->ConnectParams->Password=Password;


		IniFile = new TIniFile(ExtractFilePath(Application->ExeName)+"xlam.ini");
		if (IniFile->SectionExists("XLAM") == true){
			XlamName = IniFile->ReadString("XLAM", "name", XlamName);
			XlamPass = IniFile->ReadString("XLAM", "pass", XlamPass);
			}
		else{
			XlamPass = "";
			XlamName = "";
			}
		delete IniFile;

		TrayIcon->Hint=XlamName;
		Busy=false;
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::LocRefresh(TObject *Sender)
{
	if(!Busy && !ClientSocket->Active){
		Busy=true;
		String buf,loc;
		int l,m,n;
		loc="";
		if(!DM->FIBDataSet_Locations->Active) DM->FIBDataSet_Locations->Open();
		while(!DM->FIBDataSet_Locations->Eof){
			loc+="(\'"+DM->FIBDataSet_Locations->FieldValues["NAME"]+"\',"+
				DM->FIBDataSet_Locations->FieldValues["KEY_LOCATION"]+
				",\'"+IntToHex((int)DM->FIBDataSet_Locations->FieldValues["LABEL_R"],2)+
				IntToHex((int)DM->FIBDataSet_Locations->FieldValues["LABEL_G"],2)+
				IntToHex((int)DM->FIBDataSet_Locations->FieldValues["LABEL_B"],2)+
				"\',\'"+IntToHex((int)DM->FIBDataSet_Locations->FieldValues["FONT_R"],2)+
				IntToHex((int)DM->FIBDataSet_Locations->FieldValues["FONT_G"],2)+
				IntToHex((int)DM->FIBDataSet_Locations->FieldValues["FONT_B"],2)+"\');\r\n"
				;

			DM->FIBDataSet_Locations->Next();
			}
		DM->FIBDataSet_Locations->Close();

		buf=
"POST /"+XlamName+"/firebird/locations.php HTTP/1.1\r\n\
Host: xlam.net.ua\r\n\
Accept: text/html, */*\r\n\
Accept-Charset: windows-1251,utf-8;q=0.7,*;q=0.7\r\n\
Connection: Close\r\n\
Authorization: Basic "+XlamPass+"\r\n\
Content-Type: multipart/form-data; boundary=????????????????\r\n\
Content-Length: "+AnsiString(loc.Length()+42+52)+"\r\n\
\r\n\
--????????????????\r\n\
Content-Disposition: form-data; name=\"locations\"\r\n\r\n"+loc+"--????????????????--\r\n\r\n";

		try{
			ClientSocket->Open();
			ClientSocket->Socket->SendBuf(buf.c_str(),buf.Length());
			ClientSocket->Socket->Close();
			}
		catch(...){
//			TrayIcon->BalloonTitle="ХЛАМ";
//			TrayIcon->BalloonHint="ошибка передачи";
//
//			NOTIFYICONDATA tnd;
//			PSTR pszTip;
//
//			pszTip = "ошибка передачи";
//
//			tnd.cbSize          = sizeof(NOTIFYICONDATA);
//			tnd.hWnd            = Handle;
//			tnd.uID             = IDC_MYICON;
//			tnd.uFlags          = NIF_MESSAGE | NIF_ICON | NIF_TIP;
//			tnd.uCallbackMessage	= MYWM_NOTIFY;
//
//			tnd.hIcon		= (HICON)TrayIcon->Icon->Handle;
//			if (pszTip)
//			   lstrcpyn(tnd.szTip, pszTip, sizeof(tnd.szTip));
//			else
//			tnd.szTip[0] = '\0';
//
//			Shell_NotifyIcon(NIM_MODIFY, &tnd);
			}
//		MemoTest->Lines->Clear();
//		MemoTest->Lines->Add(buf);
		Busy=false;
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::N3Click(TObject *Sender)
{
	Hide();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::N2Click(TObject *Sender)
{
	Show();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::FormPaint(TObject *Sender)
{
   	Hide();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::N1Click(TObject *Sender)
{
	Close();
}
//---------------------------------------------------------------------------

