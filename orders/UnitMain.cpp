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
	DM->FIBDataSetCFG->SQLs->SelectSQL->Clear();
	DM->FIBDataSetCFG->SQLs->SelectSQL->Add("select val from cfg where mod=\'ORDERS\' and par=\'PASSWORD\'");
	if(!DM->FIBDataSetCFG->Active) DM->FIBDataSetCFG->Open();
	FormPassword->Password=DM->FIBDataSetCFG->FieldValues["VAL"];
	DM->FIBDataSetCFG->Close();


	ComboBoxOrdType->Items->Clear();

	pFIBDataSetSOrdType->Open();
	int tmp=pFIBDataSetSOrdType->RecordCount;
	AnsiString tmpstr;
	CodOrdType=new int [tmp];
	tmp=0;
	pFIBDataSetSOrdType->First();
	while (!pFIBDataSetSOrdType->Eof){
		*(CodOrdType+tmp)=(int)pFIBDataSetSOrdType->FieldValues["COD_ORD_TYPE"];
		if(pFIBDataSetSOrdType->FieldValues["NAME_ORD_TYPE"].Type() == varString){
			tmpstr = pFIBDataSetSOrdType->FieldValues["NAME_ORD_TYPE"];
			ComboBoxOrdType->Items->Add(tmpstr+" ("+IntToStr(*(CodOrdType+tmp))+")");
			}
		else{
			ComboBoxOrdType->Items->Add("? ("+IntToStr(*(CodOrdType+tmp))+")");
			}
		tmp++;
		pFIBDataSetSOrdType->Next();
		};
	ComboBoxOrdType->ItemIndex=1;
	pFIBDataSetSOrdType->Close();

	Caption="ЖУРНАЛЫ v."+VersionInfoOrders->FileVersion+" Server:"+PrimaryHost;;
	Calendar->Date=Now();
	Calendar->MultiSelect=true;

	DateTimePickerDate->Date = Now();
	DateTimePickerTime->Time = Now();

	FIBDataSet_S_ORD_TYPE->Open();
	FIBDataSet_CLIENTS->Open();
	pFIBDataSet_SMENA->Open();
	FIBDataSetSmena->Open();
	pFIBDataSetSOrdType->Open();
	pFIBDataSetClients->Open();
}
//---------------------------------------------------------------------------

void __fastcall TFormOrders::BitBtnRefreshClick(TObject *Sender)
{
	if (FIBDataSetOrders->State == dsEdit){
		FIBDataSetOrders->Post();
		DM->FIBTransactionUpdate->Commit();
		}
	FIBDataSetOrders->Close();

	int n;
	CurrentSmena=FIBDataSetSmena->Fields->FieldByName("UNIQS")->Value;
	if ( CurrentSmena > 0){
		GroupBoxZakazEdit->Caption="Текущая смена № "+IntToStr(CurrentSmena);
		GroupBoxOrders->Caption = "Журнал смены № "+IntToStr(CurrentSmena) + " "+ FIBDataSetSmena->Fields->FieldByName("SMN_TIME_START")->Value +"  "+ FIBDataSetSmena->Fields->FieldByName("USR_LIST")->Value;

		FIBDataSetOrders->SQLs->SelectSQL->Clear();
		FIBDataSetOrders->SQLs->SelectSQL->Add("SELECT key_client, UNIQO, ord_state, KEY_THEME, KEY_ORD_TYPE,ORD_COST,ORD_HOURS,ORD_ITOG,KEY_SMN_START,KEY_SMN_STOP,TIME_START,TIME_STOP,ORD_DESTINATION,ORD_DEPARTURE,ORD_PHONE");
		FIBDataSetOrders->SQLs->SelectSQL->Add("FROM ORDERS, s_ord_type");
		FIBDataSetOrders->SQLs->SelectSQL->Add("where key_ord_type = cod_ord_type and key_smn_start = "+IntToStr(CurrentSmena));

		if(CheckBoxGarbage->Checked)
			FIBDataSetOrders->SQLs->SelectSQL->Add("and ord_state in(8)");
		else
			FIBDataSetOrders->SQLs->SelectSQL->Add("and ord_state in(1,3)");
		if (EditThemeFilter->Text.Length())
			FIBDataSetOrders->SQLs->SelectSQL->Add("and key_theme in ("+EditThemeFilter->Text+")");

		if(CheckBoxClients->Checked){
			if(CheckBoxClientsOnly->Checked)
				FIBDataSetOrders->SQLs->SelectSQL->Add("and key_client <> 0 and key_client is not null");
			else
				FIBDataSetOrders->SQLs->SelectSQL->Add("and key_client = "+AnsiString(pFIBDataSetClients->FieldValues["UNIQC"]) );
			}
		else{
			if(CheckBoxClientsOnly->Checked)
				FIBDataSetOrders->SQLs->SelectSQL->Add("and key_client <> 0 and key_client is not null");
			}

		if(CheckBoxKeyOrdType->Checked){
			if(CheckBoxOrdFirmaOnly->Checked)
				FIBDataSetOrders->SQLs->SelectSQL->Add("and ord_type in (2,3)" );
			else
				FIBDataSetOrders->SQLs->SelectSQL->Add("and key_ord_type = "+AnsiString(pFIBDataSetSOrdType->FieldValues["COD_ORD_TYPE"]) );
			}
		else{
			if(CheckBoxOrdFirmaOnly->Checked)
				FIBDataSetOrders->SQLs->SelectSQL->Add("and ord_type in (2,3)" );
			}

//		FIBDataSetOrders->SQLs->SelectSQL->Add("and ord_state in(1,3)");
		FIBDataSetOrders->SQLs->SelectSQL->Add("order by uniqo");
		FIBDataSetOrders->Open();
		FIBDataSetOrders->Last();
		}
	else{
		ShowMessage("Нет выбранных смен!");
		}
}
//---------------------------------------------------------------------------


