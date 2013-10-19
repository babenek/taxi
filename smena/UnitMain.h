//---------------------------------------------------------------------------

#ifndef UnitMainH
#define UnitMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>

#include <Winsock2.h>

#include <Sockets.hpp>

#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include "DBGridEh.hpp"
#include "FIBDataSet.hpp"
#include "FIBQuery.hpp"
#include "GridsEh.hpp"
#include "pFIBDataSet.hpp"
#include "pFIBQuery.hpp"
#include "pFIBStoredProc.hpp"
#include "VersionInfoComponent.h"
#include <DB.hpp>
//---------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:	// IDE-managed Components
	TpFIBDataSet *FIBDataSet_S_USER;
	TDataSource *DataSource_S_USER;
	TpFIBStoredProc *FIBStoredProcSmenaStart;
	TpFIBStoredProc *FIBStoredProcSmenaStop;
	TGroupBox *GroupBoxSmena;
	TDBGridEh *DBGridEhSmena;
	TMonthCalendar *Calendar;
	TDataSource *DataSourceSmena;
	TpFIBDataSet *FIBDataSetSmena;
	TStaticText *StaticTextDayNight;
	TGroupBox *GroupBoxUsrList;
	TListBox *ListBoxUsers;
	TDBGridEh *DBGridEh_S_USER;
	TFIBIntegerField *FIBDataSetSmenaUNIQS;
	TFIBDateTimeField *FIBDataSetSmenaSMN_TIME_START;
	TFIBDateTimeField *FIBDataSetSmenaSMN_TIME_STOP;
	TFIBSmallIntField *FIBDataSetSmenaSMN_STATE;
	TFIBSmallIntField *FIBDataSetSmenaSMN_WEEKEND;
	TFIBDateField *FIBDataSetSmenaSMN_DATE;
	TFIBSmallIntField *FIBDataSetSmenaSMN_DAY_NIGHT;
	TFIBStringField *FIBDataSetSmenaUSR_LIST;
	TSpeedButton *ButtonSmenaStop;
	TSpeedButton *ButtonSmenaStart;
	TSpeedButton *ButtonClear;
	TSpeedButton *ButtonAdd;
	TSpeedButton *ButtonOK;
	TTcpClient *TcpClient1;
	TTimer *Timer;
	TVersionInfo *VersionInfo;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall SpeedButtonCancelClick(TObject *Sender);
	void __fastcall SpeedButtonOkClick(TObject *Sender);
	void __fastcall ButtonAddClick(TObject *Sender);
	void __fastcall ButtonClearClick(TObject *Sender);
	void __fastcall ButtonSmenaStopClick(TObject *Sender);
	void __fastcall StaticTextDayNightClick(TObject *Sender);
	void __fastcall ButtonSmenaStartClick(TObject *Sender);
	void __fastcall FIBDataSetSmenaAfterOpen(TDataSet *DataSet);
	void __fastcall FIBDataSetSmenaAfterRefresh(TDataSet *DataSet);
	void __fastcall FIBDataSetSmenaSMN_WEEKENDGetText(TField *Sender,
          AnsiString &Text, bool DisplayText);
	void __fastcall FIBDataSetSmenaSMN_DAY_NIGHTGetText(TField *Sender,
          AnsiString &Text, bool DisplayText);
private:	// User declarations
	short *CodUser;
	int UserCount;
// _________________________________________________________DATABASE CONNECTIONS
	AnsiString HostName;
	AnsiString PrimaryHost;
	AnsiString SecondaryHost;
	AnsiString UserName;
	AnsiString Password;
	AnsiString DBName;
	AnsiString DBPhone;
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ DATABASE CONNECTIONS

	bool MainHost;
	int CurrentSmena;
	int SmenaWeekend;//	int UserCount;
//	int ;
public:		// User declarations
	__fastcall TFormMain(TComponent* Owner);

	bool LoginOk;
};
//---------------------------------------------------------------------------
extern PACKAGE TFormMain *FormMain;
//---------------------------------------------------------------------------
#endif
