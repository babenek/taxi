//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UnitMain.h"
#include "UnitOrder.h"
#include "UnitPassword.h"
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
#pragma link "DBCtrlsEh"
#pragma link "DBLookupEh"
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
//	DBPhone=ExtractFilePath(Application->ExeName)+"PHONE.FDB";

	TIniFile *IniFile = new TIniFile(ExtractFilePath(Application->ExeName)+"dbconf.ini");
	if (IniFile->SectionExists("CONNECTIONS") == true){
		PrimaryHost = IniFile->ReadString("CONNECTIONS", "PRIMARY_HOST", PrimaryHost);
		SecondaryHost = IniFile->ReadString("CONNECTIONS", "SECONDARY_HOST", SecondaryHost);
		UserName = IniFile->ReadString("CONNECTIONS", "USERNAME", UserName);
		Password = IniFile->ReadString("CONNECTIONS", "PASSWORD", Password);
		DBName = IniFile->ReadString("CONNECTIONS", "DBNAME", DBName);
//		DBPhone= IniFile->ReadString("CONNECTIONS", "DBNAME_PHONE", DBPhone);
		}
	else{
		IniFile->WriteString("CONNECTIONS","PRIMARY_HOST",PrimaryHost);
		IniFile->WriteString("CONNECTIONS","SECONDARY_HOST",SecondaryHost);
		IniFile->WriteString("CONNECTIONS","USERNAME", UserName);
		IniFile->WriteString("CONNECTIONS","PASSWORD", Password);
		IniFile->WriteString("CONNECTIONS","DBNAME",DBName);
//		IniFile->WriteString("CONNECTIONS","DBNAME_PHONE",DBPhone);
		}
	delete IniFile;

	HostName = AnsiString::StringOfChar(' ', 64);
	gethostname(HostName.c_str(),64);

//	if(MessageDlg("Подключится к основному серверу?", mtCustom, TMsgDlgButtons()<<mbYes<<mbNo, 0) != mrYes)
//		PrimaryHost=SecondaryHost;

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

	AnsiString tmpstr,tmpstr2;
	AnsiString HostName = "0123456789ABCDEF0123456789ABCDEF";
	int tmp=32;
	gethostname(HostName.c_str(),tmp);

	if(!DM->FIBDatabase->Connected) DM->FIBDatabase->Open();
	if(!DM->FIBTransaction->Active) DM->FIBTransaction->StartTransaction();


	DM->FIBDataSetCFG->SQLs->SelectSQL->Clear();
	DM->FIBDataSetCFG->SQLs->SelectSQL->Add("select val from cfg where mod=\'REPORTS\' and par=\'PASSWORD\'");
	if(!DM->FIBDataSetCFG->Active) DM->FIBDataSetCFG->Open();
	if(DM->FIBDataSetCFG->FieldValues["VAL"].Type() == varString)
		tmpstr=DM->FIBDataSetCFG->FieldValues["VAL"];
	DM->FIBDataSetCFG->Close();

	FormPassword->Password=tmpstr;