void __fastcall TFormOrders::CheckBoxCalendarClick(TObject *Sender)
{
	FIBDataSetSmena->Close();
	if(CheckBoxCalendar->Checked){
		FIBDataSetSmena->SQLs->SelectSQL->Clear();
		FIBDataSetSmena->SQLs->SelectSQL->Add("SELECT UNIQS, SMN_TIME_START, SMN_TIME_STOP, SMN_STATE, SMN_WEEKEND, SMN_DATE, SMN_DAY_NIGHT, USR_LIST ");
		if(AdminProtect)
			FIBDataSetSmena->SQLs->SelectSQL->Add("FROM SMENA where smn_state=0 and smn_date >= :smn_start and smn_date <= :smn_stop order by uniqs");
		else
			FIBDataSetSmena->SQLs->SelectSQL->Add("FROM SMENA where smn_date >= :smn_start and smn_date <= :smn_stop order by uniqs");
		FIBDataSetSmena->ParamByName("smn_start")->AsDate=Calendar->Date;
		FIBDataSetSmena->ParamByName("smn_stop")->AsDate=Calendar->EndDate;
		}
	else{
		FIBDataSetSmena->SQLs->SelectSQL->Clear();
		FIBDataSetSmena->SQLs->SelectSQL->Add("SELECT UNIQS, SMN_TIME_START, SMN_TIME_STOP, SMN_STATE, SMN_WEEKEND, SMN_DATE, SMN_DAY_NIGHT, USR_LIST  ");
		if(AdminProtect)
			FIBDataSetSmena->SQLs->SelectSQL->Add("FROM SMENA where smn_state=0 order by uniqs");
		else
			FIBDataSetSmena->SQLs->SelectSQL->Add("FROM SMENA order by uniqs");
		}
	FIBDataSetSmena->Open();
}
//---------------------------------------------------------------------------

