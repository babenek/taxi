//$$---- Form HDR ----
//---------------------------------------------------------------------------

#ifndef UnitDataH
#define UnitDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "FIBDatabase.hpp"
#include "FIBDataSet.hpp"
#include "FIBQuery.hpp"
#include "pFIBDatabase.hpp"
#include "pFIBDataSet.hpp"
#include "pFIBQuery.hpp"
#include "pFIBStoredProc.hpp"
#include <DB.hpp>
//---------------------------------------------------------------------------
class TDM : public TDataModule
{
__published:	// IDE-managed Components
	TpFIBStoredProc *tmpFIBStoredProc_ORDER_START;
	TpFIBStoredProc *FIBStoredProcItog;
	TpFIBStoredProc *FIBStoredProc_LOCATION_STOP;
	TpFIBStoredProc *FIBStoredProc_LOCATION_START;
	TpFIBStoredProc *FIBStoredProc_ORDER_STOP;
	TpFIBStoredProc *FIBStoredProcReportCreate;
	TpFIBStoredProc *FIBStoredProcReportUpdate;
	TpFIBStoredProc *FIBStoredProcReportRecalc;
	TpFIBStoredProc *FIBStoredProcReportThmInfo;
	TpFIBQuery *FIBQueryWeeksDelete;
	TpFIBQuery *FIBQueryTools;
	TpFIBDataSet *FIBDataSetSmnWeek;
	TFIBIntegerField *FIBDataSetSmnWeekUNIQS;
	TFIBDateTimeField *FIBDataSetSmnWeekSMN_TIME_START;
	TFIBDateTimeField *FIBDataSetSmnWeekSMN_TIME_STOP;
	TFIBSmallIntField *FIBDataSetSmnWeekSMN_STATE;
	TFIBSmallIntField *FIBDataSetSmnWeekSMN_WEEKEND;
	TFIBDateField *FIBDataSetSmnWeekSMN_DATE;
	TFIBSmallIntField *FIBDataSetSmnWeekSMN_DAY_NIGHT;
	TFIBStringField *FIBDataSetSmnWeekUSR_LIST;
	TDataSource *DataSourceSmnWeek;
	TpFIBDataSet *FIBDataSetSmnDetail;
	TFIBIntegerField *FIBDataSetSmnDetailUNIQS;
	TFIBDateTimeField *FIBDataSetSmnDetailSMN_TIME_START;
	TFIBDateTimeField *FIBDataSetSmnDetailSMN_TIME_STOP;
	TFIBSmallIntField *FIBDataSetSmnDetailSMN_STATE;
	TFIBSmallIntField *FIBDataSetSmnDetailSMN_WEEKEND;
	TFIBDateField *FIBDataSetSmnDetailSMN_DATE;
	TFIBSmallIntField *FIBDataSetSmnDetailSMN_DAY_NIGHT;
	TFIBStringField *FIBDataSetSmnDetailUSR_LIST;
	TDataSource *DataSourceSmnDetail;
	TpFIBDataSet *FIBDataSetSmnReport;
	TFIBIntegerField *FIBDataSetSmnReportUNIQS;
	TFIBDateTimeField *FIBDataSetSmnReportSMN_TIME_START;
	TFIBDateTimeField *FIBDataSetSmnReportSMN_TIME_STOP;
	TFIBSmallIntField *FIBDataSetSmnReportSMN_STATE;
	TFIBSmallIntField *FIBDataSetSmnReportSMN_WEEKEND;
	TFIBDateField *FIBDataSetSmnReportSMN_DATE;
	TFIBSmallIntField *FIBDataSetSmnReportSMN_DAY_NIGHT;
	TFIBStringField *FIBDataSetSmnReportUSR_LIST;
	TDataSource *DataSourceSmnReport;
	TpFIBDataSet *FIBDataSetReport;
	TDataSource *DataSourceReport;
	TpFIBDataSet *FIBDataSetDetail;
	TDataSource *DataSourceDetail;
	TpFIBDataSet *FIBDataSetClients;
	TDataSource *DataSourceClients;
	TpFIBDataSet *FIBDataSetWeekReport;
	TFIBIntegerField *FIBDataSetWeekReportUNIQR;
	TFIBSmallIntField *FIBDataSetWeekReportKEY_THEME;
	TFIBFloatField *FIBDataSetWeekReportREP_ORDERS;
	TFIBFloatField *FIBDataSetWeekReportREP_REKLAMA;
	TFIBFloatField *FIBDataSetWeekReportREP_MEDIK;
	TFIBFloatField *FIBDataSetWeekReportREP_DOLG;
	TFIBFloatField *FIBDataSetWeekReportREP_KWART;
	TFIBFloatField *FIBDataSetWeekReportREP_CORRECT;
	TFIBFloatField *FIBDataSetWeekReportREP_ITOG;
	TFIBFloatField *FIBDataSetWeekReportREP_OT4ET;
	TFIBFloatField *FIBDataSetWeekReportREP_OSTATOK;
	TFIBStringField *FIBDataSetWeekReportTHM_MODEL;
	TDataSource *DataSourceWeekReport;
	TpFIBDataSet *FIBDataSetOrdCost;
	TDataSource *DataSourceOrdCost;
	TDataSource *DataSourceUser;
	TpFIBDataSet *FIBDataSetUser;
   TpFIBDataSet *FIBDataSetSTheme;
   TDataSource *DataSourceSTheme;
	TpFIBDataSet *FIBDataSetSOrdType;
	TpFIBDataSet *FIBDataSetSClients;
	TpFIBDataSet *FIBDataSetCountUniqw;
	TpFIBDataSet *FIBDataSetWeeks;
	TDataSource *DataSourceWeeks;
	TpFIBDatabase *FIBDatabase;
	TpFIBTransaction *FIBTransaction;
	TpFIBTransaction *FIBTransactionUpdate;
	TDataSource *DataSourceSUser;
	TpFIBDataSet *FIBDataSetSUser;
	TDataSource *DataSourceSmenaReport;
	TpFIBDataSet *FIBDataSetSmenaReport;
	TFIBIntegerField *FIBDataSetSmenaReportVO_UNIQS;
	TFIBStringField *FIBDataSetSmenaReportVO_USR_LIST;
	TFIBDateField *FIBDataSetSmenaReportVO_SMN_DATE;
	TFIBStringField *FIBDataSetSmenaReportVO_DAY_NIGHT;
	TFIBIntegerField *FIBDataSetSmenaReportVO_ORDERS;
	TFIBFloatField *FIBDataSetSmenaReportVO_ORD_COST;
   TpFIBDataSet *FIBDataSetThemes;
   TDataSource *DataSourceThemes;
   TpFIBStoredProc *FIBStoredProcThemeArc;
	TFIBStringField *FIBDataSetWeekReportTHM_BRIGADE;
	TpFIBDataSet *FIBDataSetCFG;
	TpFIBDataSet *FIBDataSetOrdMod;
	TDataSource *DataSourceOrdMod;
	void __fastcall FIBDataSetSMN_WEEKENDGetText(TField *Sender, AnsiString &Text, bool DisplayText);
	void __fastcall FIBDataSetSMN_STATEGetText(TField *Sender, AnsiString &Text, bool DisplayText);
	void __fastcall FIBDataSetSMN_DAY_NIGHTGetText(TField *Sender, AnsiString &Text, bool DisplayText);
	void __fastcall FIBDataSetClientsBeforeOpen(TDataSet *DataSet);
	void __fastcall FIBDataSetOrdModBeforeOpen(TDataSet *DataSet);
	void __fastcall FIBDataSetOrdCostAfterScroll(TDataSet *DataSet);
	void __fastcall FIBDataSetOrdModNewRecord(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
	__fastcall TDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDM *DM;
//---------------------------------------------------------------------------
#endif
