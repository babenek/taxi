//---------------------------------------------------------------------------

#ifndef UnitMainH
#define UnitMainH
#include "DBGridEh.hpp"
#include "FIBDatabase.hpp"
#include "FIBDataSet.hpp"
#include "FIBQuery.hpp"
#include "GridsEh.hpp"
#include "pFIBDatabase.hpp"
#include "pFIBDataSet.hpp"
#include "pFIBQuery.hpp"
#include "pFIBStoredProc.hpp"
#include "PrnDbgeh.hpp"
#include "VersionInfoComponent.h"
#include <Buttons.hpp>
#include <Classes.hpp>
#include <ComCtrls.hpp>
#include <Controls.hpp>
#include <DB.hpp>
#include <DBCtrls.hpp>
#include <ExtCtrls.hpp>
#include <StdCtrls.hpp>
#include <Sockets.hpp>
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:	// IDE-managed Components
	TPageControl *PageControlMain;
	TVersionInfo *VersionInfo;
	TPrintDBGridEh *PrintDBGridEhReport;
	TPrintDBGridEh *PrintDBGridEhWeekRep;
	TTabSheet *TabSheetTools;
	TDBGridEh *DBGridEhSmnTools;
	TGroupBox *GroupBox8;
	TSpeedButton *ButtonCleanOrderTrash;
	TLabel *Label1;
	TEdit *EditClean;
	TSpeedButton *ButtonOrdersClear;
	TSpeedButton *ButtonLocationsCear;
	TSpeedButton *ButtonReCalc;
	TGroupBox *GroupBox1;
	TMonthCalendar *CalendarReport;
	TTabSheet *TabSheet1;
	TDBGridEh *DBGridEh1;
	TDBNavigator *DBNavigator1;
	TTcpClient *TcpClient;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall BitBtnRefreshClick(TObject *Sender);
	void __fastcall DBGridEhWeekReportKeyPress(TObject *Sender, char &Key);
	void __fastcall BitBtnDeleteClick(TObject *Sender);
	void __fastcall FIBDataSetSMN_DAY_NIGHTGetText(TField *Sender,
          AnsiString &Text, bool DisplayText);
	void __fastcall FIBDataSetSMN_WEEKENDGetText(TField *Sender,
          AnsiString &Text, bool DisplayText);
	void __fastcall FIBDataSetSMN_STATEGetText(TField *Sender,
          AnsiString &Text, bool DisplayText);
	void __fastcall TabSheetClientShow(TObject *Sender);
	void __fastcall TabSheetClientHide(TObject *Sender);
	void __fastcall BitBtnSetRepClick(TObject *Sender);
	void __fastcall BitBtnRecalcClick(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall BitBtnProtectClick(TObject *Sender);
	void __fastcall BitBtnDolgClick(TObject *Sender);
	void __fastcall ButtonCleanOrderTrashClick(TObject *Sender);
	void __fastcall ButtonOrdersClearClick(TObject *Sender);
	void __fastcall ButtonLocationsCearClick(TObject *Sender);
	void __fastcall TabSheetToolsShow(TObject *Sender);
	void __fastcall TabSheetToolsHide(TObject *Sender);
	void __fastcall ButtonReCalcClick(TObject *Sender);
	void __fastcall TabSheet1Show(TObject *Sender);
	void __fastcall TabSheet1Hide(TObject *Sender);
private:	// User declarations
	bool PaintSelectRow;
	int UniqSelectedRow;
	int *CodOrdType;
	int *CodClients;
	bool MainHost;
// _________________________________________________________DATABASE CONNECTIONS
	AnsiString HostName;
	AnsiString PrimaryHost;
	AnsiString SecondaryHost;
	AnsiString UserName;
	AnsiString Password;
	AnsiString DBName;
	AnsiString DBPhone;
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ DATABASE CONNECTIONS

public:		// User declarations
	__fastcall TFormMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormMain *FormMain;
//---------------------------------------------------------------------------
#endif
