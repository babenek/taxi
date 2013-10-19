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
#include "SIBEABase.hpp"
#include "SIBFIBEA.hpp"
#include <DB.hpp>
//---------------------------------------------------------------------------
class TDM : public TDataModule
{
__published:	// IDE-managed Components
	TpFIBTransaction *FIBTransaction;
	TpFIBTransaction *FIBTransactionUpdate;
	TpFIBDatabase *FIBDatabase;
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
	TpFIBDataSet *FIBDataSetLocation;
	TDataSource *DataSourceLocation;
	TDataSource *DataSourceSmnReport;
	TpFIBDataSet *FIBDataSetSmnReport;
	TFIBIntegerField *FIBDataSetSmnReportUNIQS;
	TFIBDateTimeField *FIBDataSetSmnReportSMN_TIME_START;
	TFIBDateTimeField *FIBDataSetSmnReportSMN_TIME_STOP;
	TFIBSmallIntField *FIBDataSetSmnReportSMN_STATE;
	TFIBSmallIntField *FIBDataSetSmnReportSMN_WEEKEND;
	TFIBDateField *FIBDataSetSmnReportSMN_DATE;
	TFIBSmallIntField *FIBDataSetSmnReportSMN_DAY_NIGHT;
	TFIBStringField *FIBDataSetSmnReportUSR_LIST;
	TDataSource *DataSourceSmnDetail;
	TpFIBDataSet *FIBDataSetSmnDetail;
	TFIBIntegerField *FIBDataSetSmnDetailUNIQS;
	TFIBDateTimeField *FIBDataSetSmnDetailSMN_TIME_START;
	TFIBDateTimeField *FIBDataSetSmnDetailSMN_TIME_STOP;
	TFIBSmallIntField *FIBDataSetSmnDetailSMN_STATE;
	TFIBSmallIntField *FIBDataSetSmnDetailSMN_WEEKEND;
	TFIBDateField *FIBDataSetSmnDetailSMN_DATE;
	TFIBSmallIntField *FIBDataSetSmnDetailSMN_DAY_NIGHT;
	TFIBStringField *FIBDataSetSmnDetailUSR_LIST;
	TDataSource *DataSourceSmnWeek;
	TpFIBDataSet *FIBDataSetSmnWeek;
	TFIBIntegerField *FIBDataSetSmnWeekUNIQS;
	TFIBDateTimeField *FIBDataSetSmnWeekSMN_TIME_START;
	TFIBDateTimeField *FIBDataSetSmnWeekSMN_TIME_STOP;
	TFIBSmallIntField *FIBDataSetSmnWeekSMN_STATE;
	TFIBSmallIntField *FIBDataSetSmnWeekSMN_WEEKEND;
	TFIBDateField *FIBDataSetSmnWeekSMN_DATE;
	TFIBSmallIntField *FIBDataSetSmnWeekSMN_DAY_NIGHT;
	TFIBStringField *FIBDataSetSmnWeekUSR_LIST;
	TDataSource *DataSourceSmnTools;
	TpFIBDataSet *FIBDataSetSmnTools;
	TFIBIntegerField *FIBIntegerField2;
	TFIBDateTimeField *FIBDateTimeField3;
	TFIBDateTimeField *FIBDateTimeField4;
	TFIBSmallIntField *FIBSmallIntField4;
	TFIBSmallIntField *FIBSmallIntField5;
	TFIBDateField *FIBDateField2;
	TFIBSmallIntField *FIBSmallIntField6;
	TFIBStringField *FIBStringField2;
	TDataSource *DataSourceWeeks;
	TpFIBDataSet *FIBDataSetWeeks;
	TpFIBQuery *FIBQueryWeeksDelete;
	TpFIBQuery *FIBQueryTools;
private:	// User declarations
public:		// User declarations
	__fastcall TDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDM *DM;
//---------------------------------------------------------------------------
#endif