void __fastcall TFormOrders::FIBDataSetSmenaSMN_DAY_NIGHTGetText(
		TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="день";
		else if(Sender->Value == 1) Text="ночь";
		else Text="";
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormOrders::FIBDataSetSmenaSMN_WEEKENDGetText(
		TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="будни";
		else if(Sender->Value == 1) Text="праздник";
		else Text="";
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormOrders::FIBDataSetSmenaSMN_STATEGetText(
		TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="активна";
		else if(Sender->Value == 1) Text="закрыта";
		else Text="???";
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormOrders::DBGridEhSmenaDblClick(TObject *Sender)
{
	BitBtnRefreshClick(this);
}
//---------------------------------------------------------------------------
void __fastcall TFormOrders::ButtonOnceOrderClick(TObject *Sender)
{
	int tmpTheme,n;
	tmpTheme=StrToInt(EditTheme->Text);

//	CurrentThemeLabel=NULL;
	if (CurrentSmena != 0){
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		FIBStoredProc_ORDER_START->ParamByName("VI_THEME")->AsShort=tmpTheme;
		FIBStoredProc_ORDER_START->ParamByName("VI_LOCATIONS")->AsInteger=0;
//		FIBStoredProc_ORDER_START->ParamByName("VI_TYPE")->AsShort=ComboBoxOrdType->ItemIndex+1;
		FIBStoredProc_ORDER_START->ParamByName("VI_TYPE")->AsShort=*(CodOrdType+ComboBoxOrdType->ItemIndex);
		FIBStoredProc_ORDER_START->ParamByName("VI_SMN_START")->AsShort=CurrentSmena;
		FIBStoredProc_ORDER_START->ParamByName("VI_DEPARTURE")->AsString=EditDeparture->Text;
		FIBStoredProc_ORDER_START->ParamByName("VI_DESTINATION")->AsString=EditDestination->Text;
		FIBStoredProc_ORDER_START->ParamByName("VI_PHONE")->AsString=EditPhone->Text;
		FIBStoredProc_ORDER_START->ParamByName("VI_STATE")->AsShort=3;// order is once!
		try{
			FIBStoredProc_ORDER_START->ParamByName("VI_COST")->AsDouble=(double)EditCost->Text.ToDouble();}
		catch(...){
			FIBStoredProc_ORDER_START->ParamByName("VI_COST")->Clear();}

		FIBStoredProc_ORDER_START->ParamByName("VI_TIME_START")->AsDateTime=DateTimePickerDate->Date + DateTimePickerTime->Time;
		try{
			FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->AsInteger=DBLookupComboboxEhDiscount->KeyValue;}
		catch(...){
			FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->AsInteger=0;}
		FIBStoredProc_ORDER_START->ExecProc();
		DM->FIBTransactionUpdate->Commit();

		EditDestination->Text="";
		EditDeparture->Text="";
		EditPhone->Text="";
		DBLookupComboboxEhDiscount->KeyValue = 0;
		DBLookupComboboxEhDiscount->Text = "";
		if(!CheckBoxOrdType->Checked) ComboBoxOrdType->ItemIndex=1;
		//GroupBoxZakazEdit->Tag=0;
		EditTheme->Text="";
		EditCost->Text="";
		EditTheme->SetFocus();
		BitBtnRefreshClick(this);
		}
	else{
		ShowMessage("Выберите смену!");
		}
}
//---------------------------------------------------------------------------


void __fastcall TFormOrders::FormCreate(TObject *Sender)
{
	CurrentSmena=0;
	AdminProtect=true;
//	GroupBoxZakazEdit->Tag=0;
}
//---------------------------------------------------------------------------



void __fastcall TFormOrders::BitBtnDeleteOrderClick(TObject *Sender)
{
	if (CurrentSmena != 0){
		FIBStoredProc_ORDER_DELETE->ParamByName("VI_UNIQO")->AsInteger=FIBDataSetOrders->FieldValues["UNIQO"];
		FIBStoredProc_ORDER_DELETE->ParamByName("VI_SMN_STOP")->AsString=CurrentSmena;
		FIBDataSetOrders->Close();
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		try{
			FIBStoredProc_ORDER_DELETE->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("Ошибка при удалении!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		EditDestination->Text="";
		EditDeparture->Text="";
		EditPhone->Text="";
		DBLookupComboboxEhDiscount->KeyValue=0;
		DBLookupComboboxEhDiscount->Text="";
		ComboBoxOrdType->ItemIndex=1;
		EditTheme->Text="";
		EditCost->Text="";
		EditTheme->SetFocus();
		BitBtnRefreshClick(this);
		}
	else{
		ShowMessage("Выберите смену!");
		}
}
//---------------------------------------------------------------------------


void __fastcall TFormOrders::FormActivate(TObject *Sender)
{
WindowState=wsMaximized;
}
//---------------------------------------------------------------------------

void __fastcall TFormOrders::EditDiskontKeyUp(TObject *Sender, WORD &Key,
		TShiftState Shift)
{
	if(Key == 13){
		ButtonOnceOrderClick(this);
		}
	if(Key == VK_INSERT){
		AnsiString tmpstring;
		if( FIBDataSetClientDiscont->Active )
			FIBDataSetClientDiscont->Close();
		FIBDataSetClientDiscont->ParamByName("UNIQC")->AsInteger=DBLookupComboboxEhDiscount->KeyValue;
		FIBDataSetClientDiscont->Open();
		if(FIBDataSetClientDiscont->RecordCount>0){
			tmpstring = "";
			if(FIBDataSetClientDiscont->FieldValues["ADRESS"].Type() == varString)
				tmpstring += FIBDataSetClientDiscont->FieldValues["ADRESS"];
			if(FIBDataSetClientDiscont->FieldValues["CLT_NAME"].Type() == varString)
				tmpstring += " " + FIBDataSetClientDiscont->FieldValues["CLT_NAME"];
			EditDeparture->Text=tmpstring;
			if(FIBDataSetClientDiscont->FieldValues["PHONE"].Type() == varString)
				EditPhone->Text = FIBDataSetClientDiscont->FieldValues["PHONE"];
			}
		else{
			EditDeparture->Text = "???";
			DBLookupComboboxEhDiscount->KeyValue=0;
			DBLookupComboboxEhDiscount->Text="";
			EditPhone->Text = "";
			}
		FIBDataSetClientDiscont->Close();

		}
}
//---------------------------------------------------------------------------

void __fastcall TFormOrders::EditPhoneKeyUp(TObject *Sender, WORD &Key,
		TShiftState Shift)
{
	if(Key == 13){
		ButtonOnceOrderClick(this);
		}
	if(Key == VK_INSERT){
		AnsiString tmpstring;
		if( FIBDataSetClientPhone->Active )
			FIBDataSetClientPhone->Close();
		FIBDataSetClientPhone->ParamByName("PHONE")->AsInteger=StrToInt(EditPhone->Text);
		FIBDataSetClientPhone->Open();
		if(FIBDataSetClientPhone->RecordCount>0){
			tmpstring = "";
			if(FIBDataSetClientPhone->FieldValues["ADRESS"].Type() == varString)
				tmpstring += FIBDataSetClientPhone->FieldValues["ADRESS"];
			if(FIBDataSetClientPhone->FieldValues["CLT_NAME"].Type() == varString)
				tmpstring += " "+FIBDataSetClientPhone->FieldValues["CLT_NAME"];
			EditDeparture->Text=tmpstring;
			if(FIBDataSetClientDiscont->FieldValues["UNIQC"].Type() == varInteger)
				DBLookupComboboxEhDiscount->KeyValue = FIBDataSetClientPhone->FieldValues["UNIQC"];
			}
		else{
			EditDeparture->Text = "???";
			DBLookupComboboxEhDiscount->KeyValue=0;
			DBLookupComboboxEhDiscount->Text="";
			}
		FIBDataSetClientPhone->Close();
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormOrders::CheckBoxProtectClick(TObject *Sender)
{
	if(CheckBoxProtect->Checked){
		AdminProtect=true;
		}
	else{
		//FormPassword->ShowModal();
		if(true)//FormPassword->ResultOK)
			AdminProtect=false;
		else
			AdminProtect=true;

		}
	CheckBoxCalendarClick(this);
}
//---------------------------------------------------------------------------

void __fastcall TFormOrders::EditDepartureKeyUp(TObject *Sender, WORD &Key,
		TShiftState Shift)
{
	if(Key == 13) ButtonOnceOrderClick(this);
}
//---------------------------------------------------------------------------

void __fastcall TFormOrders::FormDestroy(TObject *Sender)
{
delete [] CodOrdType;
}
//---------------------------------------------------------------------------

void __fastcall TFormOrders::EditThemeFilterKeyPress(TObject *Sender, char &Key)
{
	if(Key == VK_RETURN) BitBtnRefreshClick(this);	
}
//---------------------------------------------------------------------------

void __fastcall TFormOrders::DBGridEhOrdersKeyPress(TObject *Sender, char &Key)
{
	if (Key == VK_RETURN && (FIBDataSetOrders->State==dsEdit || FIBDataSetOrders->State==dsInsert) ) {
		FIBDataSetOrders->Post();
		}
}
//---------------------------------------------------------------------------

