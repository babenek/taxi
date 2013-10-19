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
#include "pFIBDatabase.hpp"
#include "pFIBDataSet.hpp"
#include <Db.hpp>
#include <Grids.hpp>
#include <ExtCtrls.hpp>
#include "VersionInfoComponent.h"
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <Mask.hpp>
#include "FIBQuery.hpp"
#include "pFIBQuery.hpp"
#include "pFIBStoredProc.hpp"
#include "PrnDbgeh.hpp"

#include "GridsEh.hpp"
#include <DB.hpp>
#include <Sockets.hpp>
#include "DBCtrlsEh.hpp"
#include "DBLookupEh.hpp"
//#include "GridsEh.hpp"
//---------------------------------------------------------------------------
class TFormOrders : public TForm
{
__published:	// IDE-managed Components
	TVersionInfo *VersionInfoOrders;
	TDataSource *DataSourceOrders;
	TpFIBDataSet *FIBDataSetOrders;
	TpFIBDataSet *FIBDataSetSmena;
	TDataSource *DataSourceSmena;
	TFIBIntegerField *FIBDataSetSmenaUNIQS;
	TFIBDateTimeField *FIBDataSetSmenaSMN_TIME_START;
	TFIBDateTimeField *FIBDataSetSmenaSMN_TIME_STOP;
	TFIBSmallIntField *FIBDataSetSmenaSMN_STATE;
	TFIBSmallIntField *FIBDataSetSmenaSMN_WEEKEND;
	TFIBDateField *FIBDataSetSmenaSMN_DATE;
	TFIBSmallIntField *FIBDataSetSmenaSMN_DAY_NIGHT;
	TFIBStringField *FIBDataSetSmenaUSR_LIST;
	TGroupBox *GroupBoxOrders;
	TDBGridEh *DBGridEhOrders;
	TSplitter *Splitter1;
	TpFIBStoredProc *FIBStoredProcSmenaItog;
	TpFIBDataSet *FIBDataSetClientDiscont;
	TpFIBDataSet *FIBDataSetClientPhone;
	TpFIBStoredProc *FIBStoredProc_ORDER_START;
	TpFIBStoredProc *FIBStoredProc_ORDER_DELETE;
	TpFIBDataSet *FIBDataSet_S_ORD_TYPE;
	TStringField *FIBDataSetOrdersLU_ORD_TYPE;
	TpFIBDataSet *pFIBDataSet_SMENA;
	TDataSource *DataSource_SMENA;
	TFIBIntegerField *FIBDataSetOrdersUNIQO;
	TFIBSmallIntField *FIBDataSetOrdersKEY_THEME;
	TFIBSmallIntField *FIBDataSetOrdersKEY_ORD_TYPE;
	TFIBFloatField *FIBDataSetOrdersORD_COST;
	TFIBIntegerField *FIBDataSetOrdersORD_HOURS;
	TFIBFloatField *FIBDataSetOrdersORD_ITOG;
	TFIBIntegerField *FIBDataSetOrdersKEY_SMN_START;
	TFIBIntegerField *FIBDataSetOrdersKEY_SMN_STOP;
	TFIBDateTimeField *FIBDataSetOrdersTIME_START;
	TFIBDateTimeField *FIBDataSetOrdersTIME_STOP;
	TFIBStringField *FIBDataSetOrdersORD_DESTINATION;
	TFIBStringField *FIBDataSetOrdersORD_DEPARTURE;
	TFIBStringField *FIBDataSetOrdersORD_PHONE;
	TFIBSmallIntField *FIBDataSetOrdersORD_STATE;
	TFIBIntegerField *FIBDataSetOrdersKEY_CLIENT;
	TGroupBox *GroupBoxZakazEdit;
	TPanel *Panel2;
	TDBGridEh *DBGridEhSmena;
	TPanel *Panel1;
	TLabel *Label10;
	TEdit *EditDistance;
	TEdit *EditMinute;
	TLabel *Label8;
	TEdit *EditHour;
	TLabel *Label9;
	TLabel *Label7;
	TEdit *EditCost;
	TLabel *LabelCost;
	TComboBox *ComboBoxOrdType;
	TCheckBox *CheckBoxOrdType;
	TEdit *EditDestination;
	TLabel *Label5;
	TLabel *LabelDestination;
	TEdit *EditDeparture;
	TLabel *LabelDeparture;
	TLabel *Label4;
	TEdit *EditPhone;
	TLabel *Label6;
	TEdit *EditTheme;
	TPanel *Panel3;
	TMonthCalendar *Calendar;
	TPanel *Panel4;
	TCheckBox *CheckBoxProtect;
	TCheckBox *CheckBoxCalendar;
	TBitBtn *BitBtnDeleteOrder;
	TPanel *Panel5;
	TCheckBox *CheckBoxKeyOrdType;
	TCheckBox *CheckBoxClients;
	TEdit *EditThemeFilter;
	TDataSource *DataSourcepSOrdType;
	TpFIBDataSet *pFIBDataSetClients;
	TDataSource *DataSourceClients;
	TDBLookupComboboxEh *DBLookupComboboxEhClients;
	TDBLookupComboboxEh *DBLookupComboboxEhOrdType;
	TpFIBDataSet *pFIBDataSetSOrdType;
	TLabel *Label1;
	TCheckBox *CheckBoxClientsOnly;
	TCheckBox *CheckBoxOrdFirmaOnly;
	TpFIBDataSet *FIBDataSet_CLIENTS;
	TStringField *FIBDataSetOrdersLU_CLIENTS;
	TSpeedButton *BitBtnOrder;
	TSpeedButton *BitBtnRefresh;
	TLabel *Label2;
	TDateTimePicker *DateTimePickerDate;
	TDateTimePicker *DateTimePickerTime;
	TDBLookupComboboxEh *DBLookupComboboxEhDiscount;
	TTcpClient *TcpClient1;
	TCheckBox *CheckBoxGarbage;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall BitBtnRefreshClick(TObject *Sender);
	void __fastcall CheckBoxCalendarClick(TObject *Sender);
	void __fastcall FIBDataSetSmenaSMN_DAY_NIGHTGetText(TField *Sender,
          AnsiString &Text, bool DisplayText);
	void __fastcall FIBDataSetSmenaSMN_WEEKENDGetText(TField *Sender,
          AnsiString &Text, bool DisplayText);
	void __fastcall FIBDataSetSmenaSMN_STATEGetText(TField *Sender,
          AnsiString &Text, bool DisplayText);
	void __fastcall DBGridEhSmenaDblClick(TObject *Sender);
	void __fastcall ButtonOnceOrderClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall BitBtnDeleteOrderClick(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall EditDiskontKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
	void __fastcall EditPhoneKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
	void __fastcall CheckBoxProtectClick(TObject *Sender);
	void __fastcall EditDepartureKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
	void __fastcall FormDestroy(TObject *Sender);
	void __fastcall EditThemeFilterKeyPress(TObject *Sender, char &Key);
	void __fastcall DBGridEhOrdersKeyPress(TObject *Sender, char &Key);
private:	// User declarations
	int CurrentSmena;
	bool AdminProtect;
	int *CodOrdType;
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
	__fastcall TFormOrders(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormOrders *FormOrders;
//---------------------------------------------------------------------------
#endif
