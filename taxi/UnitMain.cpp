#define THMLABELWIDTH 48
#define THMLABELHEIGHT 24

//---------------------------------------------------------------------------

#include <vcl.h>
//#include <winsock.h>
#pragma hdrstop

#include "UnitMain.h"

#include <exception>
#include <iostream>
//#include <Registry.hpp>
#include "UnitOrder.h"
#include "UnitClients.h"
#include "UnitData.h"
#include "UnitMarker.h"

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
#pragma resource "*.dfm"
TFormMain *FormMain;
//---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner)	: TForm(Owner){}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormCreate(TObject *Sender)
{
	CurrentThemeLabel=NULL;
	LocationsCount=0;
	LocationCount=0;
	ThemeCount=0;
	OrdRefreshOnline=true;
	OrdRefreshDelay=true;
	OrdRefreshRezerv=true;
//	WithSave=0;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormShow(TObject *Sender)
{
// �����-�������, ���� � ������ ���������, ������ ������� ��� ������� ������ ������ � ��� ������ ���� ��������
//02.04.06 = 38809
	PrimaryHost="127.0.0.1";
	SecondaryHost="localhost";
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


//	if(MessageDlg("����������� � ��������� �������?", mtCustom, TMsgDlgButtons()<<mbYes<<mbNo, 0) != mrYes) PrimaryHost=SecondaryHost;

	if ( HostName.UpperCase().Pos(PrimaryHost) || PrimaryHost.UpperCase().Pos("LOCALHOST") || PrimaryHost.Pos("127.0.0.1")){
		MainHost=true;
		DM->FIBDatabase->DBName="127.0.0.1:"+DBName;
//		DM->FIBDatabasePhones->DBName="127.0.0.1:"+DBPhone;
		}
	else{
		MainHost=false;
		DM->FIBDatabase->DBName=PrimaryHost+":"+DBName;
//		DM->FIBDatabasePhones->DBName=PrimaryHost+":"+DBPhone;
		}

	DM->FIBDatabase->ConnectParams->UserName=UserName;
	DM->FIBDatabase->ConnectParams->Password=Password;

//	if(!DM->FIBDatabasePhones->Connected) DM->FIBDatabasePhones->Open();
//	if(!DM->FIBTransactionPhones->Active) DM->FIBTransactionPhones->StartTransaction();
	if(!DM->FIBDatabase->Connected) DM->FIBDatabase->Open();
	if(!DM->FIBTransaction->Active) DM->FIBTransaction->StartTransaction();


//_______________________________________________________________________________________________
	int n,f,s;
	AnsiString tmpstr;

	try{
		CheckBoxFreq = new TCheckBox*[9];
		}
	catch (std::bad_alloc) {  // ENTER THIS BLOCK ONLY IF bad_alloc IS THROWN.
		MessageDlg("���������� �������� ������ ��� ��������!\nCheckBoxFreq = new TCheckBox*[9];", mtError, TMsgDlgButtons() << mbOK, 0);
		exit(-1);
		}

	if(!DM->FIBDataSetCOLORS->Active) DM->FIBDataSetCOLORS->Open();
	DM->FIBDataSetCOLORS->First();
	while (!DM->FIBDataSetCOLORS->Eof){
		f=DM->FIBDataSetCOLORS->FieldValues["FREQ"];
		s=DM->FIBDataSetCOLORS->FieldValues["STATE"];
		if(f-1>=0 && f-1<9 && s>=0 && s<16){
			LabelColors[f-1][s]=RGB((short)DM->FIBDataSetCOLORS->FieldValues["LABEL_R"],(short)DM->FIBDataSetCOLORS->FieldValues["LABEL_G"],(short)DM->FIBDataSetCOLORS->FieldValues["LABEL_B"]);
			FontColors[f-1][s]=RGB((short)DM->FIBDataSetCOLORS->FieldValues["FONT_R"],(short)DM->FIBDataSetCOLORS->FieldValues["FONT_G"],(short)DM->FIBDataSetCOLORS->FieldValues["FONT_B"]);
			if (s==1){
				CheckBoxFreq[f-1]=new TCheckBox(this);
				CheckBoxFreq[f-1]->Align=alTop;
				CheckBoxFreq[f-1]->Alignment=taLeftJustify;
				CheckBoxFreq[f-1]->Checked=true;
				CheckBoxFreq[f-1]->Height=16;
				CheckBoxFreq[f-1]->ParentColor=false;
				CheckBoxFreq[f-1]->ShowHint=true;
				CheckBoxFreq[f-1]->Tag=f;
				CheckBoxFreq[f-1]->Parent = PanelRight;
				if(DM->FIBDataSetCOLORS->FieldValues["CAPTION"].Type() == varString)
					CheckBoxFreq[f-1]->Caption=DM->FIBDataSetCOLORS->FieldValues["CAPTION"];
				else
					CheckBoxFreq[f-1]->Caption="";
				if(DM->FIBDataSetCOLORS->FieldValues["HINT"].Type() == varString)
					CheckBoxFreq[f-1]->Hint=DM->FIBDataSetCOLORS->FieldValues["HINT"];
				else
					CheckBoxFreq[f-1]->Hint="";
				CheckBoxFreq[f-1]->ShowHint=true;					
				CheckBoxFreq[f-1]->Color=(TColor)LabelColors[f-1][1];
				CheckBoxFreq[f-1]->Font->Color=(TColor)FontColors[f-1][1];
				CheckBoxFreq[f-1]->OnClick=LocRefresh;
				}
			}
		DM->FIBDataSetCOLORS->Next();
		}
	DM->FIBDataSetCOLORS->Close();




	if(!DM->FIBDataSetSmena->Active) DM->FIBDataSetSmena->Open();
	CurrentSmena=0;
	SmenaWeekend=0;
//	bool LoginOk=false;
	if (DM->FIBDataSetSmena->RecordCount==1){

		DM->FIBDataSetCFG->SQLs->SelectSQL->Clear();
		DM->FIBDataSetCFG->SQLs->SelectSQL->Add("select val from cfg where mod=\'TAXI\' and par=\'NAME\'");
		if(!DM->FIBDataSetCFG->Active) DM->FIBDataSetCFG->Open();
		tmpstr=DM->FIBDataSetCFG->FieldValues["VAL"];
		DM->FIBDataSetCFG->Close();

		TDate tmp=DM->FIBDataSetSmena->FieldValues["SMN_DATE"];
		CurrentSmena=DM->FIBDataSetSmena->FieldValues["UNIQS"];
		SmenaWeekend=DM->FIBDataSetSmena->FieldValues["SMN_WEEKEND"];
		if (DM->FIBDataSetSmena->FieldValues["SMN_DAY_NIGHT"]==0)
			Caption=tmpstr+" v."+FormMain->VersionInfo->FileVersion
								+"   ����� � "+IntToStr(FormMain->CurrentSmena)
								+" ����"+tmp.FormatString("  dddd dd mmmm yyyy   ")
								+DM->FIBDataSetSmena->FieldValues["USR_LIST"]+"  >> "+HostName
								+" Server:"+PrimaryHost;
		else
			Caption=tmpstr+" v."+FormMain->VersionInfo->FileVersion+
								+"   ����� � "+IntToStr(FormMain->CurrentSmena)
								+" ����"+tmp.FormatString("  dddd dd mmmm yyyy   ")+
								DM->FIBDataSetSmena->FieldValues["USR_LIST"]+"  >> "+HostName
								+" Server:"+PrimaryHost;
//		LoginOk=true;
		//TimerCheck->Enabled=true;
		}
	else if (DM->FIBDataSetSmena->RecordCount==0){
		MessageDlg("��� �������� ����!\n��������� ����: \"������� ���������\"", mtError, TMsgDlgButtons() << mbOK, 0);
		}
	else{
		MessageDlg("��������� ���������� �������� ���� (>1)!\n��������� ������������� �������� ����������\"", mtError, TMsgDlgButtons() << mbOK, 0);
		}
	DM->FIBDataSetSmena->Close();
//	if(LoginOk){
//		if( Screen->Height > 768 ){
//			PanelTop->Height=232;
//			PanelBottom->Height=417;
//			GroupBox_ORD_DELAY->Width=500;
//			}
//		else {
//			if( Screen->Width >= 768  ){
//				PanelTop->Height=73;
//				PanelBottom->Height=322;
//				}
//			else {
//				PanelTop->Height=50;
//				PanelBottom->Height=150;
//				ScrollBoxZakazOnLine->Height=20;
//				DBGridEh_ORD_DELAY->Height=34;
//				GroupBoxZakazEdit->Width=5;
//				}
//			}
//		}
// ________________________________________________________________________________   FIBDataSet_S_LOCATION
		TMenuItem *NewItem;

		if(!DM->FIBDataSet_S_LOCATION->Active) DM->FIBDataSet_S_LOCATION->Open();
		DM->FIBDataSet_S_LOCATION->First();
		while (!DM->FIBDataSet_S_LOCATION->Eof){
			NewItem = new TMenuItem(PopupMenuClient);
			NewItem->Caption = DM->FIBDataSet_S_LOCATION->FieldValues["NAME_LOCATION"];
			NewItem->Tag = DM->FIBDataSet_S_LOCATION->FieldValues["COD_LOCATION"];
			NewItem->OnClick=MenuItemOnLineClick;
			PopupMenuOnLine->Items->Add(NewItem);
			DM->FIBDataSet_S_LOCATION->Next();
			}
		DM->FIBDataSet_S_LOCATION->Close();
// ________________________________________________________________________________   �������� �������� � ���-��

		if(!DM->FIBDataSetClients->Active) DM->FIBDataSetClients->Open();
		DM->FIBDataSetClients->First();
		while (!DM->FIBDataSetClients->Eof){
			NewItem = new TMenuItem(PopupMenuClient);
			NewItem->Caption = DM->FIBDataSetClients->FieldValues["CLT_NAME"];
			NewItem->Tag = DM->FIBDataSetClients->FieldValues["UNIQC"];
			NewItem->OnClick=miClientsClick;
			PopupMenuClient->Items->Add(NewItem);
			DM->FIBDataSetClients->Next();
			}
		DM->FIBDataSetClients->Close();
// ________________________________________________________________________________

		DM->FIBDataSetSOrdType->CloseOpen(true);
		DBLookupComboboxEhOrdType->KeyValue=1;
		//NumOrdType=DM->FIBDataSetSOrdType->RecordCount;
// ________________________________________________________________________________
		// ������� �������-������� �� �����
		if(!DM->FIBDataSet_S_LOCATION->Active) DM->FIBDataSet_S_LOCATION->Open();
		LocationCount = DM->FIBDataSet_S_LOCATION->RecordCount;
		if (LocationCount){// ���� ���� �� ���� ������� ���� �������� ��������
			try{
				GroupBoxLocation = new TGroupBox*[LocationCount];
				ScrollBoxLocation = new TScrollBox*[LocationCount];
				ImageLocation = new TImage*[LocationCount];
				}
			catch (std::bad_alloc) {  // ENTER THIS BLOCK ONLY IF bad_alloc IS THROWN.
				MessageDlg("���������� �������� ������ ��� ��������!\nGroupBoxLocation = new TGroupBox*["+IntToStr(LocationCount)+"]", mtError, TMsgDlgButtons() << mbOK, 0);
				exit(-1);
				}
			DM->FIBDataSet_S_LOCATION->First();
			for(n=0;n<LocationCount;n++){
				DM->FIBDataSet_S_LOCATION->RecNo=n+1;
//					if(DM->FIBDataSet_S_LOCATION->FieldValues["COD_LOCATION"]){
					GroupBoxLocation[n] = new TGroupBox(this);
					GroupBoxLocation[n]->Parent=PanelLocation;
					GroupBoxLocation[n]->Tag=0;

					if( Screen->Height >= 768 ){
						GroupBoxLocation[n]->Width=DM->FIBDataSet_S_LOCATION->FieldValues["WIDTH"];
						GroupBoxLocation[n]->Height=DM->FIBDataSet_S_LOCATION->FieldValues["HEIGHT"];
						GroupBoxLocation[n]->Left=DM->FIBDataSet_S_LOCATION->FieldValues["POS_LEFT"];
						GroupBoxLocation[n]->Top=DM->FIBDataSet_S_LOCATION->FieldValues["POS_TOP"];
						}
					else {
						GroupBoxLocation[n]->Width=((int)DM->FIBDataSet_S_LOCATION->FieldValues["WIDTH"])/1.5;
						GroupBoxLocation[n]->Height=((int)DM->FIBDataSet_S_LOCATION->FieldValues["HEIGHT"])/1.5;
						GroupBoxLocation[n]->Left=((int)DM->FIBDataSet_S_LOCATION->FieldValues["POS_LEFT"])/1.5;
						GroupBoxLocation[n]->Top=((int)DM->FIBDataSet_S_LOCATION->FieldValues["POS_TOP"])/1.5;
						}

					GroupBoxLocation[n]->Caption=DM->FIBDataSet_S_LOCATION->FieldValues["NAME_LOCATION"];
					ScrollBoxLocation[n] = new TScrollBox(this);
					//ScrollBoxLocation[n]->DoubleBuffered=true;
					ScrollBoxLocation[n]->Parent=GroupBoxLocation[n];
					ScrollBoxLocation[n]->Tag=DM->FIBDataSet_S_LOCATION->FieldValues["COD_LOCATION"];
					ScrollBoxLocation[n]->Align=alClient;
					ScrollBoxLocation[n]->PopupMenu=PopupMenuFalseOrder;

					ScrollBoxLocation[n]->BorderStyle=bsNone;
					ScrollBoxLocation[n]->OnDragOver=ScrollBoxDragOver;
					ScrollBoxLocation[n]->OnDragDrop=ScrollBoxLocationDragDrop;
					ScrollBoxLocation[n]->OnMouseDown=ScrollBoxLocationMouseDown;

					ImageLocation[n] = new TImage(this);
					ImageLocation[n]->Tag=DM->FIBDataSet_S_LOCATION->FieldValues["COD_LOCATION"];
//					ImageLocation[n]->Picture->Bitmap->Canvas->Brush->Style = bsSolid;
//					ImageLocation[n]->Picture->Bitmap->Canvas->Brush->Color = clWhite;
//					ImageLocation[n]->Picture->Bitmap->Canvas->Pen->Style = psSolid;
//					ImageLocation[n]->Picture->Bitmap->Canvas->Pen->Color = clBlack;
					ImageLocation[n]->Canvas->Font->Name="Arial";
					ImageLocation[n]->Canvas->Font->Size=16;
					ImageLocation[n]->Canvas->Font->Style=TFontStyles()<<fsBold;
					ImageLocation[n]->Left=0;
					ImageLocation[n]->Top=0;
					ImageLocation[n]->Picture->Bitmap->Width=ScrollBoxLocation[n]->Width;
					ImageLocation[n]->Canvas->Pen->Style=psClear;
					ImageLocation[n]->Canvas->Brush->Style=bsSolid;
					ImageLocation[n]->Canvas->Pen->Color=ScrollBoxLocation[n]->Color;
					ImageLocation[n]->Canvas->Brush->Color=ScrollBoxLocation[n]->Color;
					ImageLocation[n]->Parent=ScrollBoxLocation[n];
					ImageLocation[n]->Align = alTop;
//					ImageLocation[n]->Align = alNone;
//					ImageLocation[n]->Transparent = true;

//					ImageLocation[n]->Refresh();
					ImageLocation[n]->OnDragOver=ScrollBoxDragOver;
					ImageLocation[n]->OnDragDrop=ScrollBoxLocationDragDrop;
					ImageLocation[n]->OnMouseDown=ScrollBoxLocationMouseDown;

				}
			}
		else{
			MessageDlg("O����� ����������� S_LOCATION", mtError, TMsgDlgButtons() << mbOK, 0);
			//exit(-1);
			}
		DM->FIBDataSet_S_LOCATION->Close();// �������� �������� ������� ��������� - ���������� � �������� ����� ������� - ������ Themelabel
		if(!DM->FIBDataSet_S_THEME->Active) DM->FIBDataSet_S_THEME->Open();
		ThemeCount = DM->FIBDataSet_S_THEME->RecordCount;
		if (ThemeCount){ // ���� ������ ���� � ����������� - ������ �� ������

			try{ ThemeLabel = new TThemeLabel*[ThemeCount]; }
			catch (std::bad_alloc) {  // ENTER THIS BLOCK ONLY IF bad_alloc IS THROWN.
					MessageDlg("���������� �������� ������ ��� ��������!\nThemeLabel = new TLabel*["+IntToStr(ThemeCount)+"]", mtError, TMsgDlgButtons() << mbOK, 0);
					exit(-1);
					}

			DM->FIBDataSet_S_THEME->First();
			for(n=0;n<ThemeCount;n++){
					DM->FIBDataSet_S_THEME->RecNo=n+1;
					ThemeLabel[n] = new TThemeLabel(this);
					ThemeLabel[n]->Tag=n;
					ThemeLabel[n]->AutoSize=false;
					ThemeLabel[n]->Cursor=crHandPoint;
					ThemeLabel[n]->Width=THMLABELWIDTH;
					ThemeLabel[n]->Height=THMLABELHEIGHT;
					ThemeLabel[n]->Font->Name="Arial";
					ThemeLabel[n]->Font->Size=14;
					ThemeLabel[n]->Font->Style=TFontStyles()<<fsBold;
					ThemeLabel[n]->Layout=tlCenter;
					ThemeLabel[n]->Alignment=taCenter;
					ThemeLabel[n]->ShowHint=true;
					ThemeLabel[n]->Hint="";
					ThemeLabel[n]->Theme=short(DM->FIBDataSet_S_THEME->FieldValues["COD_THEME"]);
					if(DM->FIBDataSet_S_THEME->FieldValues["THM_MODEL"].Type()==varString)
						ThemeLabel[n]->Hint=AnsiString(DM->FIBDataSet_S_THEME->FieldValues["THM_MODEL"]);
					if(DM->FIBDataSet_S_THEME->FieldValues["THM_COLOR"].Type()==varString)
						ThemeLabel[n]->Hint+="\n"+AnsiString(DM->FIBDataSet_S_THEME->FieldValues["THM_COLOR"]);
					if(DM->FIBDataSet_S_THEME->FieldValues["THM_NUMBER"].Type()==varString)
						ThemeLabel[n]->Hint+="\n"+AnsiString(DM->FIBDataSet_S_THEME->FieldValues["THM_NUMBER"]);

					if(DM->FIBDataSet_S_THEME->FieldValues["rep_dolg"].Type()==varDouble)
						ThemeLabel[n]->Hint+="\n����: "+AnsiString(DM->FIBDataSet_S_THEME->FieldValues["rep_dolg"]);

					ThemeLabel[n]->Hint+="\nTIME:";

					if(DM->FIBDataSet_S_THEME->FieldValues["THM_INFO"].Type()==varString)
						ThemeLabel[n]->Hint+="\n"+AnsiString(DM->FIBDataSet_S_THEME->FieldValues["THM_INFO"]);


					ThemeLabel[n]->Caption=IntToStr(ThemeLabel[n]->Theme);


					if(DM->FIBDataSet_S_THEME->FieldValues["THM_FREQ"].Type()==varInteger)
						ThemeLabel[n]->Freq=short(DM->FIBDataSet_S_THEME->FieldValues["THM_FREQ"]);
					else
						ThemeLabel[n]->Freq=1;
					ThemeLabel[n]->Ressort=5;
					ThemeLabel[n]->PrevLocType=0;
					ThemeLabel[n]->LocType=0;
					ThemeLabel[n]->OnMouseDown=ThemeLabelMouseDown;
					ThemeLabel[n]->OnMouseMove=ThemeLabelMouseMove;
					ThemeLabel[n]->OnDblClick=ThemeLabelDblClick;
					ThemeLabel[n]->OnClick=ThemeLabelClick;


					ThemeLabel[n]->OnMouseLeave=ThemeLabelMouseLeave;

					ThemeLabel[n]->OnDragOver=ThemeLabelDragOver;
					ThemeLabel[n]->OnDragDrop=ThemeLabelDragDrop;

					}
			DummyThemeLabel=new TThemeLabel(this);

			}
		else{
			MessageDlg("O����� ����������� S_THEME", mtError, TMsgDlgButtons() << mbOK, 0);
			//exit(-1);
			}
		DM->FIBDataSet_S_THEME->Close();
		DBLookupComboboxEhOrdType->KeyValue=1;
		LocRefresh(this);
		DM->FIBDataSet_ORD_ONLINE->CloseOpen(true);
		DM->FIBDataSet_ORD_DELAY->CloseOpen(true);
		DM->FIBDataSet_ORD_RESERV->CloseOpen(true);


}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormActivate(TObject *Sender)
{
	DateTimePicker->DateTime=Now();
	MaskEditTime->Text=Now().FormatString("hh:nn");

	DM->FIBDataSet_ORD_ONLINE->Open();
	DM->FIBDataSet_ORD_DELAY->Open();
	DM->FIBDataSet_ORD_RESERV->Open();

//	FormMain->WindowState=wsMaximized;
	TimerCheckTimer(Sender);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::TimerOrdRezervFlashTimer(TObject *Sender)
{// �������� ��� ������ ��������������� �������
	if(DBGridEh_ORD_RESERV->FixedColor==clBtnFace){
		DBGridEh_ORD_RESERV->FixedColor=clRed;
		Beep();
		}
	else
		DBGridEh_ORD_RESERV->FixedColor=clBtnFace;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::StaticTextWeekEndClick(TObject *Sender)
{

		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		if(StaticTextWeekEnd->Tag)
			DM->FIBStoredProcSmenaWeekEnd->ParamByName("VI_SMN_WEEKEND")->AsShort=0;
		else
			DM->FIBStoredProcSmenaWeekEnd->ParamByName("VI_SMN_WEEKEND")->AsShort=1;
		DM->FIBStoredProcSmenaWeekEnd->ParamByName("VI_UNIQS")->AsInteger=CurrentSmena;
		DM->FIBStoredProcSmenaWeekEnd->ExecProc();
		try{
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){ DM->FIBTransactionUpdate->Rollback(); }
		TimerCheckTimer(this);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ThemeLabelMouseDown(TObject *Sender,TMouseButton Button, TShiftState Shift, int X, int Y){
	if(Button==mbRight){
		CurrentThemeLabel=(TThemeLabel*)Sender;
		ButtonStartOrder->Caption=IntToStr(CurrentThemeLabel->Theme);
		EditTheme->Text=ButtonStartOrder->Caption;
		ShapeLighting->Visible=true;
//		ListBoxInfo->Items->Add(IntToStr(CurrentThemeLabel->Theme)+": ����������� #"+IntToStr(CurrentThemeLabel->Ressort)+" "+IntToStr(CurrentThemeLabel->Time_Start));
		};
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ScrollBoxParkMouseMove(TObject *Sender,TShiftState Shift, int X, int Y){
	if(Shift.Contains(ssLeft)){
		ScrollBoxPark->HorzScrollBar->Position-=X-ScrollBoxStartX;
		ScrollBoxPark->VertScrollBar->Position-=Y-ScrollBoxStartY;
		ScrollBoxStartX=X;
		ScrollBoxStartY=Y;
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ScrollBoxParkMouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift, int X, int Y){
	if(Button == mbLeft){
		ScrollBoxStartX=X;
		ScrollBoxStartY=Y;
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ScrollBoxParkMouseUp(TObject *Sender,TMouseButton Button, TShiftState Shift, int X, int Y){
	if(Button == mbLeft){
		ScrollBoxStartX=0;
		ScrollBoxStartY=0;
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ReLocation(TObject *Sender)
{
	if(CurrentThemeLabel!=NULL){
		if (CurrentThemeLabel->Locations){ //���� ������� �������� - �� ���� ������� ������, ��� ������ �����
			short StopCount=0;
			if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
			DM->FIBStoredProc_ORDER_STOP->ParamByName("VI_KEY_LOCATIONS")->AsInteger=CurrentThemeLabel->Locations;
			DM->FIBStoredProc_ORDER_STOP->ParamByName("VI_SMN_STOP")->AsInteger=CurrentSmena;
			DM->FIBStoredProc_ORDER_STOP->ParamByName("VI_TIME_STOP")->Clear();
			try{// �������� ������� �����, ���� �� ������ ����� ����...
				DM->FIBStoredProc_ORDER_STOP->ExecProc(); //���������� ���������, ����� �������
				StopCount=DM->FIBStoredProc_ORDER_STOP->ParamByName("VO_STOP_COUNT")->AsShort; //�������� ������� ������� �������
				DM->FIBTransactionUpdate->Commit();
				}
			catch(...){
				DM->FIBTransactionUpdate->Rollback();
				CurrentThemeLabel=NULL;
				ButtonStartOrder->Caption="";//LabelReadyOrder->Caption="0";
				EditTheme->Text="";
				ShapeLighting->Visible=false;
				MessageDlg("���������� ��������� �����!\n���������� ��� ���", mtError, TMsgDlgButtons() << mbOK, 0);
				return;
				}
			if (StopCount<0) {
				MessageDlg("���������� ��������� �����!\n������� ��� ������", mtError, TMsgDlgButtons() << mbOK, 0);
				return;
				}

			if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
			DM->FIBStoredProc_LOCATION_STOP->ParamByName("VI_UNIQL")->AsInteger=CurrentThemeLabel->Locations;
			DM->FIBStoredProc_LOCATION_STOP->ParamByName("VI_SMN_STOP")->AsInteger=CurrentSmena;
			try{
				DM->FIBStoredProc_LOCATION_STOP->ExecProc(); //���������� ���������, ����� �������
				StopCount=DM->FIBStoredProc_LOCATION_STOP->ParamByName("VO_STOP_COUNT")->AsShort; //�������� ������� ������� �������
				DM->FIBTransactionUpdate->Commit();
				}
			catch(...){
				DM->FIBTransactionUpdate->Rollback();
				StopCount=0;
				CurrentThemeLabel=NULL;
				ButtonStartOrder->Caption="";//LabelReadyOrder->Caption="0";
				EditTheme->Text="";
				ShapeLighting->Visible=false;
				MessageDlg("���������� �����������������!\n���������� ��� ���", mtError, TMsgDlgButtons() << mbOK, 0);
				return;
				}
			if(StopCount){//���� ������� ������� - ������ �����
				CurrentThemeLabel->PrevLocations=CurrentThemeLabel->Locations;
				CurrentThemeLabel->PrevLocation=CurrentThemeLabel->Location;
				CurrentThemeLabel->PrevLocType=CurrentThemeLabel->LocType;
				if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THEME")->AsShort=CurrentThemeLabel->Theme;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_PREV_LOCATIONS")->AsInteger=CurrentThemeLabel->Locations;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOCATION")->AsShort=((TControl*)Sender)->Tag; // ��� ��� ���������� � ����� ������� ���������� ������� ������!
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOC_TYPE")->AsShort=1;//CurrentThemeLabel->LocType;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_SMN_START")->AsInteger=CurrentSmena;
				switch(CurrentThemeLabel->Ressort){
					case 1: case 4: case 7: CurrentThemeLabel->Ressort=4; break;
					case 2: case 5: case 8: default: CurrentThemeLabel->Ressort=5; break;
					case 3: case 6: case 9: CurrentThemeLabel->Ressort=6; break;
					};
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THM_RESSORT")->AsShort=CurrentThemeLabel->Ressort;
				try{
					DM->FIBStoredProc_LOCATION_START->ExecProc();
					DM->FIBTransactionUpdate->Commit();
					}
				catch(...){
					DM->FIBTransactionUpdate->Rollback();
					MessageDlg("�������������� �� ������!", mtError, TMsgDlgButtons() << mbOK, 0);
					}
				}
			else {// ������, ������ - �������� ������ ������ � ������������ ��������� �������.
				MessageDlg("���,��� �������! ������ ��� ������", mtError, TMsgDlgButtons() << mbOK, 0);
				}
			}
		else{//���� ������� �����, ������ ������ �� ������ ������ - ������ �����
			if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
				CurrentThemeLabel->PrevLocations=CurrentThemeLabel->Locations;
				CurrentThemeLabel->PrevLocation=CurrentThemeLabel->Location;
				CurrentThemeLabel->PrevLocType=CurrentThemeLabel->LocType;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THEME")->AsShort=CurrentThemeLabel->Theme;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_PREV_LOCATIONS")->AsInteger=0;// � ��������, ����� ����������, ��� ���������� ������� ��� ;)
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOCATION")->AsShort=((TControl*)Sender)->Tag; // ��� ��� ���������� � ����� ������� ���������� ������� ������!
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOC_TYPE")->AsShort=1;// ��� ���� �� ������������������ � ����� � ������� ����� � ������
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_SMN_START")->AsInteger=CurrentSmena;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THM_RESSORT")->AsShort=5;// ���� �� �� ������ ������ - �� ��������� ������� ����������
			try{
				DM->FIBStoredProc_LOCATION_START->ExecProc();
				DM->FIBTransactionUpdate->Commit();
				NewLocations=DM->FIBStoredProc_LOCATION_START->ParamByName("VO_UNIQL")->AsInteger;
				}
			catch(...){
				DM->FIBTransactionUpdate->Rollback();
				MessageDlg("�������������� �� ������!", mtError, TMsgDlgButtons() << mbOK, 0);
				}
			}
		}
	CurrentThemeLabel=NULL;
	ButtonStartOrder->Caption="";//LabelReadyOrder->Caption="0";
	EditTheme->Text="";
	ShapeLighting->Visible=false;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ReLocType(TObject *Sender)
{
	//!TimerLocRefresh->Enabled = false;
	if(CurrentThemeLabel!=NULL){
		short StopCount=0;
		if ( StrToInt(Now().FormatString("hh"))<5 && ((TControl*)Sender)->Tag==0 && CurrentThemeLabel->Ressort==5 ){
			if(MessageDlg("���bi���� "+IntToStr(CurrentThemeLabel->Theme)+" �� �����!\n��������� � �����?", mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) != mrYes){
				CurrentThemeLabel=NULL;
				ButtonStartOrder->Caption="";//LabelReadyOrder->Caption="0";
				EditTheme->Text="";
				ShapeLighting->Visible=false;
				return;
				}
			}
		if (CurrentThemeLabel->Locations){ //���� ������� �������� - �� ���� ������� ������, ��� ������ �����
			if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
			DM->FIBStoredProc_ORDER_STOP->ParamByName("VI_KEY_LOCATIONS")->AsInteger=CurrentThemeLabel->Locations;
			DM->FIBStoredProc_ORDER_STOP->ParamByName("VI_SMN_STOP")->AsInteger=CurrentSmena;
			DM->FIBStoredProc_ORDER_STOP->ParamByName("VI_TIME_STOP")->Clear();
			try{// �������� ������� �����, ���� �� ������ ����� ����...
				DM->FIBStoredProc_ORDER_STOP->ExecProc(); //���������� ���������, ����� �������
				StopCount=DM->FIBStoredProc_ORDER_STOP->ParamByName("VO_STOP_COUNT")->AsShort; //�������� ������� ������� �������
				DM->FIBTransactionUpdate->Commit();
				}
			catch(...){			
				DM->FIBTransactionUpdate->Rollback();
				CurrentThemeLabel=NULL;
				ButtonStartOrder->Caption="";//LabelReadyOrder->Caption="0";
				EditTheme->Text="";
				ShapeLighting->Visible=false;
				MessageDlg("���������� ��������� �����!\n���������� ��� ���", mtError, TMsgDlgButtons() << mbOK, 0);
				return;
				}
			if (StopCount<0) {
				MessageDlg("���������� ��������� �����!\n������� ��� ������", mtError, TMsgDlgButtons() << mbOK, 0);
				return;
				}

			if (
				(  ((TControl*)Sender)->Tag!= 5 && ((TControl*)Sender)->Tag!= 7 && ((TControl*)Sender)->Tag!= 9 && ((TControl*)Sender)->Tag!= 11 && ((TControl*)Sender)->Tag!= 13
				&& CurrentThemeLabel->LocType!= 5 && CurrentThemeLabel->LocType!= 7 && CurrentThemeLabel->LocType!= 9 && CurrentThemeLabel->LocType!= 11 && CurrentThemeLabel->LocType!= 13)
				|| CurrentThemeLabel->Ressort == 7 || CurrentThemeLabel->Ressort == 8 || CurrentThemeLabel->Ressort == 9
				){                                                                                                         // ��������, ���� ������ �� ������ ���������� � ������� - ����� �� ���������/��������� �������
				if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
				DM->FIBStoredProc_LOCATION_STOP->ParamByName("VI_UNIQL")->AsInteger=CurrentThemeLabel->Locations;
				DM->FIBStoredProc_LOCATION_STOP->ParamByName("VI_SMN_STOP")->AsInteger=CurrentSmena;
				try{
					DM->FIBStoredProc_LOCATION_STOP->ExecProc(); //���������� ���������, ����� �������
					DM->FIBTransactionUpdate->Commit();
					StopCount=DM->FIBStoredProc_LOCATION_STOP->ParamByName("VO_STOP_COUNT")->AsShort; //�������� ������� ������� �������
					}
				catch(...){
					DM->FIBTransactionUpdate->Rollback();
					StopCount=0;
					MessageDlg("ReLocType: ���������� ������� �������", mtError, TMsgDlgButtons() << mbOK, 0);
					}
				if(StopCount){//���� ������� ������� - ������ �����
					CurrentThemeLabel->PrevLocations=CurrentThemeLabel->Locations;
					CurrentThemeLabel->PrevLocation=CurrentThemeLabel->Location;
					CurrentThemeLabel->PrevLocType=CurrentThemeLabel->LocType;
					if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
					DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THEME")->AsShort=CurrentThemeLabel->Theme;
					DM->FIBStoredProc_LOCATION_START->ParamByName("VI_PREV_LOCATIONS")->AsInteger=CurrentThemeLabel->Locations;
					DM->FIBStoredProc_LOCATION_START->ParamByName("VI_SMN_START")->AsInteger=CurrentSmena;
					DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOC_TYPE")->AsShort=((TControl*)Sender)->Tag;//CurrentThemeLabel->LocType;
					if ( ((TControl*)Sender)->Tag&0x01 ){// ���� ������� ������������ - ��������� ��� �������� ���������
						DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOCATION")->AsShort=CurrentThemeLabel->Location;
						switch (CurrentThemeLabel->Ressort){
							case 1: case 7: DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THM_RESSORT")->AsShort=4; break;
							case 2: case 8: DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THM_RESSORT")->AsShort=5; break;
							case 3: case 9: DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THM_RESSORT")->AsShort=6; break;																
							default: DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THM_RESSORT")->AsShort=CurrentThemeLabel->Ressort; break;
							};
						}
					else{// ����� - � ������ ��� �� �� �����
						DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOCATION")->AsShort=0;
						DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THM_RESSORT")->AsShort=0;
						}
					try{
						DM->FIBStoredProc_LOCATION_START->ExecProc();
						DM->FIBTransactionUpdate->Commit();
						NewLocations=DM->FIBStoredProc_LOCATION_START->ParamByName("VO_UNIQL")->AsInteger;
						}
					catch(...){
						DM->FIBTransactionUpdate->Rollback();
						MessageDlg("ReLocType �� ������!", mtError, TMsgDlgButtons() << mbOK, 0);
						NewLocations=0;
						}
					}
				else {ShowMessage("ReLocType: ���,��� �������! ������ ��� ������");}// ������, ������ - �������� ������ ������ � ������������ ��������� �������.
				}
			else{// �����, ���� ������ �������� � ������� - ������ ������ �� ��� �������
				if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
				DM->FIBStoredProc_LOCATION_UPDATE->ParamByName("VI_UNIQL")->AsInteger=CurrentThemeLabel->Locations;
				DM->FIBStoredProc_LOCATION_UPDATE->ParamByName("VI_LOC_TYPE")->AsShort=((TControl*)Sender)->Tag;//CurrentThemeLabel->LocType;
				DM->FIBStoredProc_LOCATION_UPDATE->ParamByName("VI_THM_RESSORT")->AsShort=CurrentThemeLabel->Ressort;
				try{
					DM->FIBStoredProc_LOCATION_UPDATE->ExecProc();
					DM->FIBTransactionUpdate->Commit();
					NewLocations=CurrentThemeLabel->Locations;
					}
				catch(...){
					DM->FIBTransactionUpdate->Rollback();
					NewLocations=0;
					MessageDlg("NewLocType �� ������!", mtError, TMsgDlgButtons() << mbOK, 0);
					}
				if (((TComponent *)Sender)->Tag==1 && CurrentThemeLabel->Ressort>6 && (CurrentThemeLabel->LocType==9 || CurrentThemeLabel->LocType==11)){
				//���� ������ �������������� � ��� ����� ���������� ����� ������ � ����� �������
					Tag=CurrentThemeLabel->Location;
					ReLocation(this);
					}
				}
			}
		else{//���� ������� �����, ������ ������ �� ������ �� ������ � ��. - ������ �����
			if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
				CurrentThemeLabel->PrevLocations=CurrentThemeLabel->Locations;
				CurrentThemeLabel->PrevLocation=CurrentThemeLabel->Location;
				CurrentThemeLabel->PrevLocType=CurrentThemeLabel->LocType;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THEME")->AsShort=CurrentThemeLabel->Theme;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_PREV_LOCATIONS")->AsInteger=0;// �� ���������
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOCATION")->AsShort=0;// ���� ����, ��� ��� ���� �������� ��� ����� ���������� � ������ 
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_LOC_TYPE")->AsShort=((TControl*)Sender)->Tag;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_SMN_START")->AsInteger=CurrentSmena;
				DM->FIBStoredProc_LOCATION_START->ParamByName("VI_THM_RESSORT")->AsShort=5;// �� ���������
			try{
				DM->FIBStoredProc_LOCATION_START->ExecProc();
				DM->FIBTransactionUpdate->Commit();
				NewLocations=DM->FIBStoredProc_LOCATION_START->ParamByName("VO_UNIQL")->AsInteger;
				}
			catch(...){
				DM->FIBTransactionUpdate->Rollback();
				NewLocations=0;
				MessageDlg("�������������� �� ������!", mtError, TMsgDlgButtons() << mbOK, 0);
				}
			}
		}
	CurrentThemeLabel=NULL;
	ButtonStartOrder->Caption="";//LabelReadyOrder->Caption="0";
	EditTheme->Text="";
	ShapeLighting->Visible=false;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::Ressort(TObject *Sender)
{
	if(CurrentThemeLabel!=NULL){
		short tmpRessort=5;
		switch(((TControl*)Sender)->Tag){
			case 123://��������������
				if ( CurrentThemeLabel->Ressort==4 || CurrentThemeLabel->Ressort==7 )tmpRessort=1;
				else if ( CurrentThemeLabel->Ressort==5 || CurrentThemeLabel->Ressort==8 )tmpRessort=2;
				else if ( CurrentThemeLabel->Ressort==6 || CurrentThemeLabel->Ressort==9 )tmpRessort=3;
				else return;//DM->FIBStoredProc_LOCATION_UPDATE->ParamByName("VI_THM_RESSORT")->AsShort=5;												
				break;
			case 147://� ����
				if ( CurrentThemeLabel->Ressort==2 || CurrentThemeLabel->Ressort==3 )tmpRessort=1;
				else if ( CurrentThemeLabel->Ressort==5 || CurrentThemeLabel->Ressort==6 )tmpRessort=4;
				else if ( CurrentThemeLabel->Ressort==8 || CurrentThemeLabel->Ressort==9 )tmpRessort=7;
				else return;//DM->FIBStoredProc_LOCATION_UPDATE->ParamByName("VI_THM_RESSORT")->AsShort=5;	  			
				break;
			case 369://� ������
				if ( CurrentThemeLabel->Ressort==1 || CurrentThemeLabel->Ressort==2 )tmpRessort=3;
				else if ( CurrentThemeLabel->Ressort==4 || CurrentThemeLabel->Ressort==5 )tmpRessort=6;
				else if ( CurrentThemeLabel->Ressort==7 || CurrentThemeLabel->Ressort==8 )tmpRessort=9;
				else return;//DM->FIBStoredProc_LOCATION_UPDATE->ParamByName("VI_THM_RESSORT")->AsShort=5;
				break;
			case 258://����� � �������
				if ( CurrentThemeLabel->Ressort==1 || CurrentThemeLabel->Ressort==3 )tmpRessort=2;
				else if ( CurrentThemeLabel->Ressort==4 || CurrentThemeLabel->Ressort==6 )tmpRessort=5;
				else if ( CurrentThemeLabel->Ressort==7 || CurrentThemeLabel->Ressort==9 )tmpRessort=8;
				else return;//DM->FIBStoredProc_LOCATION_UPDATE->ParamByName("VI_THM_RESSORT")->AsShort=5;			
				break;							
			case 456://������������ � �������
				if ( CurrentThemeLabel->Ressort==1 || CurrentThemeLabel->Ressort==7 )tmpRessort=4;
				else if ( CurrentThemeLabel->Ressort==2 || CurrentThemeLabel->Ressort==8 )tmpRessort=5;
				else if ( CurrentThemeLabel->Ressort==3 || CurrentThemeLabel->Ressort==9 )tmpRessort=6;
				else return;//DM->FIBStoredProc_LOCATION_UPDATE->ParamByName("VI_THM_RESSORT")->AsShort=5;
				break;
			case 789://� ����� �������
				if ( CurrentThemeLabel->Ressort==1 || CurrentThemeLabel->Ressort==4 )tmpRessort=7;
				else if ( CurrentThemeLabel->Ressort==2 || CurrentThemeLabel->Ressort==5 )tmpRessort=8;
				else if ( CurrentThemeLabel->Ressort==3 || CurrentThemeLabel->Ressort==6 )tmpRessort=9;
				else return;//DM->FIBStoredProc_LOCATION_UPDATE->ParamByName("VI_THM_RESSORT")->AsShort=5;
				break;
			default:// ����� �����-��
				return;
			};
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBStoredProc_LOCATION_UPDATE->ParamByName("VI_UNIQL")->AsInteger=CurrentThemeLabel->Locations;
		DM->FIBStoredProc_LOCATION_UPDATE->ParamByName("VI_LOC_TYPE")->AsShort=CurrentThemeLabel->LocType;
		DM->FIBStoredProc_LOCATION_UPDATE->ParamByName("VI_THM_RESSORT")->AsShort = tmpRessort;
		try{
			DM->FIBStoredProc_LOCATION_UPDATE->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("�������� � �������� �� ������!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		}
	CurrentThemeLabel=NULL;
	ButtonStartOrder->Caption="";//LabelReadyOrder->Caption="0";
	EditTheme->Text="";
	ShapeLighting->Visible=false;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ThemeLabelDblClick(TObject *Sender)
{
	if (CurrentThemeLabel != NULL){
		switch(CurrentThemeLabel->LocType){
			case 1:
//				miMarkClick(Sender);
				PanelLocation->Tag=9;// ���� �� ������� 15 ���.
				ReLocType(PanelLocation);
				break;
			case 3:
				miOrderEditClick(this);
				break;
			case 5:
			case 7:
			case 9:
			case 11:
			case 13:
				PanelLocation->Tag=1;// ����������
				ReLocType(PanelLocation);
				break;
			default: break;
			};
		}
	CurrentThemeLabel=NULL;
	ButtonStartOrder->Caption="";//LabelReadyOrder->Caption="0";
	EditTheme->Text="";
	ShapeLighting->Visible=false;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::BitBtnRessortNightClick(TObject *Sender)
{
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		try{
			DM->FIBStoredProcRessortNight->ExecProc();
			int tmp=DM->FIBStoredProcRessortNight->ParamByName("VO_RESSORT")->AsInteger;
			DM->FIBTransactionUpdate->Commit();
			MessageDlg("� ���� ��������: "+IntToStr(tmp), mtInformation, TMsgDlgButtons() << mbOK, 0);
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("�� ������� ��������� ������ � ������ �����!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
	EditDeparture->SetFocus();			
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::BitBtnRessortDayClick(TObject *Sender)
{
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		try{
			DM->FIBStoredProcRessortDay->ExecProc();
			int tmp=DM->FIBStoredProcRessortDay->ParamByName("VO_RESSORT")->AsInteger;
			DM->FIBTransactionUpdate->Commit();
			MessageDlg("����� � �������: "+IntToStr(tmp), mtInformation, TMsgDlgButtons() << mbOK, 0);
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("����� ���� � ������� �� �������!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
	EditDeparture->SetFocus();			
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::SendOrder(TObject *Sender)
{
	AnsiString tempMessage;
	switch (((TComponent*)Sender)->Tag){
		case 11:
			tempMessage="�������� ���������: "+IntToStr(CurrentThemeLabel->Theme)+"\n�� ����� ?";
			break;
		case 12:
			tempMessage="�������� ���������: "+IntToStr(CurrentThemeLabel->Theme)+"\n��������� ?";
			break;
		case 10:
			tempMessage="�������� ���������: "+IntToStr(CurrentThemeLabel->Theme)+"\n����� ?";
			break;
		case 13:
			tempMessage="�������� ����� (10���.) ���������: "+IntToStr(CurrentThemeLabel->Theme);
			break;
		case 17:
			tempMessage="�������� ���������: "+IntToStr(CurrentThemeLabel->Theme)+"\n���������� ?";
			break;
		case 24:
			tempMessage="�������� ����� ������� � ���� ���������: "+IntToStr(CurrentThemeLabel->Theme)+" ?";
			break;
		default:
			tempMessage="����������� ���������� - ����� �������� ���!";
			break;
		}

	if(MessageDlg(tempMessage, mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes){
			if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_THEME")->AsShort=CurrentThemeLabel->Theme;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_LOCATIONS")->AsInteger=CurrentThemeLabel->Locations;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_TYPE")->AsShort=((TComponent*)Sender)->Tag;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_SMN_START")->AsInteger=CurrentSmena;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_DEPARTURE")->AsString=EditDeparture->Text;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_DESTINATION")->AsString=EditDestination->Text;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_STATE")->AsShort=3;// order is once!
         DM->FIBStoredProc_ORDER_START->ParamByName("VI_COST")->Clear();
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_TIME_START")->Clear();
			try{
				DM->FIBStoredProc_ORDER_START->ExecProc();
				DM->FIBTransactionUpdate->Commit();
				}
			catch(...){
				DM->FIBTransactionUpdate->Rollback();
				MessageDlg("���������� �������� �����!", mtError, TMsgDlgButtons() << mbOK, 0);
				}
			}
	CurrentThemeLabel=NULL;
	ButtonStartOrder->Caption="";//LabelReadyOrder->Caption="0";
	EditTheme->Text="";
	ShapeLighting->Visible=false;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::StartOrder(TObject *Sender)
{// ���! ������� ������� �������� ������ �� ������
	if (CurrentThemeLabel!=NULL && StrToInt(ButtonStartOrder->Caption)!=0){
		NewLocations=0;                                     // DBLookupComboboxEhOrdType DBLookupComboboxEhOrdType->KeyValue
		///
		TThemeLabel *tmpCurrentThemeLabel=CurrentThemeLabel;
		if (DBLookupComboboxEhOrdType->KeyValue == 5 && CurrentThemeLabel->LocType!=3){// E��� ����� ������ - ������ ������ "�� ������, � ����� ����� ��� �������
			ReLocType(miWithSave);}
		else{
			ReLocType(Sender);}
		if (NewLocations){//���� �������� �� ������� ������ �� ������� - ����� ���������� �����
			if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_THEME")->AsShort=tmpCurrentThemeLabel->Theme;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_LOCATIONS")->AsInteger=NewLocations;
			if (((TControl*)Sender)->Tag==7) DM->FIBStoredProc_ORDER_START->ParamByName("VI_TYPE")->AsShort=9;
			else DM->FIBStoredProc_ORDER_START->ParamByName("VI_TYPE")->AsShort=DBLookupComboboxEhOrdType->KeyValue;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_SMN_START")->AsInteger=CurrentSmena;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_DEPARTURE")->AsString=EditDeparture->Text;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_DESTINATION")->AsString=EditDestination->Text;
			if (EditPHONE->Text.Length()>16) DM->FIBStoredProc_ORDER_START->ParamByName("VI_PHONE")->AsString=EditPHONE->Text.SubString(1,60);
			else DM->FIBStoredProc_ORDER_START->ParamByName("VI_PHONE")->AsString=EditPHONE->Text;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_STATE")->AsShort=0;// order is online!
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_COST")->Clear();
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_TIME_START")->Clear();
			try{
				if (StrToInt(EditDiskont->Text) == EditDiskont->Tag)
					DM->FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->AsInteger=EditDiskont->Tag;
				else
					DM->FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->AsInteger=0;
				}
			catch(...){
				DM->FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->AsInteger=0;}
			try{
				DM->FIBStoredProc_ORDER_START->ExecProc();
				DM->FIBTransactionUpdate->Commit();
				if(!CheckBoxMultiOrder->Checked && ((TComponent *)Sender)->Tag!=7){
					EditDestination->Text="";
					EditDeparture->Text="";
					EditPHONE->Text="";
					DBLookupComboboxEhOrdType->KeyValue=1;
					EditDiskont->Text="";
					EditDiskont->Tag=0;
					EditDiskont->Color=clWindow;
					EditDiskont->ReadOnly=false;
					ListBoxInfo->Items->Clear();
					}
				}
			catch(...){
				DM->FIBTransactionUpdate->Rollback();
				MessageDlg("�� ����������� �����!", mtError, TMsgDlgButtons() << mbOK, 0);
				}
			}
		else{
			MessageDlg("���������� �� ����������!\n����� �� ��������!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		}
	CurrentThemeLabel=NULL;
	ButtonStartOrder->Caption="";//LabelReadyOrder->Caption="0";
	EditTheme->Text="";

	ShapeLighting->Visible=false;
	EditDeparture->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DBGridEh_ORD_DELAYDblClick(TObject *Sender)
{
	//!TimerLocRefresh->Enabled=false;
	//!TimerOrdRefresh->Enabled=false;
	if (DM->FIBDataSet_ORD_DELAY->RecordCount > 0){
		//CurrentThemeLabel=NULL;
		int temp_UNIQO = DM->FIBDataSet_ORD_DELAY->FieldValues["UNIQO"];
		EditDeparture->Text=DM->FIBDataSet_ORD_DELAY->FieldValues["ORD_DEPARTURE"];
		EditDestination->Text=DM->FIBDataSet_ORD_DELAY->FieldValues["ORD_DESTINATION"];
		EditPHONE->Text=DM->FIBDataSet_ORD_DELAY->FieldValues["ORD_PHONE"];

		if(DM->FIBDataSet_ORD_DELAY->FieldValues["KEY_CLIENT"]>0){
			EditDiskont->Tag=DM->FIBDataSet_ORD_DELAY->FieldValues["KEY_CLIENT"];
			EditDiskont->Text=IntToStr(EditDiskont->Tag);
			EditDiskont->Color=clLime;
			EditDiskont->ReadOnly=true;
			}

		else{
			EditDiskont->Text="";
			EditDiskont->Tag=0;
			EditDiskont->ReadOnly=false;
			EditDiskont->Color=clWindow;
			}

		try{EditTheme->Text=DM->FIBDataSet_ORD_DELAY->FieldValues["KEY_THEME"];}catch(...){EditTheme->Text="";}
		//DBLookupComboboxEhOrdType->KeyValue =  1;
		DBLookupComboboxEhOrdType->KeyValue = (int)DM->FIBDataSet_ORD_DELAY->FieldValues["KEY_ORD_TYPE"];

		DM->FIBQueryOrderDelete->SQL->Clear();
		DM->FIBQueryOrderDelete->SQL->Add("update orders set ord_state=5 where uniqo="+IntToStr(temp_UNIQO));
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();

		try{
			DM->FIBQueryOrderDelete->ExecQuery();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){ DM->FIBTransactionUpdate->Rollback(); }
		}
	  EditDeparture->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DBGridEh_ORD_RESERVDblClick(TObject *Sender)
{
	//!TimerLocRefresh->Enabled=false;
	//!TimerOrdRefresh->Enabled=false;
	if (DM->FIBDataSet_ORD_RESERV->RecordCount > 0){
		TimerOrdRezervFlash->Enabled=false;
		//CurrentThemeLabel=NULL;
		DBGridEh_ORD_RESERV->FixedColor=clBtnFace;
		int temp_UNIQO = DM->FIBDataSet_ORD_RESERV->FieldValues["UNIQO"];
		EditDeparture->Text=DM->FIBDataSet_ORD_RESERV->FieldValues["ORD_DEPARTURE"];
		EditDestination->Text=DM->FIBDataSet_ORD_RESERV->FieldValues["ORD_DESTINATION"];
		EditPHONE->Text=DM->FIBDataSet_ORD_RESERV->FieldValues["ORD_PHONE"];

		if(DM->FIBDataSet_ORD_RESERV->FieldValues["KEY_CLIENT"]>0){
			EditDiskont->Tag=DM->FIBDataSet_ORD_RESERV->FieldValues["KEY_CLIENT"];
			EditDiskont->Text=IntToStr(EditDiskont->Tag);
			EditDiskont->Color=clLime;
			EditDiskont->ReadOnly=true;
			}

		else{
			EditDiskont->Text="";
			EditDiskont->Tag=0;
			EditDiskont->ReadOnly=false;
			EditDiskont->Color=clWindow;
			}

		try{EditTheme->Text=DM->FIBDataSet_ORD_RESERV->FieldValues["KEY_THEME"];}catch(...){EditTheme->Text="";}
		DBLookupComboboxEhOrdType->KeyValue =  (int)DM->FIBDataSet_ORD_RESERV->FieldValues["KEY_ORD_TYPE"];
//		for(int n=0;n<NumOrdType;n++){
//			if (*(CodOrdType+n) == ){
//				DBLookupComboboxEhOrdType->KeyValue = n;
//				break;
//				}
//			}
		DM->FIBQueryOrderDelete->SQL->Clear();
		DM->FIBQueryOrderDelete->SQL->Add("update orders set ord_state=7 where uniqo="+IntToStr(temp_UNIQO));
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		try{
			DM->FIBQueryOrderDelete->ExecQuery();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){ DM->FIBTransactionUpdate->Rollback(); }
		}
	  EditDeparture->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ButtonDelayClick(TObject *Sender)
{
//	EditPhoneExit(Sender);
	if(EditDeparture->Text.Length()){
			DM->FIBDataSet_ORD_DELAY->Close();
			if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
			if(EditTheme->Text.Length())
				DM->FIBStoredProc_ORDER_START->ParamByName("VI_THEME")->AsShort=StrToInt(EditTheme->Text);//LabelReadyOrder->Caption);
			else
				DM->FIBStoredProc_ORDER_START->ParamByName("VI_THEME")->AsShort=0;//LabelReadyOrder->Caption);
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_LOCATIONS")->AsInteger=0;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_TYPE")->AsShort=DBLookupComboboxEhOrdType->KeyValue;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_SMN_START")->AsInteger=CurrentSmena;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_DEPARTURE")->AsString=EditDeparture->Text;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_DESTINATION")->AsString=EditDestination->Text;
//			DM->FIBStoredProc_ORDER_START->ParamByName("VI_PHONE")->AsString=EditPHONE->Text;
			if (EditPHONE->Text.Length()>16) DM->FIBStoredProc_ORDER_START->ParamByName("VI_PHONE")->AsString=EditPHONE->Text.SubString(1,60);
			else DM->FIBStoredProc_ORDER_START->ParamByName("VI_PHONE")->AsString=EditPHONE->Text;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_STATE")->AsShort=((TControl *)Sender)->Tag;
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_COST")->Clear();
			if (((TControl *)Sender)->Tag==6){// ��������� = ��������������� �����
				DateTimePicker->Time = TDateTime(StrToInt(MaskEditTime->Text.SubString(1,2)),StrToInt(MaskEditTime->Text.SubString(4,2)),00,00);
				DM->FIBStoredProc_ORDER_START->ParamByName("VI_TIME_START")->AsDateTime=DateTimePicker->DateTime;
				}
			else
				DM->FIBStoredProc_ORDER_START->ParamByName("VI_TIME_START")->Clear();
			try{
				if(StrToInt(EditDiskont->Text) == EditDiskont->Tag)
					DM->FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->AsInteger=EditDiskont->Tag;
				else
					DM->FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->AsInteger=0;
				}
			catch(...){	DM->FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->AsInteger=0;}

			try{
				DM->FIBStoredProc_ORDER_START->ExecProc();
				DM->FIBTransactionUpdate->Commit();
				}
			catch(...){
				DM->FIBTransactionUpdate->Rollback();
				MessageDlg("�� ����������� � ������ �������!", mtError, TMsgDlgButtons() << mbOK, 0);
				}
			ButtonStartOrder->Caption="";
			EditTheme->Text="";
			ShapeLighting->Visible=false;
			CurrentThemeLabel=NULL;
			if(!CheckBoxMultiOrder->Checked){
				ButtonClearClick(Sender);
//				EditDestination->Text="";
//				EditDeparture->Text="";
//				EditPHONE->Text="";
//				EditDiskont->Text="";
//				EditDiskont->Tag=0;
//				EditDiskont->Tag=0;
//				DBLookupComboboxEhOrdType->KeyValue=1;
				}
			DM->FIBDataSet_ORD_DELAY->Open();
			}
	EditDeparture->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ButtonClearClick(TObject *Sender)
{
	CurrentThemeLabel=NULL;
	EditDestination->Text="";
	EditDeparture->Text="";
	EditPHONE->Text="";
	EditDiskont->Text="";
	EditDiskont->Tag=0;
	EditDiskont->Color=clWindow;
	EditDiskont->ReadOnly=false;
	ButtonStartOrder->Caption="";
	EditTheme->Text="";
	ShapeLighting->Visible=false;
	DBLookupComboboxEhOrdType->KeyValue=1;
	CheckBoxMultiOrder->Checked=false;
	ListBoxInfo->Items->Clear();
	EditDeparture->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DateTimePickerChange(TObject *Sender)
{
MaskEditTime->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::PopupMenuLocTypeOnLinePopup(TObject *Sender)
{
	switch(CurrentThemeLabel->LocType){

		case 1:// �� �����
			//miOutAuto->Visible=true;
			miPause->Visible=true;
			miClients->Visible=true;
			miWithSave->Visible=true;
			//miPrior->Visible=true;
			miUnMark->Visible=true;
			miPromove->Visible=true;
			miSort->Visible=true;

			miMark->Visible=true;
			miOrderEdit->Visible= false;
			break;

		case 3: // �� ������
			miOrderEdit->Visible=true;
			miUnMark->Visible=true;

			miPromove->Visible=false;
			miMark->Visible=false;

			miPromove->Visible=false;
			//miOutAuto->Visible=false;
			miPause->Visible=false;
			miWithSave->Visible=false;
			//miPrior->Visible=false;
			miSort->Visible=false;
			miClients->Visible=false;

//miRollback->Visible= true;
			break;

		case 5: //�� ������ � �����������
		case 7: // �� ������
			miOrderEdit->Visible=true;
			//miOutAuto->Visible=true;
			miPause->Visible=true;
			miUnMark->Visible=true;
			miMark->Visible=true;
			//miPrior->Visible=true;

			miPromove->Visible=false;
			miSort->Visible=false; // ����������
			miClients->Visible=false;
			miWithSave->Visible=false;
			break;

		case 9: //�������
		case 11: //����
			miClients->Visible=true;

			miOrderEdit->Visible=false;
			miWithSave->Visible=false;
			//miOutAuto->Visible=false;
			miPause->Visible=false;
			miPromove->Visible=false;
			//miPrior->Visible=false; // ��������������
			miSort->Visible=false; // ����������
			miUnMark->Visible=false;
			miMark->Visible=false;
			break;

		case 13: //������������
			miClients->Visible=true;
			miWithSave->Visible=true;
			//miOutAuto->Visible=true;
			miPause->Visible=true;
			miUnMark->Visible=true;
			//miPrior->Visible=true; // ��������������

			miPromove->Visible=false;
			miMark->Visible=true;
			miOrderEdit->Visible=false;  //�������� �����
			break;

		default: // ��������� - ����� ��� ��������
			miMark->Visible=true;
			//miOutAuto->Visible=true;
			miPause->Visible=true;
			miClients->Visible=true;
			miWithSave->Visible=true;
			//miPrior->Visible=true;
			miUnMark->Visible=true;
			miNoResponse->Visible=true;
			break;
		};
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ThemeLabelMouseMove(TObject *Sender,
		TShiftState Shift, int X, int Y)
{
	Application->ActivateHint(Mouse->CursorPos);
	if(Shift.Contains(ssLeft)){
		CurrentThemeLabel=(TThemeLabel*)Sender;
		//!TimerLocRefresh->Enabled = false;
		((TControl*)Sender)->BeginDrag(true, 0);
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ScrollBoxDragOver(TObject *Sender,
	  TObject *Source, int X, int Y, TDragState State, bool &Accept)
{
	Accept = Source->ClassNameIs("TThemeLabel");
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ScrollBoxStaticDragDrop(TObject *Sender,
		TObject *Source, int X, int Y)
{
	if (Sender->ClassNameIs("TScrollBox") && Source->ClassNameIs("TThemeLabel")){
		ReLocType(Sender);
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ScrollBoxLocationDragDrop(TObject *Sender,
		TObject *Source, int X, int Y)
{
	if (Sender->ClassNameIs("TImage") && Source->ClassNameIs("TThemeLabel"))
		ReLocation( ((TImage*)Sender)->Parent);
	if (Sender->ClassNameIs("TScrollBox") && Source->ClassNameIs("TThemeLabel"))
		ReLocation(Sender);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ThemeLabelClick(TObject *Sender)
{
	CurrentThemeLabel=(TThemeLabel*)Sender;
	//LabelReadyOrder->Caption=IntToStr(CurrentThemeLabel->Theme);
	ButtonStartOrder->Caption=IntToStr(CurrentThemeLabel->Theme);
	EditTheme->Text=ButtonStartOrder->Caption;
	ShapeLighting->Visible=true;
	switch(CurrentThemeLabel->Ressort){ 
		case 1: ButtonStartOrder->Hint="������ ��������������";break;
		case 2: ButtonStartOrder->Hint="��������������";break;
		case 3: ButtonStartOrder->Hint="��������� ��������������";break;
		case 4: ButtonStartOrder->Hint="������ ";break;
		case 5: ButtonStartOrder->Hint="�������";break;
		case 6: ButtonStartOrder->Hint="��������� ";break;
		case 7: ButtonStartOrder->Hint="������ ���������";break;
		case 8: ButtonStartOrder->Hint="���������";break;
		case 9: ButtonStartOrder->Hint="������ ���������";break;				
		default: ButtonStartOrder->Hint="";break;
		};
//Memo1->Lines->Clear();
//Memo1->Lines->Add(IntToStr(CurrentThemeLabel->Location));
//Memo1->Lines->Add(IntToStr(CurrentThemeLabel->PrevLocation));	
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::miRollbackClick(TObject *Sender)
{
	if (CurrentThemeLabel!=NULL){
		if (CurrentThemeLabel->PrevLocations){
			if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
			DM->FIBStoredProc_LOCATION_ROLLBACK->ParamByName("VI_UNIQL")->AsInteger=CurrentThemeLabel->Locations;
			DM->FIBStoredProc_LOCATION_ROLLBACK->ParamByName("VI_SMENA")->AsInteger=CurrentSmena;
			try{
				DM->FIBStoredProc_LOCATION_ROLLBACK->ExecProc();
				DM->FIBTransactionUpdate->Commit();
				}
			catch(...){
				DM->FIBTransactionUpdate->Rollback();
				MessageDlg("������ �� �������!", mtError, TMsgDlgButtons() << mbOK, 0);
				}
			CurrentThemeLabel=NULL;
			ButtonStartOrder->Caption="";//LabelReadyOrder->Caption="0";
			EditTheme->Text="";
			ShapeLighting->Visible=false;
			}
		else{
			MessageDlg("��� ������� ������ ������ �� ��������!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::OrderEdit(TObject *Sender)
{
	CurrentThemeLabel=NULL;
	if (DM->FIBDataSet_ORD_ONLINE->RecordCount>0){
		FormOrder->UniqO=(int)DM->FIBDataSet_ORD_ONLINE->FieldValues["UNIQO"];
		for(int m=0;m<ThemeCount;m++){
			if (ThemeLabel[m]->Theme == (int)DM->FIBDataSet_ORD_ONLINE->FieldValues["KEY_THEME"]){
				CurrentThemeLabel=ThemeLabel[m];
				break;
				}
			}
		DM->FIBDataSet_ORD_ONLINE->Close();
		FormOrder->ShowModal();
		DM->FIBDataSet_ORD_ONLINE->Open();
		}             	
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::miOrderEditClick(TObject *Sender)
{
	if (DM->FIBDataSet_ORD_ONLINE->RecordCount>0){	
		Set<TLocateOption,0,1> flags;
		if(DM->FIBDataSet_ORD_ONLINE->Locate("KEY_THEME", Variant(CurrentThemeLabel->Theme), flags)){
			FormOrder->UniqO=(int)DM->FIBDataSet_ORD_ONLINE->FieldValues["UNIQO"];
			DM->FIBDataSet_ORD_ONLINE->Close();			
			FormOrder->ShowModal();
			DM->FIBDataSet_ORD_ONLINE->Open();
			}
		else ShowMessage("�� ������ �������� � �������!");
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormDeactivate(TObject *Sender)
{
	TimerCheck->Enabled=false;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::TimerCheckTimer(TObject *Sender)
{
	TimerOrdRezervFlash->Enabled=false;
	TimerCheck->Enabled=false;
	DBGridEh_ORD_RESERV->FixedColor=clBtnFace;
	TDateTime testDateTime;
	if(MainHost){
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBStoredProcLocationCheck->ParamByName("VI_TIMEOUT_7")->AsDateTime=TDateTime((double)Now()-0.041667);//��� ����� �����  1��� =
		DM->FIBStoredProcLocationCheck->ParamByName("VI_TIMEOUT_9")->AsDateTime=TDateTime((double)Now()-0.013889);//��� ����� ����� 20 �����  0,013888888888888888888888888888889
		DM->FIBStoredProcLocationCheck->ParamByName("VI_TIMEOUT_11")->AsDateTime=TDateTime((double)Now()-0.048611);//��� ����� �����  70min = 0,048611111111111111111111111111111 0,027777777777777777777777777777778
		try{
			DM->FIBStoredProcLocationCheck->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("������ ��� �������� LOC_TYPE!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		}
	DM->FIBDataSet_ORD_REZERV_CHECK->CloseOpen(true);
	DM->FIBDataSet_ORD_REZERV_CHECK->First();
	while (!DM->FIBDataSet_ORD_REZERV_CHECK->Eof){
		testDateTime=DM->FIBDataSet_ORD_REZERV_CHECK->FieldByName("TIME_START")->AsDateTime;
		if(TDateTime((double)testDateTime-0.007) < Now()){   // �� 10 ����� ����� �������
			TimerOrdRezervFlash->Enabled=true;
			break;
			}
		DM->FIBDataSet_ORD_REZERV_CHECK->Next();
		}
	DM->FIBDataSet_ORD_REZERV_CHECK->Close();

	// ������������ ��������� ������� ����� �� ������� ��������� ��������� � ������ �����, ����� �to-t� �������� ����������� ����
	DM->FIBStoredProcSmenaCheck->ParamByName("VI_UNIQS")->AsInteger=CurrentSmena;
	DM->FIBStoredProcSmenaCheck->ExecProc();

	switch(DM->FIBStoredProcSmenaCheck->ParamByName("VO_SMN_STATE")->AsShort){
		case 0:
			if(DM->FIBStoredProcSmenaCheck->ParamByName("VO_SMN_WEEKEND")->AsShort==0){
				StaticTextWeekEnd->Tag=0;
				StaticTextWeekEnd->Color=clBtnFace;
				StaticTextWeekEnd->Font->Color=clBlack;
				}
			else{
				StaticTextWeekEnd->Tag=1;
				StaticTextWeekEnd->Color=clRed;
				StaticTextWeekEnd->Font->Color=clWhite;
				}
			if(DM->FIBStoredProcSmenaCheck->ParamByName("VO_SMN_ACTION")->AsShort==0){
				StaticTextAction->Tag=0;
				StaticTextAction->Color=clBtnFace;
				StaticTextAction->Font->Color=clBlack;
				}
			else{
				StaticTextAction->Tag=1;
				StaticTextAction->Color=clRed;
				StaticTextAction->Font->Color=clWhite;
				}
			break;
		case 1:
			MessageDlg("���� ����� �������!\n����� �� ���������..", mtError, TMsgDlgButtons() << mbOK, 0);
			Close();
			break;
		case 2:
			MessageDlg("��������� ���������� ���������� �����!", mtError, TMsgDlgButtons() << mbOK, 0);
			break;
		case 3:
			MessageDlg("��������� ������������� ��������!", mtError, TMsgDlgButtons() << mbOK, 0);
			break;
		default:
			MessageDlg("����������� ��������� �����.", mtError, TMsgDlgButtons() << mbOK, 0);
			break;
		};

   ListBoxSmenaRepNo->Items->Clear();
   DM->FIBStoredProcSmenaRepNo->ParamByName("VI_UNIQS")->AsInteger=CurrentSmena;
	ListBoxSmenaRepNo->Items->Add("C���� "+IntToStr(CurrentSmena));
   DM->FIBStoredProcSmenaRepNo->ExecProc();
   ListBoxSmenaRepNo->Items->Add("����� "+IntToStr(DM->FIBStoredProcSmenaRepNo->ParamByName("VO_ORDERS")->AsInteger));
   ListBoxSmenaRepNo->Items->Add("����� "+IntToStr(DM->FIBStoredProcSmenaRepNo->ParamByName("VO_HOURS")->AsInteger));
	ListBoxSmenaRepNo->Items->Add("����� "+FloatToStr(DM->FIBStoredProcSmenaRepNo->ParamByName("VO_ORD_COST")->AsFloat));

	TimerCheck->Enabled=true;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::EditDepartureKeyUp(TObject *Sender, WORD &Key,
	  TShiftState Shift)
{
	if(Key == VK_RETURN)
		ButtonDelayClick(ButtonDelay);
	else if(Key==VK_ESCAPE)
		ButtonClearClick(this);
	else if(Key == VK_INSERT )
		EditDiskontChange(this);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::MaskEditTimeKeyUp(TObject *Sender, WORD &Key,
		TShiftState Shift)
{
	if(Key == VK_RETURN)
		ButtonDelayClick(ButtonReserv);
	else if(Key==VK_ESCAPE) 
		ButtonClearClick(this);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::miClientsClick(TObject *Sender)
{
	EditDiskont->Text=((TMenuItem *)Sender)->Tag;
	EditDiskont->Tag=((TMenuItem *)Sender)->Tag;
	EditDiskontChange(this);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ButtonThemeClick(TObject *Sender)
{
	int n,KeyTheme,tmp;
	KeyTheme=StrToInt(EditTheme->Text);
	for(n=0;n<ThemeCount;n++){
		if (ThemeLabel[n]->Theme == KeyTheme){
			tmp=ThemeLabel[n]->Color;
			ThemeLabel[n]->Color=clRed; Refresh(); Sleep(333);
			ThemeLabel[n]->Color=clWhite; Refresh(); Sleep(222);
			ThemeLabel[n]->Color=clRed; Refresh(); Sleep(333);
			ThemeLabel[n]->Color=clWhite; Refresh(); Sleep(222);
			ThemeLabel[n]->Color=clRed; Refresh(); Sleep(333);
			ThemeLabel[n]->Color=(TColor)tmp;
			KeyTheme=0;
			break;
			}
		}
	if(KeyTheme!=0){
		ShowMessage("�������� �� ������...");
      EditTheme->Text="";
      }
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::EditThemeKeyUp(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
	if(Key == VK_RETURN)
		ButtonThemeClick(this);
	else if(Key==VK_ESCAPE) 
		ButtonClearClick(this);	
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DBGridEh_ORD_ONLINEEnter(TObject *Sender)
{
	OrdRefreshOnline=false;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DBGridEh_ORD_ONLINEExit(TObject *Sender)
{
	OrdRefreshOnline=true;
	DM->FIBDataSet_ORD_ONLINE->CloseOpen(true);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DBGridEh_ORD_DELAYEnter(TObject *Sender)
{
  	OrdRefreshDelay=false;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DBGridEh_ORD_DELAYExit(TObject *Sender)
{
	OrdRefreshDelay=true;
	DM->FIBDataSet_ORD_DELAY->CloseOpen(true);
	
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DBGridEh_ORD_RESERVEnter(TObject *Sender)
{
	OrdRefreshRezerv=false;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DBGridEh_ORD_RESERVExit(TObject *Sender)
{
	OrdRefreshRezerv=true;
	DM->FIBDataSet_ORD_RESERV->CloseOpen(true);	
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DateTimePickerKeyUp(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
	if(Key == VK_RETURN)
		MaskEditTime->SetFocus();
	else if(Key==VK_ESCAPE)
		ButtonClearClick(this);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ButtonClientsClick(TObject *Sender)
{
	FormClients->ButtonZakaz->Enabled=true;
	FormClients->ButtonDelay->Enabled=true;
	FormClients->ShowModal();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::EditDiskontChange(TObject *Sender)
{
	if (EditDiskont->Text.Length()>3){
		AnsiString tmpstring;
		if( DM->FIBDataSetClientDiscont->Active ) DM->FIBDataSetClientDiscont->Close();
		DM->FIBDataSetClientDiscont->ParamByName("NAME")->AsString=EditDiskont->Text;
		DM->FIBDataSetClientDiscont->Open();
		if(DM->FIBDataSetClientDiscont->RecordCount==1){
			double n,m,l,k;
			if (EditDestination->Text.Length()>0) tmpstring = EditDestination->Text + " [";
			else tmpstring = "[";
			if(DM->FIBDataSetClientDiscont->FieldValues["CLT_NAME"].Type() == varString)
				tmpstring += DM->FIBDataSetClientDiscont->FieldValues["CLT_NAME"];
			if(DM->FIBDataSetClientDiscont->FieldValues["CLT_INFO"].Type() == varString)
				tmpstring += " " + DM->FIBDataSetClientDiscont->FieldValues["CLT_INFO"];
			if(DM->FIBDataSetClientDiscont->FieldValues["CLT_ADRESS"].Type() == varString)
				tmpstring += " " + DM->FIBDataSetClientDiscont->FieldValues["CLT_ADRESS"];
			EditDestination->Text=tmpstring+"]";

			if(DM->FIBDataSetClientDiscont->FieldValues["UNIQC"].Type() == varInteger){
				EditDiskont->Text = DM->FIBDataSetClientDiscont->FieldValues["UNIQC"];
				EditDiskont->Tag = DM->FIBDataSetClientDiscont->FieldValues["UNIQC"];
				}

			if (EditPHONE->Text.Length()>0) tmpstring = EditPHONE->Text + " ";
			else tmpstring = "";
			if(DM->FIBDataSetClientDiscont->FieldValues["CLT_PHONE"].Type() == varString)
				EditPHONE->Text = tmpstring + DM->FIBDataSetClientDiscont->FieldValues["CLT_PHONE"];


			if(DM->FIBDataSetClientDiscont->FieldValues["CLT_COUNTER"].Type() == varInteger)
				n = DM->FIBDataSetClientDiscont->FieldValues["CLT_COUNTER"];
			else n=0;
			if(DM->FIBDataSetClientDiscont->FieldValues["CLT_DISCOUNT"].Type() == varInteger)
				k = DM->FIBDataSetClientDiscont->FieldValues["CLT_DISCOUNT"];
			else k=0;



			ListBoxInfo->Items->Clear();
			if(DM->FIBDataSetCliensOrders->Active)DM->FIBDataSetCliensOrders->Close();
			DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Clear();
			DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Add("Select count(uniqo) count_orders from orders, s_ord_type");
			DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Add("where key_ord_type=cod_ord_type and key_client="+EditDiskont->Text);
			DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Add("and ord_state = 1 and ord_type in (1,3)");
			DM->FIBDataSetCliensOrders->Open();
			m=DM->FIBDataSetCliensOrders->FieldValues["count_orders"];
			if(DM->FIBDataSetCliensOrders->Active)DM->FIBDataSetCliensOrders->Close();
			DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Clear();
			DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Add("Select count(uniqo) count_orders from orders");
			DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Add("where key_ord_type=20 and key_client="+EditDiskont->Text);
			DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Add("and ord_state = 1 ");
			DM->FIBDataSetCliensOrders->Open();
			l=DM->FIBDataSetCliensOrders->FieldValues["count_orders"];
			ListBoxInfo->Items->Add("�������: "+IntToStr((int)m)+" / "+IntToStr((int)l));
			if (n>0){
				if ((m/(n-1)-l+k)>0)
					ListBoxInfo->Items->Add("���������: "+IntToStr((int)(m/(n-1)-l+k)));
				else
					ListBoxInfo->Items->Add("���������� ���");
				}
			else{
				if ((k-l)>0)
					ListBoxInfo->Items->Add("��������: "+IntToStr((int)(k-l)));
				else
					ListBoxInfo->Items->Add("������ ���");
				}
	// ������ ���������, ���� ������ ��� = 2, ������ ��� ����������
			if(DM->FIBDataSetClientDiscont->FieldValues["CLT_TYPE"].Type() == varInteger)
				if(DM->FIBDataSetClientDiscont->FieldValues["CLT_TYPE"] == 3){
					DBLookupComboboxEhOrdType->KeyValue = 2;
					}


			if(DM->FIBDataSetCliensOrders->Active)DM->FIBDataSetCliensOrders->Close();
			EditDiskont->Color=clLime;
			EditDiskont->ReadOnly=true;
			}
		else{
			EditDiskont->Text = "";
			EditDiskont->Tag = 0;
			EditPHONE->Text = "";
			EditDiskont->Color=clWindow;
			EditDiskont->ReadOnly=false;
			}
		DM->FIBDataSetClientDiscont->Close();
		}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DBGridEh_ORD_ONLINEKeyUp(TObject *Sender,
		WORD &Key, TShiftState Shift)
{
	if (Key==VK_RETURN) OrderEdit(this);
	if(Key==VK_ESCAPE) ButtonClearClick(this);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::miFalseOrderClick(TObject *Sender)
{
	NewLocations=0;
	DummyThemeLabel->Tag=CurrentLocation;
	DummyThemeLabel->Type=0;
	DummyThemeLabel->Freq=0;
	DummyThemeLabel->Theme=0;
	DummyThemeLabel->LocType=0;
	DummyThemeLabel->PrevLocType=0;
	DummyThemeLabel->Ressort=0;
	DummyThemeLabel->Location=0;
	DummyThemeLabel->PrevLocation=0;
	DummyThemeLabel->Locations=0;
	DummyThemeLabel->PrevLocations=0;
	CurrentThemeLabel=DummyThemeLabel;
	ReLocation(Sender);
	if (NewLocations){//���� �������� �� ������� ������ �� �������
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_THEME")->AsShort=0;
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_LOCATIONS")->AsInteger=NewLocations;
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_TYPE")->AsShort=DBLookupComboboxEhOrdType->KeyValue;
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_SMN_START")->AsInteger=CurrentSmena;
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_DEPARTURE")->AsString=EditDeparture->Text;
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_DESTINATION")->AsString=EditDestination->Text;
		if (EditPHONE->Text.Length()>16) DM->FIBStoredProc_ORDER_START->ParamByName("VI_PHONE")->AsString=EditPHONE->Text.SubString(1,60);
		else DM->FIBStoredProc_ORDER_START->ParamByName("VI_PHONE")->AsString=EditPHONE->Text;
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_STATE")->AsShort=2;// ��������� �����. ����� ���������� ��� �������������
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_COST")->Clear();
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_TIME_START")->Clear();
		try{
			if(StrToInt(EditDiskont->Text) == EditDiskont->Tag)
				DM->FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->AsInteger=EditDiskont->Tag;
			else
				DM->FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->AsInteger=0;
			}
		catch(...){
			DM->FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->AsInteger=0;}
		try{
			DM->FIBStoredProc_ORDER_START->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			if(!CheckBoxMultiOrder->Checked && ((TComponent *)Sender)->Tag!=7){
				EditDestination->Text="";
				EditDeparture->Text="";
				EditPHONE->Text="";
				DBLookupComboboxEhOrdType->KeyValue=1;
				EditDiskont->Text="";
				EditDiskont->Tag=0;
				ListBoxInfo->Items->Clear();
				}
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("�� ����������� �����!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		}
	else{
		MessageDlg("����� �� �����!", mtError, TMsgDlgButtons() << mbOK, 0);
		}
	CurrentThemeLabel=NULL;
	ButtonStartOrder->Caption="";//LabelReadyOrder->Caption="0";
	EditTheme->Text="";
	ShapeLighting->Visible=false;
	EditDeparture->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ScrollBoxLocationMouseDown(TObject *Sender,
	  TMouseButton Button, TShiftState Shift, int X, int Y)
{
	CurrentLocation=((TControl *)Sender)->Tag;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::LocRefresh(TObject *Sender)
{
	int l,m,n,KeyTheme,tmp;
	AnsiString tmpstr;
	bool ThemeVisible;
	short Ressort;
// � ������ - ����� ��������� - ����������� ����� (...� ���� ����� - ������� ������������)
	if(!DM->FIBDataSet_V_LOCATIONS->Active) DM->FIBDataSet_V_LOCATIONS->Open();
	LocationsCount = DM->FIBDataSet_V_LOCATIONS->RecordCount;

	for (n=0;n<LocationCount;n++){
		GroupBoxLocation[n]->Tag=0;
		ImageLocation[n]->Height=0;
		ImageLocation[n]->Picture->Bitmap->Height=0;
		}//��������� ���������� ����� �� bcex ������Rx
	GroupBoxPark->Tag=0;
	GroupBoxDolg->Tag=0;
	GroupBoxShtraf->Tag=0;
	GroupBoxRemont->Tag=0;
	GroupBoxArenda->Tag=0;
	GroupBoxOtpusk->Tag=0;
	GroupBoxZakazOnline->Tag=0;// �����, ������ �� ������




	if (LocationsCount){// ���� �� ���� ������� ����
		DM->FIBDataSet_V_LOCATIONS->First();
		while (!DM->FIBDataSet_V_LOCATIONS->Eof){
			KeyTheme=DM->FIBDataSet_V_LOCATIONS->FieldValues["KEY_THEME"];
			for(m=0;m<ThemeCount;m++){


				if (ThemeLabel[m]->Theme == KeyTheme && DM->FIBDataSet_V_LOCATIONS->FieldValues["LOC_STATE"]==0){
					ThemeLabel[m]->LocType=DM->FIBDataSet_V_LOCATIONS->FieldValues["KEY_LOC_TYPE"];
					ThemeLabel[m]->Locations=DM->FIBDataSet_V_LOCATIONS->FieldValues["UNIQL"];
					ThemeLabel[m]->Location=DM->FIBDataSet_V_LOCATIONS->FieldValues["KEY_LOCATION"];
					ThemeLabel[m]->Ressort=DM->FIBDataSet_V_LOCATIONS->FieldValues["THM_RESSORT"];
					ThemeLabel[m]->PrevLocations=DM->FIBDataSet_V_LOCATIONS->FieldValues["PREV_LOCATIONS"];
					ThemeLabel[m]->Caption=DM->FIBDataSet_V_LOCATIONS->FieldValues["THEME_LABEL"];
					ThemeLabel[m]->TimeStart=TDateTime(DM->FIBDataSet_V_LOCATIONS->FieldValues["TIME_START"]);

					tmp=ThemeLabel[m]->Hint.Pos("TIME:")+4;
					tmpstr=ThemeLabel[m]->Hint.SubString(1,tmp);
					ThemeLabel[m]->Hint=tmpstr+ThemeLabel[m]->TimeStart.FormatString("yyyy.mm.dd hh:nn:ss") + "\n"+DM->FIBDataSet_V_LOCATIONS->FieldValues["THEME_INFO"];

					ThemeLabel[m]->ThemeVisible=(
								CheckBoxFreq[ThemeLabel[m]->Freq-1]->Checked &&
								(CheckBoxRezerv->Checked ||
									(ThemeLabel[m]->Ressort!=3 &&
									ThemeLabel[m]->Ressort!=6 &&
									ThemeLabel[m]->Ressort!=9)
									)
								);
					//����� �� ������� COLORS ����� ��� ����������� � ������ ��
					if(ThemeLabel[m]->Freq-1 >=0 && ThemeLabel[m]->Freq-1 < 9 && ThemeLabel[m]->LocType >=0 && ThemeLabel[m]->LocType < 16){
						ThemeLabel[m]->Color=(TColor)LabelColors[ThemeLabel[m]->Freq-1][ThemeLabel[m]->LocType];
						ThemeLabel[m]->Font->Color=(TColor)FontColors[ThemeLabel[m]->Freq-1][ThemeLabel[m]->LocType];
						}

					if (ThemeLabel[m]->LocType&0x01){// ���� ������� "������������", ��-���� �� �����
						if(!ThemeLabel[m]->Enabled) ThemeLabel[m]->Enabled=true;// ����������� ��� ������
						ThemeLabel[m]->Visible=ThemeLabel[m]->ThemeVisible;
						ThemeLabel[m]->PopupMenu=PopupMenuLocTypeOnLine;

						if (ThemeLabel[m]->Ressort==1 || ThemeLabel[m]->Ressort==4 || ThemeLabel[m]->Ressort==7)
							ThemeLabel[m]->Font->Color=(TColor)(0x00FFFFFF ^ ThemeLabel[m]->Color);  //�������� � ����!
						else if (ThemeLabel[m]->Ressort==3 || ThemeLabel[m]->Ressort==6 || ThemeLabel[m]->Ressort==9)
							ThemeLabel[m]->Font->Color=(TColor)(0x007F7F7F & ThemeLabel[m]->Color);		//����� � �������
						}
					else{ // "�����������" ���������:
						ThemeLabel[m]->Visible=true;
						ThemeLabel[m]->PopupMenu=PopupMenuOffLine;
						}

					switch(ThemeLabel[m]->LocType){
						case 1://�� ����� � �������
						case 5://�� ������ � ����������� !!!
						case 7://�� ������
						case 9://�������
						case 11://�������
						case 13://������������
							for (l=0;l<LocationCount && ThemeLabel[m]->ThemeVisible;l++){
								if(ScrollBoxLocation[l]->Tag==ThemeLabel[m]->Location){
									ThemeLabel[m]->Parent=ScrollBoxLocation[l];
									tmp=ScrollBoxLocation[l]->Width-ScrollBoxLocation[l]->Width%(THMLABELWIDTH+3);
									ThemeLabel[m]->Left=5 + ((THMLABELWIDTH+3)*GroupBoxLocation[l]->Tag)%tmp - ScrollBoxLocation[l]->HorzScrollBar->Position;
									ThemeLabel[m]->Top= (THMLABELHEIGHT+3)*((THMLABELWIDTH+3)*GroupBoxLocation[l]->Tag/tmp) - ScrollBoxLocation[l]->VertScrollBar->Position;
									GroupBoxLocation[l]->Tag++;
// ���-�� ��� ����� ������ ����������� ������������ ���������� �������...
//										ImageLocation[l]->Height=ScrollBoxLocation[l]->VertScrollBar->Range;
//										ImageLocation[l]->Picture->Bitmap->Height=ScrollBoxLocation[l]->VertScrollBar->Range;
									break;
									}
								}
							break;

						case 3://�� ������
							ThemeLabel[m]->Parent=ScrollBoxZakazOnLine;
							GroupBoxZakazOnline->Tag++;
							if (ThemeLabel[m]->Ressort==1 || ThemeLabel[m]->Ressort==4 || ThemeLabel[m]->Ressort==7)
								ThemeLabel[m]->Font->Color=clFuchsia;  //�������� � ����!
							else if (ThemeLabel[m]->Ressort==3 || ThemeLabel[m]->Ressort==6 || ThemeLabel[m]->Ressort==9)
								ThemeLabel[m]->Font->Color=clGray;		//����� � �������
							break;

						default: // �� ��������� !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
						case 0://� ������
							ThemeLabel[m]->Parent=ScrollBoxPark;
							//ThemeLabel[m]->Left= (THMLABELWIDTH+3)*(KeyTheme/10)-ScrollBoxPark->HorzScrollBar->Position;
							//ThemeLabel[m]->Top= (THMLABELHEIGHT+3)*(KeyTheme%10)-ScrollBoxPark->VertScrollBar->Position;

							GroupBoxPark->Tag++;
							if(!ThemeLabel[m]->Enabled)ThemeLabel[m]->Enabled=true;
							break;
						case 2://������
							ThemeLabel[m]->Parent=ScrollBoxRemont;
							GroupBoxRemont->Tag++;
							if(!ThemeLabel[m]->Enabled)ThemeLabel[m]->Enabled=true;
							break;
						case 4://� �����
							ThemeLabel[m]->Parent=ScrollBoxDolg;
							GroupBoxDolg->Tag++;
							if(ThemeLabel[m]->Enabled)ThemeLabel[m]->Enabled=true;
							break;
						case 6://����� 38
							ThemeLabel[m]->Parent=ScrollBoxShtraf;
							GroupBoxShtraf->Tag++;
							if(ThemeLabel[m]->Enabled)ThemeLabel[m]->Enabled=true;
							break;
						case 8://������
							ThemeLabel[m]->Parent=ScrollBoxArenda;
							GroupBoxArenda->Tag++;
							if(ThemeLabel[m]->Enabled)ThemeLabel[m]->Enabled=true;
							break;
						case 10://������
							ThemeLabel[m]->Parent=ScrollBoxOtpusk;
							GroupBoxOtpusk->Tag++;
							if(ThemeLabel[m]->Enabled)ThemeLabel[m]->Enabled=true;
							break;
						};

					break;// ����� �����, ������� � ��� ��� ������ � ����
					}
				else if (ThemeLabel[m]->Theme == KeyTheme && DM->FIBDataSet_V_LOCATIONS->FieldValues["LOC_STATE"]==4){ // draw chost

					tmp=DM->FIBDataSet_V_LOCATIONS->FieldValues["KEY_LOCATION"];
					Ressort=DM->FIBDataSet_V_LOCATIONS->FieldValues["THM_RESSORT"];
//					DummyThemeLabel->PrevLocations=DM->FIBDataSet_V_LOCATIONS->FieldValues["PREV_LOCATIONS"];
					tmpstr=DM->FIBDataSet_V_LOCATIONS->FieldValues["THEME_LABEL"];
//					DummyThemeLabel->TimeStart=TDateTime(DM->FIBDataSet_V_LOCATIONS->FieldValues["TIME_START"]);
//
					ThemeVisible=(CheckBoxFreq[ThemeLabel[m]->Freq-1]->Checked && (CheckBoxRezerv->Checked || (Ressort!=3 && Ressort!=6 && Ressort!=9)));

					for (l=0;l<LocationCount && ThemeVisible;l++){
						if(ScrollBoxLocation[l]->Tag==tmp){
							tmp=ScrollBoxLocation[l]->Width-ScrollBoxLocation[l]->Width%(THMLABELWIDTH+3);
							if(ScrollBoxLocation[l]->VertScrollBar->Range < THMLABELHEIGHT+(THMLABELHEIGHT+3)*((THMLABELWIDTH+3)*GroupBoxLocation[l]->Tag/tmp)){
								ImageLocation[l]->Height=ScrollBoxLocation[l]->VertScrollBar->Range+THMLABELHEIGHT+3;
								ImageLocation[l]->Picture->Bitmap->Height=ScrollBoxLocation[l]->VertScrollBar->Range+THMLABELHEIGHT+3;
								}
							else{
								ImageLocation[l]->Height=ScrollBoxLocation[l]->VertScrollBar->Range;
								ImageLocation[l]->Picture->Bitmap->Height=ScrollBoxLocation[l]->VertScrollBar->Range;
								}

//ImageLocation[l]->Canvas->Font
							ImageLocation[l]->Canvas->TextOut(
								5 + ((THMLABELWIDTH+3)*GroupBoxLocation[l]->Tag)%tmp +(THMLABELWIDTH-ImageLocation[l]->Canvas->TextWidth(tmpstr))/2,// - ScrollBoxLocation[l]->HorzScrollBar->Position,
								(THMLABELHEIGHT+3)*((THMLABELWIDTH+3)*GroupBoxLocation[l]->Tag/tmp+(THMLABELHEIGHT-ImageLocation[l]->Canvas->TextHeight(tmpstr))/2),// - ScrollBoxLocation[l]->VertScrollBar->Position,
								tmpstr
								);
							GroupBoxLocation[l]->Tag++;
							break;
							}
						}
                    break;
					}
				}
			DM->FIBDataSet_V_LOCATIONS->Next();
			}
		}
	DM->FIBDataSet_V_LOCATIONS->Close();

	// �������������� �����

	tmpThemeLabelsIndex = new int[ThemeCount];
	TGroupBox *tmpGroupBox[7];
	tmpGroupBox[0]=GroupBoxZakazOnline;
	tmpGroupBox[1]=GroupBoxDolg;
	tmpGroupBox[2]=GroupBoxRemont;
	tmpGroupBox[3]=GroupBoxArenda;
	tmpGroupBox[4]=GroupBoxShtraf;
	tmpGroupBox[5]=GroupBoxOtpusk;
	tmpGroupBox[6]=GroupBoxPark;

	TScrollBox *tmpScrollBox[7];
	tmpScrollBox[0]=ScrollBoxZakazOnLine;
	tmpScrollBox[1]=ScrollBoxDolg;
	tmpScrollBox[2]=ScrollBoxRemont;
	tmpScrollBox[3]=ScrollBoxArenda;
	tmpScrollBox[4]=ScrollBoxShtraf;
	tmpScrollBox[5]=ScrollBoxOtpusk;
	tmpScrollBox[6]=ScrollBoxPark;
//
	int tmpCount;//[5]={GroupBoxZakazOnline->Tag,GroupBoxDolg->Tag,GroupBoxRemont->Tag,GroupBoxArenda->Tag,GroupBoxShtraf->Tag};


	for(m=0;m<7;m++){
		for(n=0; n<ThemeCount; n++){ tmpThemeLabelsIndex[n]=0; } //������� - ���������
		tmpCount=tmpGroupBox[m]->Tag;

        n=0;

		for(l=0; n<ThemeCount && l<ThemeCount ;l++){ // �������� ������ �� �������, ��� �������� ��� ��������� � ������ �������
//ThemeLabel[l]->Caption=ThemeLabel[l]->LocType;
			if (ThemeLabel[l]->LocType == tmpScrollBox[m]->Tag && ThemeLabel[l]->Locations>0){
				tmpThemeLabelsIndex[n]=l;
//ThemeLabel[l]->Color=m*32;
				n++;
				}
			}
//tmpCount=n;

		bool SortAgain;   // ���������� ��������� ������� ������������
		do{
			SortAgain=false;
			for(n=0;n<tmpCount-1;n++)
				if (ThemeLabel[tmpThemeLabelsIndex[n]]->Theme > ThemeLabel[tmpThemeLabelsIndex[n+1]]->Theme){
					tmp=tmpThemeLabelsIndex[n+1];
					tmpThemeLabelsIndex[n+1]=tmpThemeLabelsIndex[n];
					tmpThemeLabelsIndex[n]=tmp;
					SortAgain=true;
					}
			}while(SortAgain);

		tmp=tmpScrollBox[m]->Width-tmpScrollBox[m]->Width%(THMLABELWIDTH+3);
		//l=0;

//tmpGroupBox[m]->Caption = AnsiString(tmpGroupBox[m]->Tag)+";"
//+AnsiString(tmpScrollBox[m]->Tag)+";"
//+IntToStr(tmp)+";"
//+IntToStr(tmpScrollBox[m]->HorzScrollBar->Position)+";"
//+IntToStr(tmpScrollBox[m]->VertScrollBar->Position)+";"
//;
		for(n=0;n<tmpCount;n++){
			ThemeLabel[tmpThemeLabelsIndex[n]]->Left = 5+((THMLABELWIDTH+3)*n)%tmp - tmpScrollBox[m]->HorzScrollBar->Position;
			ThemeLabel[tmpThemeLabelsIndex[n]]->Top = (THMLABELHEIGHT+3)*((THMLABELWIDTH+3)*n/tmp)- tmpScrollBox[m]->VertScrollBar->Position;
			//ThemeLabel[tmpThemeLabelsIndex[n]]->Visible=true;
			//l++;
			}
		}
	delete [] tmpThemeLabelsIndex;



}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DBGridEh_ORD_DELAYKeyUp(TObject *Sender, WORD &Key,
	  TShiftState Shift)
{
	if(Key==VK_ESCAPE) ButtonClearClick(this);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DBGridEh_ORD_RESERVKeyUp(TObject *Sender, WORD &Key,
	  TShiftState Shift)
{
	if(Key==VK_ESCAPE) ButtonClearClick(this);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::StaticTextActionClick(TObject *Sender)
{
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		if(StaticTextAction->Tag)
			DM->FIBStoredProcSmenaAction->ParamByName("VI_SMN_ACTION")->AsShort=0;
		else
			DM->FIBStoredProcSmenaAction->ParamByName("VI_SMN_ACTION")->AsShort=1;
		DM->FIBStoredProcSmenaAction->ParamByName("VI_UNIQS")->AsInteger=CurrentSmena;
		DM->FIBStoredProcSmenaAction->ExecProc();
		try{
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){ DM->FIBTransactionUpdate->Rollback(); }
		TimerCheckTimer(this);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ButtonPhoneClick(TObject *Sender)
{
	FormClients->EditNAME->Text=EditDeparture->Text;
	FormClients->EditPHONE->Text=EditPHONE->Text;
	FormClients->ButtonZakaz->Enabled=true;
	FormClients->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::MenuItemOnLineClick(TObject *Sender)
{
	int n,KeyTheme;
	KeyTheme=StrToInt(EditTheme->Text);
	for(n=0;n<ThemeCount;n++){
		if (ThemeLabel[n]->Theme == KeyTheme){
			CurrentThemeLabel=ThemeLabel[n];
			ReLocation(Sender);
			EditTheme->Text="";
			return;
			}
		}
	ShowMessage("�������� �� ������...");
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::miMarkClick(TObject *Sender)
{
	if(CurrentThemeLabel!=NULL){
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBStoredProc_LOCATION_MARK->ParamByName("VI_PREV_LOCATIONS")->AsInteger=CurrentThemeLabel->Locations;
		DM->FIBStoredProc_LOCATION_MARK->ParamByName("VI_SMN_START")->AsInteger=CurrentSmena;
		switch(CurrentThemeLabel->Ressort){
			case 1: case 4: case 7: CurrentThemeLabel->Ressort=4; break;
			case 2: case 5: case 8: default: CurrentThemeLabel->Ressort=5; break;
			case 3: case 6: case 9: CurrentThemeLabel->Ressort=6; break;
			};
		DM->FIBStoredProc_LOCATION_MARK->ParamByName("VI_THM_RESSORT")->AsShort=CurrentThemeLabel->Ressort;
		try{
			DM->FIBStoredProc_LOCATION_MARK->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("����� �������� �� ������� :(", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		}
	LocRefresh(this);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::miUnMarkClick(TObject *Sender)
{
	if(CurrentThemeLabel!=NULL){
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBStoredProc_LOCATION_UNMARK->ParamByName("VI_THEME")->AsShort=CurrentThemeLabel->Theme;
		try{
			DM->FIBStoredProc_LOCATION_UNMARK->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("����� �������� �� ������� :(", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		}
	LocRefresh(this);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::miMarkerClick(TObject *Sender)
{
	if(CurrentThemeLabel!=NULL){
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();

		DM->FIBStoredProc_THEME_MARKER->ParamByName("VI_THEME")->AsShort=CurrentThemeLabel->Theme;
		DM->FIBStoredProc_THEME_MARKER->ParamByName("VI_MARKER")->AsString=((TMenuItem *)Sender)->Hint;

		try{
			DM->FIBStoredProc_THEME_MARKER->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("������ �� ����������", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		LocRefresh(this);

		}
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::ThemeLabelMouseLeave(TObject *Sender)
{
	Application->CancelHint();
}
//---------------------------------------------------------------------------



void __fastcall TFormMain::ThemeLabelDragOver(TObject *Sender, TObject *Source, int X, int Y, TDragState State, bool &Accept)
{

	if( Source->ClassNameIs("TThemeLabel") ){
		Accept = CurrentThemeLabel->Location == ((TThemeLabel*)Sender)->Location && CurrentThemeLabel->Locations != ((TThemeLabel*)Sender)->Locations;
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ThemeLabelDragDrop(TObject *Sender, TObject *Source, int X, int Y)
{
	if (Sender->ClassNameIs("TThemeLabel") && Source->ClassNameIs("TThemeLabel")){

		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();

		DM->FIBStoredProc_LOCATION_ROLL->ParamByName("VI_UNIQL_START")->AsInteger=((TThemeLabel*)Sender)->Locations;
		DM->FIBStoredProc_LOCATION_ROLL->ParamByName("VI_UNIQL_STOP")->AsInteger=CurrentThemeLabel->Locations;
		DM->FIBStoredProc_LOCATION_ROLL->ParamByName("VI_KEY_LOCATION")->AsShort=CurrentThemeLabel->Location;

		try{
			DM->FIBStoredProc_LOCATION_ROLL->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("�������� �� ���������� :(", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		}

}
//---------------------------------------------------------------------------

void __fastcall TFormMain::miCustomMarkerClick(TObject *Sender)
{
	if(FormMarker->ShowModal()==mrOk){
		((TMenuItem *)Sender)->Hint=FormMarker->MaskEditMarker->Text;
		miMarkerClick(Sender);
		}
}
//---------------------------------------------------------------------------