//*****************************
//	FormPassword->ShowModal();
	if(true || FormPassword->ResultOK){


		DM->FIBDataSetWeeks->Open();
		DM->FIBDataSetWeeks->Last();
//-------------

		ComboBoxOrdType->Items->Clear();
		DM->FIBDataSetSOrdType->Open();
		CodOrdType=new int [DM->FIBDataSetSOrdType->RecordCount];
	   tmp=0;
	   DM->FIBDataSetSOrdType->First();
	   while (!DM->FIBDataSetSOrdType->Eof){
		*(CodOrdType+tmp)=DM->FIBDataSetSOrdType->FieldValues["COD_ORD_TYPE"];
		if(DM->FIBDataSetSOrdType->FieldValues["NAME_ORD_TYPE"].Type() == varString){
			tmpstr=AnsiString(DM->FIBDataSetSOrdType->FieldValues["NAME_ORD_TYPE"]);
				ComboBoxOrdType->Items->Add("["+IntToStr(*(CodOrdType+tmp))+"] "+tmpstr);
			}
		else{
			ComboBoxOrdType->Items->Add("["+IntToStr(*(CodOrdType+tmp))+"] ???");
			}
		tmp++;
		DM->FIBDataSetSOrdType->Next();
		}
	   ComboBoxOrdType->ItemIndex=1;
	   DM->FIBDataSetSOrdType->Close();
//-   ------------
		ComboBoxClients->Items->Clear();
		DM->FIBDataSetSClients->Open();
		CodClients=new int [DM->FIBDataSetSClients->RecordCount];
	   tmp=0;
	   DM->FIBDataSetSClients->First();
		while (!DM->FIBDataSetSClients->Eof){
			*(CodClients+tmp)=DM->FIBDataSetSClients->FieldValues["UNIQC"];
			if(DM->FIBDataSetSClients->FieldValues["CLT_NAME"].Type() == varString)
				tmpstr=AnsiString(DM->FIBDataSetSClients->FieldValues["CLT_NAME"]);
			else
				tmpstr="???";

			if(DM->FIBDataSetSClients->FieldValues["CLT_INFO"].Type() == varString)
				tmpstr2=AnsiString(DM->FIBDataSetSClients->FieldValues["CLT_INFO"]);
			else
				tmpstr2=" ";

			ComboBoxClients->Items->Add(tmpstr+" ["+IntToStr(*(CodClients+tmp))+"] "+tmpstr2);

			tmp++;
		DM->FIBDataSetSClients->Next();
		}
	   ComboBoxClients->ItemIndex=0;
	   DM->FIBDataSetSClients->Close();
//-------------

		Caption="ОТЧЕТЫ v."+VersionInfo->FileVersion+"  Server:"+PrimaryHost;
		CalendarReport->Date=Now();
	   CalendarReport->EndDate=Now();
	   CalendarDetail->Date=Now();
	   CalendarDetail->EndDate=Now();
	   CalendarWeeks->MultiSelect=false;
	   CalendarWeeks->Date=Now();
	   CalendarWeeks->EndDate=Now();
//	   CalendarWeeks->MultiSelect=true;
		DateTimePickerStartDate->Date=Now()-25;
		DateTimePickerStopDate->Date=Now();
//	   CalendarWeeks->MaxSelectRange=7;
		CalendarWeeksClick(this);
		}
	else
		Close();
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::BitBtnSmnReportClick(TObject *Sender)
{
	if ( DM->FIBDataSetSmnReport->RecordCount > 0){
		DM->FIBDataSetReport->Close();

		DM->FIBDataSetReport->SQLs->SelectSQL->Clear();
		DM->FIBDataSetReport->SQLs->SelectSQL->Add("select     key_ord_type,name_ord_type, count(uniqo), sum(ord_hours), sum(ord_cost)");
		DM->FIBDataSetReport->SQLs->SelectSQL->Add("from       orders, s_ord_type  ");
		DM->FIBDataSetReport->SQLs->SelectSQL->Add("where      key_ord_type = cod_ord_type ");
		DM->FIBDataSetReport->SQLs->SelectSQL->Add("and        ord_state in (1,3)                    ");
		if ( DBGridEhSmnReport->SelectedRows->Count > 1 ){
			DM->FIBDataSetReport->SQLs->SelectSQL->Add("and     key_smn_start in (");
			TDataSet *pDS = DBGridEhSmnReport->DataSource->DataSet;
			for (int n=0; n < DBGridEhSmnReport->SelectedRows->Count; n++){
				pDS->GotoBookmark((void *)DBGridEhSmnReport->SelectedRows->Items[n].c_str());
				DM->FIBDataSetReport->SQLs->SelectSQL->Add(AnsiString(pDS->Fields->FieldByName("UNIQS")->Value));
				if(n+1 < DBGridEhSmnReport->SelectedRows->Count) DM->FIBDataSetReport->SQLs->SelectSQL->Add(",");
				}
			DM->FIBDataSetReport->SQLs->SelectSQL->Add(") ");
			}
		else{
			DM->FIBDataSetReport->SQLs->SelectSQL->Add("and     key_smn_start = " + AnsiString (DM->FIBDataSetSmnReport->FieldValues["UNIQS"]) );
			}
		DM->FIBDataSetReport->SQLs->SelectSQL->Add("group by   key_ord_type,name_ord_type         ");
		DM->FIBDataSetReport->Open();
		}
	else{
		MessageDlg("Неt смен для отчета!", mtError, TMsgDlgButtons() << mbOK, 0);
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::BitBtnReLocTypeClick(TObject *Sender)
{
	int UNIQL=DM->FIBDataSetSTheme->FieldValues["UNIQL"];
	short COD_THEME=DM->FIBDataSetSTheme->FieldValues["COD_THEME"];
	if (UNIQL > 0){ //если локация реальная - ее надо закрыть прежде, чем делать новую
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBStoredProc_ORDER_STOP->ParamByName("VI_KEY_LOCATIONS")->AsInteger=UNIQL;
		DM->FIBStoredProc_ORDER_STOP->ParamByName("VI_SMN_STOP")->AsInteger=0;
		DM->FIBStoredProc_ORDER_STOP->ParamByName("VI_TIME_STOP")->Clear();
		try{// пытаемся закрыть заказ, если он вообще такой есть...
			DM->FIBStoredProc_ORDER_STOP->ExecProc(); //выполнение процедуры, вдруг закроет
			//StopCount=DM->FIBStoredProc_ORDER_STOP->ParamByName("VO_STOP_COUNT")->AsShort; //проверка сколько записей закрыто
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("Невозможно завершить заказ!\nПопробуйте еще раз", mtError, TMsgDlgButtons() << mbOK, 0);
			return;
			}

			short StopCount=0;
			if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
			DM->FIBStoredProc_LOCATION_STOP->ParamByName("VI_UNIQL")->AsInteger=UNIQL;
			DM->FIBStoredProc_LOCATION_STOP->ParamByName("VI_SMN_STOP")->AsInteger=0;
			try{
				DM->FIBStoredProc_LOCATION_STOP->ExecProc(); //выполнение процедуры, вдруг закроет
				DM->FIBTransactionUpdate->Commit();
				StopCount=DM->FIBStoredProc_LOCATION_STOP->ParamByName("VO_STOP_COUNT")->AsShort; //проверка сколько записей закрыто
				}
			catch(...){
				DM->FIBTransactionUpdate->Rollback();
				StopCount=0;
				MessageDlg("ReLocType: Невозможно закрыть локацию", mtError, TMsgDlgButtons() << mbOK, 0);
				}
			if(StopCount){//если локация закрыта - делаем новую
				if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THEME")->AsShort=COD_THEME;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_PREV_LOCATIONS")->AsInteger=UNIQL;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_SMN_START")->AsInteger=0;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOC_TYPE")->AsShort=((TControl*)Sender)->Tag;//CurrentThemeLabel->LocType;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOCATION")->AsShort=0;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THM_RESSORT")->AsShort=0;
				try{
					DM->FIBStoredProc_LOCATION_START->ExecProc();
					DM->FIBTransactionUpdate->Commit();
					}
				catch(...){
					DM->FIBTransactionUpdate->Rollback();
					MessageDlg("ReLocType не удачна!", mtError, TMsgDlgButtons() << mbOK, 0);
					}
				}
			else {ShowMessage("ReLocType: Шеф,все пропало! Машина уже уехала");}// видимо, ошибка - придется делать отмену и перечитывать состояния локаций.
			}

	else{//если локация новая, видимо только из гаража на ремонт и тд. - делаем новую
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
			DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THEME")->AsShort=COD_THEME;//=CurrentThemeLabel->Theme;
			DM->FIBStoredProc_LOCATION_START->ParamByName("VI_PREV_LOCATIONS")->AsInteger=0;// по умолчанию
			DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOCATION")->AsShort=0;// ясен пень, что его этой функцией его могли перекинуть с гаража
			DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOC_TYPE")->AsShort=((TControl*)Sender)->Tag;
			DM->FIBStoredProc_LOCATION_START->ParamByName("VI_SMN_START")->AsInteger=0;
			DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THM_RESSORT")->AsShort=0;// по умолчанию
		try{
			DM->FIBStoredProc_LOCATION_START->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			//NewLocations=0;
			MessageDlg("Передислокация не удачна!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		}
	 DM->FIBDataSetSTheme->RecordModified(true);
	 DM->FIBDataSetSTheme->Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::TabSheetOrdCostHide(TObject *Sender)
{
	DM->FIBDataSetOrdCost->Close();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheetOrdCostShow(TObject *Sender)
{
	DM->FIBDataSetOrdCost->Open();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheetThemesShow(TObject *Sender)
{
	DM->FIBDataSetSTheme->Open();
	DM->FIBDataSetThemes->Open();   
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheetThemesHide(TObject *Sender)
{
	DM->FIBDataSetSTheme->Close();
	DM->FIBDataSetThemes->Close();   
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheetReportHide(TObject *Sender)
{
	DM->FIBDataSetSmnReport->Close();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheetReportShow(TObject *Sender)
{
	DM->FIBDataSetSmnReport->Open();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheetDetailShow(TObject *Sender)
{
	DM->FIBDataSetSmnDetail->Open();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheetDetailHide(TObject *Sender)
{
	DM->FIBDataSetSmnDetail->Close();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::TabControlSmnDetailChange(TObject *Sender)
{
	if(DM->FIBDataSetSmnDetail->Active)DM->FIBDataSetSmnDetail->Close();
	DM->FIBDataSetSmnDetail->SQLs->SelectSQL->Clear();

	if(TabControlSmnDetail->TabIndex == 0){
		DM->FIBDataSetSmnDetail->SQLs->SelectSQL->Add("SELECT UNIQS,SMN_TIME_START,SMN_TIME_STOP,SMN_STATE,SMN_WEEKEND,SMN_DATE,SMN_DAY_NIGHT,USR_LIST FROM SMENA");
		DM->FIBDataSetSmnDetail->SQLs->SelectSQL->Add("where smn_date >= :smn_start and smn_date <= :smn_stop");
		DM->FIBDataSetSmnDetail->SQLs->SelectSQL->Add("order by uniqs");
//		DM->FIBDataSetSmnDetail->Prepare();
		DM->FIBDataSetSmnDetail->ParamByName("smn_start")->AsDate=CalendarDetail->Date;
		DM->FIBDataSetSmnDetail->ParamByName("smn_stop")->AsDate=CalendarDetail->EndDate;
		}
	else if(TabControlSmnDetail->TabIndex == 15){
		if(CalendarDetail->Date.DayOfWeek()==1)
			CalendarDetail->Date=CalendarDetail->Date - 6;
		else
			CalendarDetail->Date=CalendarDetail->Date - (CalendarDetail->Date.DayOfWeek()-2);
		CalendarDetail->EndDate=CalendarDetail->Date+6;
		DM->FIBDataSetSmnDetail->SQLs->SelectSQL->Add("SELECT UNIQS,SMN_TIME_START,SMN_TIME_STOP,SMN_STATE,SMN_WEEKEND,SMN_DATE,SMN_DAY_NIGHT,USR_LIST FROM SMENA");
		DM->FIBDataSetSmnDetail->SQLs->SelectSQL->Add("where smn_date >= :smn_start and smn_date <= :smn_stop");
		DM->FIBDataSetSmnDetail->SQLs->SelectSQL->Add("order by uniqs");
//		DM->FIBDataSetSmnDetail->Prepare();
		DM->FIBDataSetSmnDetail->ParamByName("smn_start")->AsDate=CalendarDetail->Date;
		DM->FIBDataSetSmnDetail->ParamByName("smn_stop")->AsDate=CalendarDetail->EndDate;
		}
	else if(TabControlSmnDetail->TabIndex < 15 && TabControlSmnDetail->TabIndex > 0){
		if(CalendarDetail->Date.DayOfWeek()==1)
			CalendarDetail->Date = CalendarDetail->Date - 6 + (TabControlSmnDetail->TabIndex-1)/2;
		else
			CalendarDetail->Date = CalendarDetail->Date - (CalendarDetail->Date.DayOfWeek()-2) + (TabControlSmnDetail->TabIndex-1)/2;
		CalendarDetail->EndDate = CalendarDetail->Date;			
		DM->FIBDataSetSmnDetail->SQLs->SelectSQL->Add("SELECT UNIQS,SMN_TIME_START,SMN_TIME_STOP,SMN_STATE,SMN_WEEKEND,SMN_DATE,SMN_DAY_NIGHT,USR_LIST FROM SMENA");
		DM->FIBDataSetSmnDetail->SQLs->SelectSQL->Add("where smn_date = :s_date and smn_day_night = :s_day_night");
		DM->FIBDataSetSmnDetail->SQLs->SelectSQL->Add("order by uniqs");
//		DM->FIBDataSetSmnDetail->Prepare();
		DM->FIBDataSetSmnDetail->ParamByName("s_date")->AsDate=CalendarDetail->Date;
		DM->FIBDataSetSmnDetail->ParamByName("s_day_night")->AsShort=(TabControlSmnDetail->TabIndex-1)%2;
		}

	DM->FIBDataSetSmnDetail->Open();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::TabControlSmnReportChange(TObject *Sender)
{
	if(DM->FIBDataSetSmnReport->Active)DM->FIBDataSetSmnReport->Close();
	DM->FIBDataSetSmnReport->SQLs->SelectSQL->Clear();

	if(TabControlSmnReport->TabIndex == 0)
		DM->FIBDataSetSmnReport->SQLs->SelectSQL->Add("SELECT UNIQS,SMN_TIME_START,SMN_TIME_STOP,SMN_STATE,SMN_WEEKEND,SMN_DATE,SMN_DAY_NIGHT,USR_LIST FROM SMENA order by uniqs");
	else if(TabControlSmnReport->TabIndex == 15){
		CalendarReport->MultiSelect=false;
		if(CalendarReport->Date.DayOfWeek()==1)
			CalendarReport->Date=CalendarReport->Date - 6;
		else
			CalendarReport->Date=CalendarReport->Date - (CalendarReport->Date.DayOfWeek()-2);
		CalendarReport->MultiSelect=true;
		CalendarReport->EndDate=CalendarReport->Date+6;
		DM->FIBDataSetSmnReport->SQLs->SelectSQL->Add("SELECT UNIQS,SMN_TIME_START,SMN_TIME_STOP,SMN_STATE,SMN_WEEKEND,SMN_DATE,SMN_DAY_NIGHT,USR_LIST FROM SMENA");
		DM->FIBDataSetSmnReport->SQLs->SelectSQL->Add("where smn_date >= :smn_start and smn_date <= :smn_stop");
		DM->FIBDataSetSmnReport->SQLs->SelectSQL->Add("order by uniqs");
		DM->FIBDataSetSmnReport->Prepare();
		DM->FIBDataSetSmnReport->ParamByName("smn_start")->AsDate=CalendarReport->Date;
		DM->FIBDataSetSmnReport->ParamByName("smn_stop")->AsDate=CalendarReport->EndDate;
		}
	else if(TabControlSmnReport->TabIndex < 15 && TabControlSmnReport->TabIndex > 0){
		CalendarReport->MultiSelect=false;
		if(CalendarReport->Date.DayOfWeek()==1)
			CalendarReport->Date = CalendarReport->Date - 6 + (TabControlSmnReport->TabIndex-1)/2;
		else
			CalendarReport->Date = CalendarReport->Date - (CalendarReport->Date.DayOfWeek()-2) + (TabControlSmnReport->TabIndex-1)/2;

		DM->FIBDataSetSmnReport->SQLs->SelectSQL->Add("SELECT UNIQS,SMN_TIME_START,SMN_TIME_STOP,SMN_STATE,SMN_WEEKEND,SMN_DATE,SMN_DAY_NIGHT,USR_LIST FROM SMENA");
		DM->FIBDataSetSmnReport->SQLs->SelectSQL->Add("where smn_date = :s_date and smn_day_night = :s_day_night");
		DM->FIBDataSetSmnReport->SQLs->SelectSQL->Add("order by uniqs");
		DM->FIBDataSetSmnReport->Prepare();
		DM->FIBDataSetSmnReport->ParamByName("s_date")->AsDate=CalendarReport->Date;
		DM->FIBDataSetSmnReport->ParamByName("s_day_night")->AsShort=(TabControlSmnReport->TabIndex-1)%2;
		}

	DM->FIBDataSetSmnReport->Open();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::BitBtnDetailClick(TObject *Sender)
{
	if ( DM->FIBDataSetSmnDetail->RecordCount > 0){

		DM->FIBDataSetDetail->Close();
		DM->FIBDataSetDetail->SQLs->SelectSQL->Clear();
		DM->FIBDataSetDetail->SQLs->SelectSQL->Add("\
			SELECT                                    \
				 o.key_theme,                           \
				 o.uniqo,                                \
				 o.TIME_START,                            \
				 o.TIME_STOP,                              \
				 sot.name_ORD_TYPE,                         \
				 o.ORD_STATE,                                \
				 o.ORD_COST,                                  \
				 o.ord_hours,                                  \
				 o.ord_phone,                                  \
				 o.ord_itog,                                    \
				 o.ORD_DURATION,                                 \
				 o.ORD_DISTANCE,                                  \
				 o.ORD_DEPARTURE,                                  \
				 o.ORD_DESTINATION,                                 \
				 o.key_smn_start,                                    \
				 o.key_client,                                        \
				 cl.clt_name                                           \
			from orders o, s_ord_type sot, clients cl\
			");

		if(CheckBoxGarbage->Checked)
			DM->FIBDataSetDetail->SQLs->SelectSQL->Add("\
			where o.ord_state = 8                                  \
			and o.key_ord_type = sot.cod_ord_type                        \
			and o.key_client = cl.uniqc                                   \
			");
		else
			DM->FIBDataSetDetail->SQLs->SelectSQL->Add("\
			where o.ord_state in(1,3)                                  \
			and o.key_ord_type = sot.cod_ord_type                        \
			and o.key_client = cl.uniqc                                   \
			");

		if(EditTheme->Text.Length())
			DM->FIBDataSetDetail->SQLs->SelectSQL->Add("and o.key_theme = "+EditTheme->Text);
		if(CheckBoxOrdTypeFilter->Checked)
			DM->FIBDataSetDetail->SQLs->SelectSQL->Add( "and o.key_ord_type = "+IntToStr(*(CodOrdType+ComboBoxOrdType->ItemIndex)) );
		if(CheckBoxClientsFilter->Checked)
			DM->FIBDataSetDetail->SQLs->SelectSQL->Add( "and o.key_client = "+IntToStr(*(CodClients+ComboBoxClients->ItemIndex)) );

		if ( DBGridEhSmnDetail->SelectedRows->Count > 1 ){
			DM->FIBDataSetDetail->SQLs->SelectSQL->Add("and o.key_smn_start in (");
			TDataSet *pDS = DBGridEhSmnDetail->DataSource->DataSet;
			for (int n=0; n < DBGridEhSmnDetail->SelectedRows->Count; n++){
				pDS->GotoBookmark((void *)DBGridEhSmnDetail->SelectedRows->Items[n].c_str());
				DM->FIBDataSetDetail->SQLs->SelectSQL->Add(AnsiString(pDS->Fields->FieldByName("UNIQS")->Value));
				if(n+1 < DBGridEhSmnDetail->SelectedRows->Count) DM->FIBDataSetDetail->SQLs->SelectSQL->Add(",");
				}
			DM->FIBDataSetDetail->SQLs->SelectSQL->Add(") ");
			}
		else{
			DM->FIBDataSetDetail->SQLs->SelectSQL->Add("and o.key_smn_start = " + AnsiString (DM->FIBDataSetSmnDetail->FieldValues["UNIQS"]) );
			}

		if(CheckBoxLocations->Checked){
			DM->FIBDataSetDetail->SQLs->SelectSQL->Add("\
				union all                                 \
				SELECT                                     \
					 l.key_theme,                            \
					 l.uniql,                                 \
					 l.TIME_START,                             \
					 l.TIME_STOP,                               \
					 cast((cast(1440*(l.TIME_STOP - l.TIME_START) as integer) || \' мин\')as varchar(32)),     \
					 l.LOC_STATE,                                 \
					 cast(null as double precision),               \
					 cast(null as integer),                         \
					 cast(null as varchar(64)),  \
					 cast(null as double precision),                 \
					 cast(null as time),                              \
					 cast(null as integer),                            \
					 cast(sl.name_location as varchar(252)),            \
					 cast(slt.name_LOC_TYPE as varchar(252)),            \
					 l.key_smn_start,                                     \
					 cast(null as integer),                                \
					 cast(null as varchar(64))                              \
				from locations l,  s_loc_type slt, s_location sl            \
				where                                                        \
				l.key_location = sl.cod_location                              \
				and l.key_loc_type = slt.cod_loc_type                          \
				and l.key_theme > 0                                             \
				");

			if(EditTheme->Text.Length())
				DM->FIBDataSetDetail->SQLs->SelectSQL->Add("and l.key_theme = "+EditTheme->Text);

			if ( DBGridEhSmnDetail->SelectedRows->Count > 1 ){
				DM->FIBDataSetDetail->SQLs->SelectSQL->Add("and l.key_smn_start in (");
				TDataSet *pDS = DBGridEhSmnDetail->DataSource->DataSet;
				for (int n=0; n < DBGridEhSmnDetail->SelectedRows->Count; n++){
					pDS->GotoBookmark((void *)DBGridEhSmnDetail->SelectedRows->Items[n].c_str());
					DM->FIBDataSetDetail->SQLs->SelectSQL->Add(AnsiString(pDS->Fields->FieldByName("UNIQS")->Value));
					if(n+1 < DBGridEhSmnDetail->SelectedRows->Count) DM->FIBDataSetDetail->SQLs->SelectSQL->Add(",");
					}
				DM->FIBDataSetDetail->SQLs->SelectSQL->Add(") ");
				}
			else{
				DM->FIBDataSetDetail->SQLs->SelectSQL->Add("and l.key_smn_start = " + AnsiString (DM->FIBDataSetSmnDetail->FieldValues["UNIQS"]) );
				}

			}

		DM->FIBDataSetDetail->SQLs->SelectSQL->Add("order by 3");
//DM->FIBDataSetDetail->SQLs->SelectSQL->SaveToFile("test.sql");
		DM->FIBDataSetDetail->Open();
		}
	else{
		MessageDlg("Неt смен для раскопытки!", mtError, TMsgDlgButtons() << mbOK, 0);
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::CalendarWeeksClick(TObject *Sender)
{
//	CalendarWeeks->MultiSelect=false;
//	if(CalendarWeeks->Date.DayOfWeek()==1)
//		CalendarWeeks->Date=CalendarWeeks->Date - 6;
//	else
//		CalendarWeeks->Date=CalendarWeeks->Date - (CalendarWeeks->Date.DayOfWeek()-2);
//	CalendarWeeks->MultiSelect=true;
//	CalendarWeeks->EndDate=CalendarWeeks->Date+6;
//	CalendarWeeks->MultiSelect=true;
	DM->FIBDataSetSmnWeek->Close();
	DM->FIBDataSetSmnWeek->ParamByName("DATE_START")->AsDate = CalendarWeeks->Date;
	DM->FIBDataSetSmnWeek->ParamByName("DATE_STOP")->AsDate = CalendarWeeks->EndDate;
	DM->FIBDataSetSmnWeek->Open();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DBGridEhWeeksDblClick(TObject *Sender)
{
	if(DM->FIBDataSetWeeks->RecordCount>0){
		int protect=0, RepNo=DM->FIBDataSetWeeks->FieldValues["UNIQW"];
		TDate DateStart=DM->FIBDataSetWeeks->FieldValues["DATE_START"], DateStop=DM->FIBDataSetWeeks->FieldValues["DATE_STOP"];
		if(DM->FIBDataSetWeeks->FieldValues["wks_state"].Type() == varInteger)
			protect = DM->FIBDataSetWeeks->FieldValues["wks_state"];
		if(protect!=0){
		GroupBoxWeekReport->Caption="Отчет №"+IntToStr(RepNo)+"  период: " +DateStart.DateString()+ " - " + DateStop.DateString()+"     ЗАКРЫТ ";
		  DBGridEhWeekReport->ReadOnly=true;
		  }
		else{
			GroupBoxWeekReport->Caption="Отчет №"+IntToStr(RepNo)+"  период: " +DateStart.DateString()+ " - " + DateStop.DateString();
			DBGridEhWeekReport->ReadOnly=false;
			}
		DM->FIBDataSetWeekReport->Close();
		DM->FIBDataSetWeekReport->ParamByName("VI_WEEK")->AsInteger = RepNo;
		DM->FIBDataSetWeekReport->Open();
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::BitBtnReportClick(TObject *Sender)
{

	int tmp;
	DM->FIBDataSetCountUniqw->Close();
	DM->FIBDataSetCountUniqw->ParamByName("DATE_START")->AsDate=CalendarWeeks->Date;
	try{
		DM->FIBDataSetCountUniqw->ParamByName("DATE_STOP")->AsDate=CalendarWeeks->EndDate;
		}
	catch(...){
		DM->FIBDataSetCountUniqw->ParamByName("DATE_STOP")->AsDate=CalendarWeeks->Date;
		}
	DM->FIBDataSetCountUniqw->Open();
	tmp=DM->FIBDataSetCountUniqw->FieldValues["COUNT_UNIQW"];
	DM->FIBDataSetCountUniqw->Close();

	DM->FIBDataSetWeeks->Close();

	if(tmp>0){
	   MessageDlg("Отчет за указанный период существует!", mtConfirmation, TMsgDlgButtons() << mbOK, 0);
   /*
		if(MessageDlg("Отчет за указанный период существует!\nУдалить все данные по старому отчету и создать заново?", mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes){
			FormPassword->ShowModal();
			if(FormPassword->ResultOK){
         	if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
            DM->FIBStoredProcReportCreate->ParamByName("VI_DATE_START")->AsDate=CalendarWeeks->Date;
            DM->FIBStoredProcReportCreate->ParamByName("VI_DATE_STOP")->AsDate=CalendarWeeks->EndDate;
            try{
            	DM->FIBStoredProcReportCreate->ExecProc();
            	DM->FIBTransactionUpdate->Commit();
            	}
            catch(...){
            	DM->FIBTransactionUpdate->Rollback();
            	MessageDlg("Невозможно создать отчет!", mtError, TMsgDlgButtons() << mbOK, 0);
            	}
            }
			}       */
		}
	else{
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBStoredProcReportCreate->ParamByName("VI_DATE_START")->AsDate=CalendarWeeks->Date;
		DM->FIBStoredProcReportCreate->ParamByName("VI_DATE_STOP")->AsDate=CalendarWeeks->EndDate;
		try{
			DM->FIBStoredProcReportCreate->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("Невозможно создать отчет!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		}
	DM->FIBDataSetWeeks->Open();
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
			FormPassword->ShowModal();
			if(FormPassword->ResultOK){
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
		//DM->FIBTransactionUpdate->Commit();
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
			FormPassword->ShowModal();
			if(FormPassword->ResultOK){
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
//      FormOrder->Calendar->MaxSelectRange=7;
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
void __fastcall TFormMain::DBGridEhWeeksCellClick(TColumnEh *Column)
{
	CalendarWeeks->MultiSelect=false;
//	CalendarWeeks->MaxSelectRange=1+(int)(DM->FIBDataSetWeeks->FieldValues["DATE_STOP"]) - (int)(DM->FIBDataSetWeeks->FieldValues["DATE_START"]);

	if(!DM->FIBDataSetWeeks->FieldValues["DATE_STOP"].IsNull())
		CalendarWeeks->Date=DM->FIBDataSetWeeks->FieldValues["DATE_START"];
	else
		CalendarWeeks->Date=Now();

	CalendarWeeks->MultiSelect=true;
	if(!DM->FIBDataSetWeeks->FieldValues["DATE_STOP"].IsNull())
		CalendarWeeks->EndDate=DM->FIBDataSetWeeks->FieldValues["DATE_STOP"];
	else
		CalendarWeeks->EndDate=CalendarWeeks->Date;
	CalendarWeeksClick(this);
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
			FormPassword->ShowModal();
			if(FormPassword->ResultOK){
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
void __fastcall TFormMain::DBGridEhDetailKeyPress(TObject *Sender,
		char &Key)
{
	if(Key == 13 && DM->FIBDataSetDetail->State == dsEdit) 
		DM->FIBDataSetDetail->Post();   	
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::FormClose(TObject *Sender, TCloseAction &Action)
{
	DM->FIBDataSetWeekReport->Close();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormCreate(TObject *Sender)
{
	Application->OnRestore=ReportsRestore;
	TabSheetWeekReport->Show();	
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ReportsRestore(TObject *Sender)
{
//	FormPassword->ShowModal();
//	if(!FormPassword->ResultOK){
//		Application->Minimize();
//		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormActivate(TObject *Sender)
{
//WindowState=wsMaximized;	
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
			FormPassword->ShowModal();
			if(FormPassword->ResultOK){
      		DM->FIBDataSetWeeks->Close();
/*
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
				DM->FIBDataSetWeekReport->Close();
				}
			ShowMessage("Для отображения долга нужно создать следующий отчет.");
         ShowMessage("Не забывайте, для корректной работы нужен ТОЛЬКО ОДИН открытый отчет!\nСоздайте новый отчет прямо сейчас.");			
			}

		}
	else{
		MessageDlg("Нет выбранных отчетов для UPDATE!", mtError, TMsgDlgButtons() << mbOK, 0);
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheetUserHide(TObject *Sender)
{
	DM->FIBDataSetUser->Close();
	DM->FIBDataSetSUser->Close();	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::TabSheetUserShow(TObject *Sender)
{
	DM->FIBDataSetUser->Open();
	DM->FIBDataSetSUser->Open();
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

void __fastcall TFormMain::BitBtnDisableThemeClick(TObject *Sender)
{
	if (DM->FIBDataSetSTheme->FieldValues["UNIQL"]>0){
		int UniqL=DM->FIBDataSetSTheme->FieldValues["UNIQL"];
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBStoredProc_ORDER_STOP->ParamByName("VI_KEY_LOCATIONS")->AsInteger=UniqL;
		DM->FIBStoredProc_ORDER_STOP->ParamByName("VI_SMN_STOP")->AsInteger=0;
		DM->FIBStoredProc_ORDER_STOP->ParamByName("VI_TIME_STOP")->Clear();
		try{// пытаемся закрыть заказ, если он вообще такой есть...
			DM->FIBStoredProc_ORDER_STOP->ExecProc(); //выполнение процедуры, вдруг закроет
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){DM->FIBTransactionUpdate->Rollback();}// а ну и хрен сним, если не закрыл

		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBStoredProc_LOCATION_STOP->ParamByName("VI_UNIQL")->AsInteger=UniqL;
		DM->FIBStoredProc_LOCATION_STOP->ParamByName("VI_SMN_STOP")->AsInteger=0;
		try{
			DM->FIBStoredProc_LOCATION_STOP->ExecProc(); //выполнение процедуры, вдруг закроет
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("Невозможно закрыть локацию", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		DM->FIBDataSetSTheme->CloseOpen(true);
		}

   else{
		MessageDlg("Позывной уже выключен!", mtError, TMsgDlgButtons() << mbOK, 0);
      return;
   	}
}
//---------------------------------------------------------------------------



void __fastcall TFormMain::BitBtnArchiveClick(TObject *Sender)
{
	short Theme=DM->FIBDataSetSTheme->FieldValues["COD_THEME"];
   if (MessageDlg("Переместить данные позывного "+AnsiString(Theme)+" в архив?", mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes){
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBStoredProcThemeArc->ParamByName("VI_THEME")->AsInteger=Theme;
		try{
			DM->FIBStoredProcThemeArc->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("Невозможно переместить в архив!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		//DM->FIBDataSetSTheme->CloseOpen(true);
		DM->FIBDataSetThemes->CloseOpen(true);
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::DBGridEhKeyDown(TObject *Sender, WORD &Key, TShiftState Shift)
{
	if(Key==VK_RETURN)
		((TDBGridEh *)Sender)->DataSource->DataSet->Post();
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::DBGridEhClientsSortMarkingChanged(TObject *Sender)
{
	DM->FIBDataSetClients->CloseOpen(true);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::DBGridEhClientsTitleBtnClick(TObject *Sender, int ACol, TColumnEh *Column)
{
	if(Column->Title->SortMarker==smNoneEh)        Column->Title->SortMarker=smDownEh;
	else	if(Column->Title->SortMarker==smDownEh)  Column->Title->SortMarker=smUpEh;
	else                                           Column->Title->SortMarker=smNoneEh;
	((TDBGridEh *)Sender)->OnSortMarkingChanged(Sender);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::EditThemeKeyPress(TObject *Sender, char &Key)
{
	if (Key == VK_RETURN) BitBtnDetailClick(Sender);
}
//---------------------------------------------------------------------------






void __fastcall TFormMain::DBGridEhDetailGetCellParams(TObject *Sender, TColumnEh *Column, TFont *AFont, TColor &Background)
{
Background = 0;
}
//---------------------------------------------------------------------------




void __fastcall TFormMain::DBGridEhUserDblClick(TObject *Sender)
{
	DM->FIBDataSetSmenaReport->Close();

	DM->FIBDataSetSmenaReport->SQLs->SelectSQL->Clear();
	DM->FIBDataSetSmenaReport->SQLs->SelectSQL->Add("SELECT VO_UNIQS,VO_USR_LIST,VO_SMN_DATE,VO_DAY_NIGHT,VO_ORDERS,VO_ORD_COST");
	DM->FIBDataSetSmenaReport->SQLs->SelectSQL->Add("FROM SMENA_REPORT(:START_DATE,:STOP_DATE)");

	DM->FIBDataSetSmenaReport->SQLs->SelectSQL->Add("where vo_usr_list like \'%"+DM->FIBDataSetUser->FieldValues["NAME_USER"]+"%\'");


	DM->FIBDataSetSmenaReport->ParamByName("START_DATE")->AsDate=TDate(DateTimePickerStartDate->Date);
	DM->FIBDataSetSmenaReport->ParamByName("STOP_DATE")->AsDate=DateTimePickerStopDate->Date;

	DM->FIBDataSetSmenaReport->Open();	
}
//---------------------------------------------------------------------------


