//---------------------------------------------------------------------------

#ifndef UnitMainH
#define UnitMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DBGridEh.hpp"
#include "FIBDatabase.hpp"
#include "FIBDataSet.hpp"
#include "FIBQuery.hpp"
#include "pFIBDatabase.hpp"
#include "pFIBDataSet.hpp"
#include "pFIBQuery.hpp"
#include "pFIBStoredProc.hpp"
#include "VersionInfoComponent.h"
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <Db.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Mask.hpp>
#include <DBCtrls.hpp>
#include "PrnDbgeh.hpp"
#include "DBSumLst.hpp"

#include "GridsEh.hpp"
#include <DB.hpp>
#include <Sockets.hpp>
#include "DBCtrlsEh.hpp"
#include "DBLookupEh.hpp"
//---------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:	// IDE-managed Components
	TPageControl *PageControlMain;
	TTabSheet *TabSheetThemes;
	TTabSheet *TabSheetOrdCost;
	TTabSheet *TabSheetReport;
	TTabSheet *TabSheetDetail;
	TPanel *PanelReport;
	TVersionInfo *VersionInfo;
   TDBGridEh *DBGridEhSTheme;
	TGroupBox *GroupBox3;
	TDBNavigator *DBNavigator1;
	TTabControl *TabControlSmnReport;
	TDBGridEh *DBGridEhSmnReport;
	TDBGridEh *DBGridEhDetail;
	TPanel *Panel1;
	TTabControl *TabControlSmnDetail;
	TBitBtn *BitBtnDetail;
	TEdit *EditTheme;
	TBitBtn *BitBtnToLocType0;
	TLabel *LabelTheme;
	TTabSheet *TabSheetClient;
	TGroupBox *GroupBox2;
	TDBNavigator *DBNavigatorClients;
	TDBGridEh *DBGridEhClients;
	TTabSheet *TabSheetWeekReport;
	TGroupBox *GroupBox5;
	TDBGridEh *DBGridEhSmnWeek;
	TGroupBox *GroupBoxWeekReport;
	TDBGridEh *DBGridEhWeekReport;
	TPanel *Panel2;
	TCheckBox *CheckBoxWeeks;
	TMonthCalendar *CalendarWeeks;
	TBitBtn *BitBtnReport;
	TBitBtn *BitBtnRefresh;
	TBitBtn *BitBtnReklama;
	TBitBtn *BitBtnMedik;
	TBitBtn *BitBtnKwart;
	TDBGridEh *DBGridEhWeeks;
	TBitBtn *BitBtnDelete;
	TBitBtn *BitBtnRecalc;
	TBitBtn *BitBtnSmnReport;
	TGroupBox *GroupBox1;
	TMonthCalendar *CalendarReport;
	TGroupBox *GroupBoxReport;
	TDBGridEh *DBGridEhReport;
	TBitBtn *BitBtnPrint;
	TBitBtn *BitBtnProtect;
	TCheckBox *CheckBoxOrdTypeFilter;
	TTabSheet *TabSheetUser;
	TGroupBox *GroupBox7;
	TBitBtn *BitBtnDolg;
	TComboBox *ComboBoxOrdType;
	TBitBtn *BitBtnDisableTheme;
	TComboBox *ComboBoxClients;
	TCheckBox *CheckBoxClientsFilter;
	TBitBtn *BitBtn1;
	TBitBtn *BitBtn2;
	TBitBtn *BitBtn3;
	TBitBtn *BitBtn4;
	TGroupBox *GroupBox6;
	TMonthCalendar *CalendarDetail;
	TDBGridEh *DBGridEhSmnDetail;
	TGroupBox *GroupBox8;
	TDBGridEh *DBGridEhUser;
	TPanel *Panel3;
	TDBNavigator *DBNavigatorUser;
	TDBGridEh *DBGridEh1;
	TPanel *Panel4;
	TSplitter *Splitter1;
   TGroupBox *GroupBox9;
   TMonthCalendar *DateTimePickerStartDate;
   TGroupBox *GroupBox10;
   TMonthCalendar *DateTimePickerStopDate;
   TSplitter *Splitter2;
   TGroupBox *GroupBox11;
   TDBGridEh *DBGridEhThemes;
   TBitBtn *BitBtnArchive;
	TCheckBox *CheckBoxLocations;
	TTcpClient *TcpClient1;
	TCheckBox *CheckBoxGarbage;
	TPanel *Panel5;
	TGroupBox *GroupBox4;
	TDBNavigator *DBNavigator2;
	TDBGridEh *DBGridEhOrdCost;
	TPanel *Panel6;
	TGroupBox *GroupBox12;
	TDBNavigator *DBNavigator3;
	TDBGridEh *DBGridEhOrdMod;
	TSplitter *Splitter3;
	TDateTimePicker *DateTimePicker1;
	TDateTimePicker *DateTimePicker2;
	TBitBtn *BitBtn5;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall BitBtnSmnReportClick(TObject *Sender);
	void __fastcall BitBtnReLocTypeClick(TObject *Sender);
	void __fastcall TabSheetOrdCostHide(TObject *Sender);
	void __fastcall TabSheetOrdCostShow(TObject *Sender);
	void __fastcall TabSheetThemesShow(TObject *Sender);
	void __fastcall TabSheetThemesHide(TObject *Sender);
	void __fastcall TabSheetReportHide(TObject *Sender);
	void __fastcall TabSheetReportShow(TObject *Sender);
	void __fastcall TabSheetDetailShow(TObject *Sender);
	void __fastcall TabSheetDetailHide(TObject *Sender);
	void __fastcall TabControlSmnDetailChange(TObject *Sender);
	void __fastcall TabControlSmnReportChange(TObject *Sender);
	void __fastcall BitBtnDetailClick(TObject *Sender);
	void __fastcall CalendarWeeksClick(TObject *Sender);
	void __fastcall DBGridEhWeeksDblClick(TObject *Sender);
	void __fastcall BitBtnReportClick(TObject *Sender);
	void __fastcall BitBtnRefreshClick(TObject *Sender);
	void __fastcall DBGridEhWeekReportKeyPress(TObject *Sender, char &Key);
	void __fastcall BitBtnDeleteClick(TObject *Sender);
	void __fastcall TabSheetClientShow(TObject *Sender);
	void __fastcall TabSheetClientHide(TObject *Sender);
	void __fastcall BitBtnSetRepClick(TObject *Sender);
	void __fastcall DBGridEhWeeksCellClick(TColumnEh *Column);
	void __fastcall BitBtnRecalcClick(TObject *Sender);
	void __fastcall DBGridEhDetailKeyPress(TObject *Sender, char &Key);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall ReportsRestore(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall BitBtnProtectClick(TObject *Sender);
	void __fastcall TabSheetUserHide(TObject *Sender);
	void __fastcall TabSheetUserShow(TObject *Sender);
	void __fastcall BitBtnDolgClick(TObject *Sender);
	void __fastcall BitBtnDisableThemeClick(TObject *Sender);
   void __fastcall BitBtnArchiveClick(TObject *Sender);
   void __fastcall DBGridEhKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall DBGridEhClientsSortMarkingChanged(TObject *Sender);
	void __fastcall DBGridEhClientsTitleBtnClick(TObject *Sender, int ACol, TColumnEh *Column);
	void __fastcall EditThemeKeyPress(TObject *Sender, char &Key);
	void __fastcall DBGridEhDetailGetCellParams(TObject *Sender, TColumnEh *Column, TFont *AFont, TColor &Background);
	void __fastcall DBGridEhUserDblClick(TObject *Sender);
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
