//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "UnitMain.h"
#include "UnitOrder.h"
#include "UnitData.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DBGridEh"
#pragma link "FIBDatabase"
#pragma link "FIBDataSet"
#pragma link "FIBQuery"
#pragma link "pFIBDatabase"
#pragma link "pFIBDataSet"
#pragma link "pFIBQuery"
#pragma link "pFIBStoredProc"
#pragma link "VersionInfoComponent"
#pragma link "PrnDbgeh"
#pragma link "DBSumLst"
#pragma link "GridsEh"
#pragma link "DBGridEh"
#pragma link "FIBDatabase"
#pragma link "FIBDataSet"
#pragma link "FIBQuery"
#pragma link "GridsEh"
#pragma link "pFIBDatabase"
#pragma link "pFIBDataSet"
#pragma link "pFIBQuery"
#pragma link "pFIBStoredProc"
#pragma link "PrnDbgeh"
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

	DM->FIBDataSetWeeks->Open();

	Caption="ИНСТРУМЕНТ v."+VersionInfo->FileVersion+"  Server:"+PrimaryHost;
	CalendarReport->Date=Now();
	CalendarReport->EndDate=Now();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::BitBtnRefreshClick(TObject *Sender)
{
	int tmp=0,protect=0;

	if(DM->FIBDataSetWeeks->FieldValues["UNIQW"].Type() == varInteger)
		tmp = DM->FIBDataSetWeeks->FieldValues["UNIQW"];

	if(DM->FIBDataSetWeeks->FieldValues["wks_state"].Type() == varInteger)
		protect = DM->FIBDataSetWeeks->FieldValues["wks_state"];

  	if(protect!=0){
      MessageDlg("Отчетный период уже закрыт!", mtError, TMsgDlgButtons() << mbOK, 0);
		return;
      }

	if(tmp>0){
		if(MessageDlg("Перечитать данные с предыдущего отчета?", mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes){

			DM->FIBDataSetWeekReport->Close();
			DM->FIBDataSetWeeks->Close();

			if(true){
				if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
				DM->FIBStoredProcReportUpdate->ParamByName("VI_WEEK")->AsInteger=tmp;
				try{
					DM->FIBStoredProcReportUpdate->ExecProc();
					DM->FIBTransactionUpdate->Commit();
					}
				catch(...){
					DM->FIBTransactionUpdate->Rollback();
					MessageDlg("Невозможно UPDATE отчет!", mtError, TMsgDlgButtons() << mbOK, 0);
					}
				}
			}
		DM->FIBDataSetWeeks->Open();
		DM->FIBDataSetWeekReport->ParamByName("VI_WEEK")->AsInteger=tmp;
		DM->FIBDataSetWeekReport->Open();
		}
	else{
		MessageDlg("Нет выбранных отчетов для UPDATE!", mtError, TMsgDlgButtons() << mbOK, 0);
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::DBGridEhWeekReportKeyPress(TObject *Sender,
      char &Key)
{
	if(Key == 13 && DM->FIBDataSetWeekReport->State == dsEdit)
		DM->FIBDataSetWeekReport->Post();
		//FIBTransactionUpdate->Commit();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::BitBtnDeleteClick(TObject *Sender)
{
	int tmp=0,protect=0;

	if(DM->FIBDataSetWeeks->FieldValues["UNIQW"].Type() == varInteger)
		tmp = DM->FIBDataSetWeeks->FieldValues["UNIQW"];

	if(DM->FIBDataSetWeeks->FieldValues["wks_state"].Type() == varInteger)
		protect = DM->FIBDataSetWeeks->FieldValues["wks_state"];

  	if(protect!=0){
      MessageDlg("Отчетный период уже закрыт!", mtError, TMsgDlgButtons() << mbOK, 0);
		return;
      }

	if(tmp>0){
		if(MessageDlg("Удалить данные отчета № "+IntToStr(tmp)+" ?\n" +
	  ((TDateTime)DM->FIBDataSetWeeks->FieldValues["DATE_START"]).FormatString("d mmmm yyyy") +" - "+ ((TDateTime)DM->FIBDataSetWeeks->FieldValues["DATE_STOP"]).FormatString("d mmmm yyyy"),
      mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes){

			if(true){
			DM->FIBDataSetWeeks->Close();

			  if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
			DM->FIBQueryWeeksDelete->SQL->Clear();
			DM->FIBQueryWeeksDelete->SQL->Add("update weeks set key_prev_week = 0 where key_prev_week = "+IntToStr(tmp));
			   try{
				DM->FIBQueryWeeksDelete->ExecQuery();
				DM->FIBTransactionUpdate->Commit();
			   	}
			   catch(...){
				DM->FIBTransactionUpdate->Rollback();
			   	MessageDlg("Невозможно удалить PREV_WEEKS!", mtError, TMsgDlgButtons() << mbOK, 0);
			   	}

			   if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
				DM->FIBQueryWeeksDelete->SQL->Clear();
				DM->FIBQueryWeeksDelete->SQL->Add("update WEEKS set wks_state = 2 WHERE UNIQW = "+IntToStr(tmp));
			   try{
				DM->FIBQueryWeeksDelete->ExecQuery();
				DM->FIBTransactionUpdate->Commit();
				}
			   catch(...){
				DM->FIBTransactionUpdate->Rollback();
					MessageDlg("Невозможно удалить WEEKS!", mtError, TMsgDlgButtons() << mbOK, 0);
			   	}
			   DM->FIBDataSetWeeks->Open();
            }
			}

		}
	else{
		MessageDlg("Нет выбранных отчетов для UPDATE!", mtError, TMsgDlgButtons() << mbOK, 0);
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::FIBDataSetSMN_DAY_NIGHTGetText(
      TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="день";
   	else if(Sender->Value == 1) Text="ночь";
      else Text="";
      }
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FIBDataSetSMN_WEEKENDGetText(
      TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="будни";
   	else if(Sender->Value == 1) Text="праздник";
      else Text="";
      }
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::FIBDataSetSMN_STATEGetText(
      TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="активна";
   	else if(Sender->Value == 1) Text="закрыта";
      else Text="???";
      }
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::TabSheetClientShow(TObject *Sender)
{
	if(DM->FIBDatabase->Connected)
		DM->FIBDataSetClients->Open();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheetClientHide(TObject *Sender)
{
	DM->FIBDataSetClients->Close();
}
//---------------------------------------------------------------------------



void __fastcall TFormMain::BitBtnSetRepClick(TObject *Sender)
{
	int tmp=0,protect=0;

	if(DM->FIBDataSetWeeks->FieldValues["UNIQW"].Type() == varInteger)
		tmp = DM->FIBDataSetWeeks->FieldValues["UNIQW"];

	if(DM->FIBDataSetWeeks->FieldValues["wks_state"].Type() == varInteger)
		protect = DM->FIBDataSetWeeks->FieldValues["wks_state"];

  	if(protect!=0){
      MessageDlg("Отчетный период уже закрыт!", mtError, TMsgDlgButtons() << mbOK, 0);
		return;
      }

	if(tmp>0){
   	FormOrder->Tag=tmp;
      FormOrder->Caption=((TBitBtn *)Sender)->Caption;
      FormOrder->LabelField->Caption=((TBitBtn *)Sender)->Hint;
      FormOrder->LabelRepNo->Caption="Период отчета № "+IntToStr(tmp);
      FormOrder->Calendar->Enabled=true;
      FormOrder->Calendar->MultiSelect=false;
      FormOrder->Calendar->MaxSelectRange=7;
      FormOrder->Calendar->Date=DM->FIBDataSetWeeks->FieldValues["DATE_START"];
      FormOrder->Calendar->MultiSelect=true;
      FormOrder->Calendar->EndDate=DM->FIBDataSetWeeks->FieldValues["DATE_STOP"];                                       
      FormOrder->Calendar->Enabled=false;
      FormOrder->ShowModal();
      DM->FIBDataSetWeekReport->CloseOpen(true);
   	}
   else{
      MessageDlg("Не указан отчет!", mtError, TMsgDlgButtons() << mbOK, 0);
   	}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::BitBtnRecalcClick(TObject *Sender)
{
	int tmp=0,protect=0;

	if(DM->FIBDataSetWeeks->FieldValues["UNIQW"].Type() == varInteger)
		tmp = DM->FIBDataSetWeeks->FieldValues["UNIQW"];

	if(DM->FIBDataSetWeeks->FieldValues["wks_state"].Type() == varInteger)
		protect = DM->FIBDataSetWeeks->FieldValues["wks_state"];

  	if(protect!=0){
      MessageDlg("Отчетный период уже закрыт!", mtError, TMsgDlgButtons() << mbOK, 0);
		return;
      }

	if(tmp>0){
		if(MessageDlg("Произвести пересчет наработанных заказов по отчету:\n" +
   	   ((TDateTime)DM->FIBDataSetWeeks->FieldValues["DATE_START"]).FormatString("d mmmm yyyy") +" - "+ ((TDateTime)DM->FIBDataSetWeeks->FieldValues["DATE_STOP"]).FormatString("d mmmm yyyy"),
	      mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes){
			DM->FIBDataSetWeekReport->Close();
			DM->FIBDataSetWeeks->Close();

			if(true){
				if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
				DM->FIBStoredProcReportRecalc->ParamByName("VI_WEEK")->AsInteger=tmp;
				try{
					DM->FIBStoredProcReportRecalc->ExecProc();
					DM->FIBTransactionUpdate->Commit();
					}
				catch(...){
					DM->FIBTransactionUpdate->Rollback();
					MessageDlg("Невозможно RECALC отчет!", mtError, TMsgDlgButtons() << mbOK, 0);
					}
            }
			}
		DM->FIBDataSetWeeks->Open();
		DM->FIBDataSetWeekReport->ParamByName("VI_WEEK")->AsInteger=tmp;
		DM->FIBDataSetWeekReport->Open();
		}
	else{
		MessageDlg("Нет выбранных отчетов для RECALC!", mtError, TMsgDlgButtons() << mbOK, 0);
		}
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::FormClose(TObject *Sender, TCloseAction &Action)
{
	DM->FIBDataSetWeekReport->Close();	
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::BitBtnProtectClick(TObject *Sender)
{
	int tmp=0,protect=0;

	if(DM->FIBDataSetWeeks->FieldValues["UNIQW"].Type() == varInteger)
		tmp = DM->FIBDataSetWeeks->FieldValues["UNIQW"];

	if(DM->FIBDataSetWeeks->FieldValues["wks_state"].Type() == varInteger)
		protect = DM->FIBDataSetWeeks->FieldValues["wks_state"];

  	if(protect!=0){
      MessageDlg("Отчетный период уже закрыт!", mtError, TMsgDlgButtons() << mbOK, 0);
		return;
      }
      
	if(tmp>0){
		if(MessageDlg("Закрыть отчет № "+IntToStr(tmp)+" ?\n" +
      ((TDateTime)DM->FIBDataSetWeeks->FieldValues["DATE_START"]).FormatString("d mmmm yyyy") +" - "+ ((TDateTime)DM->FIBDataSetWeeks->FieldValues["DATE_STOP"]).FormatString("d mmmm yyyy"),
      mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes){

			if(true){
      		DM->FIBDataSetWeeks->Close();
/*
		      if (!FIBTransactionUpdate->InTransaction) FIBTransactionUpdate->StartTransaction();
            FIBQueryWeeksDelete->SQL->Clear();
            FIBQueryWeeksDelete->SQL->Add("update weeks set key_prev_week = 0 where key_prev_week = "+IntToStr(tmp));
			   try{
			   	FIBQueryWeeksDelete->ExecQuery();
			   	FIBTransactionUpdate->Commit();
			   	}
			   catch(...){
			   	FIBTransactionUpdate->Rollback();
			   	MessageDlg("Невозможно удалить PREV_WEEKS!", mtError, TMsgDlgButtons() << mbOK, 0);
			   	}
*/
			   if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
			DM->FIBQueryWeeksDelete->SQL->Clear();
			DM->FIBQueryWeeksDelete->SQL->Add("update WEEKS set wks_state = 1 WHERE UNIQW = "+IntToStr(tmp));
			   try{
					DM->FIBQueryWeeksDelete->ExecQuery();
					DM->FIBTransactionUpdate->Commit();
					}
			   catch(...){
			   	DM->FIBTransactionUpdate->Rollback();
					MessageDlg("Невозможно закрыть WEEKS!", mtError, TMsgDlgButtons() << mbOK, 0);
			   	}
			   DM->FIBDataSetWeeks->Open();
            }
			}

		}
	else{
		MessageDlg("Нет выбранных отчетов для UPDATE!", mtError, TMsgDlgButtons() << mbOK, 0);
		}
}
//---------------------------------------------------------------------------




void __fastcall TFormMain::BitBtnDolgClick(TObject *Sender)
{
	int tmp=0,protect=0;

	if(DM->FIBDataSetWeeks->FieldValues["UNIQW"].Type() == varInteger)
		tmp = DM->FIBDataSetWeeks->FieldValues["UNIQW"];
      
	if(DM->FIBDataSetWeeks->FieldValues["wks_state"].Type() == varInteger)
		protect = DM->FIBDataSetWeeks->FieldValues["wks_state"];

  	if(protect!=0){
      MessageDlg("Отчетный период уже закрыт!", mtError, TMsgDlgButtons() << mbOK, 0);
		return;
      }

   if(tmp>0){
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
	  DM->FIBStoredProcReportThmInfo->ParamByName("VI_WEEK")->AsInteger=tmp;
		try{
			DM->FIBStoredProcReportThmInfo->ExecProc();               
			DM->FIBTransactionUpdate->Commit();
		 MessageDlg("Долги выписаны.", mtInformation, TMsgDlgButtons() << mbOK, 0);
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("Невозможно выписать долги!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
	  }
   else MessageDlg("Не верный код отчета.\nДолги не выписываюстя!", mtError, TMsgDlgButtons() << mbOK, 0);
}
//---------------------------------------------------------------------------



void __fastcall TFormMain::ButtonCleanOrderTrashClick(TObject *Sender)
{
	if(MessageDlg("Удалить мусор из базы?", mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes){
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBQueryTools->SQL->Clear();
		DM->FIBQueryTools->SQL->Add("delete from orders where key_smn_start < "+EditClean->Text+" and ord_state not in (0,1,3,4,6)");
		DM->FIBQueryTools->ExecQuery();
		DM->FIBTransactionUpdate->Commit();
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ButtonOrdersClearClick(TObject *Sender)
{
	if(MessageDlg("Удалить заказы?", mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes)
	if(MessageDlg("Действительно удалить заказы?", mtError, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes)
	if(MessageDlg("Последний раз спрашиваю, удалять ? ? ?", mtError, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes){
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBQueryTools->SQL->Clear();
		DM->FIBQueryTools->SQL->Add("delete from orders where key_smn_start < "+EditClean->Text+" and ord_state not in (0,4,6) and key_client =0 ");
		DM->FIBQueryTools->ExecQuery();
		DM->FIBTransactionUpdate->Commit();
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ButtonLocationsCearClick(TObject *Sender)
{
	if(MessageDlg("Очистить историю движения?", mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes){	
		Screen->Cursor=crSQLWait;
		//Refresh();
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBQueryTools->SQL->Clear();
		DM->FIBQueryTools->SQL->Add("update orders  set key_locations = 0 where key_locations in (select uniql from locations where key_smn_start < "+EditClean->Text+")");
		DM->FIBQueryTools->ExecQuery();
		DM->FIBTransactionUpdate->Commit();
//		if (!FIBTransactionUpdate->InTransaction) FIBTransactionUpdate->StartTransaction();
//		FIBQueryTools->SQL->Clear();
//		FIBQueryTools->SQL->Add("update locations  set prev_locations = 0 where key_smn_start < "+EditClean->Text+"or key_smn_stop < "+EditClean->Text);
//		FIBQueryTools->ExecQuery();
//		FIBTransactionUpdate->Commit();
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBQueryTools->SQL->Clear();
		DM->FIBQueryTools->SQL->Add("delete from locations  where uniql <>0 and key_smn_start < "+EditClean->Text);
		DM->FIBQueryTools->ExecQuery();
		DM->FIBTransactionUpdate->Commit();
		Screen->Cursor=crDefault;
	}
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::TabSheetToolsShow(TObject *Sender)
{
	if(DM->FIBDatabase->Connected)
		DM->FIBDataSetSmnTools->Open();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheetToolsHide(TObject *Sender)
{
	DM->FIBDataSetSmnTools->Close();	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ButtonReCalcClick(TObject *Sender)
{
	MessageDlg("Пока не работает", mtInformation, TMsgDlgButtons() << mbOK, 0) ;
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheet1Show(TObject *Sender)
{
	DM->FIBDataSetLocation->Open();	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheet1Hide(TObject *Sender)
{
	DM->FIBDataSetLocation->Close();
}
//---------------------------------------------------------------------------

