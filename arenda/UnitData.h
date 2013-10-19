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
#include "pFIBSQLLog.hpp"
//---------------------------------------------------------------------------
class TDM : public TDataModule
{
__published:	// IDE-managed Components
	TpFIBStoredProc *FIBStoredProc_VEHICLE_PAY;
	TpFIBDataSet *FIBDataSetSmena;
	TFIBIntegerField *FIBDataSetSmenaUNIQS;
	TFIBDateTimeField *FIBDataSetSmenaSMN_TIME_START;
	TFIBDateTimeField *FIBDataSetSmenaSMN_TIME_STOP;
	TFIBSmallIntField *FIBDataSetSmenaSMN_STATE;
	TFIBSmallIntField *FIBDataSetSmenaSMN_WEEKEND;
	TFIBDateField *FIBDataSetSmenaSMN_DATE;
	TFIBSmallIntField *FIBDataSetSmenaSMN_DAY_NIGHT;
	TFIBStringField *FIBDataSetSmenaUSR_LIST;
	TDataSource *DataSourceSmena;
	TpFIBDataSet *FIBDataSetArendaActions;
	TDataSource *DataSourceArendaActions;
	TpFIBDatabase *FIBDatabaseSamara;
	TpFIBTransaction *FIBTransactionSamara;
	TpFIBTransaction *FIBTransactionUpdate;
	TDataSource *DataSourceVehicles;
	TpFIBDataSet *FIBDataSetVehicles;
	TDataSource *DataSourceArenda;
	TpFIBDataSet *FIBDataSetArenda;
	TpFIBStoredProc *FIBStoredProcExchangeGet;
	TpFIBStoredProc *FIBStoredProcExchangeSet;
	TpFIBDataSet *FIBDataSetExchange;
	TDataSource *DataSourceExchange;
	TpFIBStoredProc *FIBStoredProc_VEHICLE_ADD;
	TFIBIntegerField *FIBDataSetArendaUNIQA;
	TFIBSmallIntField *FIBDataSetArendaPREV_UNIQA;
	TFIBSmallIntField *FIBDataSetArendaARN_STATE;
	TFIBIntegerField *FIBDataSetArendaKEY_UNIQV;
	TFIBSmallIntField *FIBDataSetArendaKEY_THEME;
	TFIBDateField *FIBDataSetArendaARN_DATE;
	TFIBIntegerField *FIBDataSetArendaKEY_SMN_START;
	TFIBIntegerField *FIBDataSetArendaKEY_SMN_STOP;
	TFIBSmallIntField *FIBDataSetArendaKEY_ARN_ACTION;
	TFIBDateTimeField *FIBDataSetArendaTIME_START;
	TFIBDateTimeField *FIBDataSetArendaTIME_STOP;
	TFIBFloatField *FIBDataSetArendaMONEY;
	TFIBFloatField *FIBDataSetArendaCURRENCY;
	TFIBFloatField *FIBDataSetArendaBALANCE;
	TFIBIntegerField *FIBDataSetArendaKEY_EXCHANGE;
	TFIBStringField *FIBDataSetArendaINFO;
	TStringField *FIBDataSetArendaLU_ARN_ACTIONS;
	TpFIBStoredProc *FIBStoredProc_VEHICLE_ROLLBACK;
	TpFIBQuery *FIBQuery;
	void __fastcall FIBDataSetSMN_WEEKENDGetText(TField *Sender, AnsiString &Text, bool DisplayText);
	void __fastcall FIBDataSetSMN_STATEGetText(TField *Sender, AnsiString &Text, bool DisplayText);
	void __fastcall FIBDataSetSMN_DAY_NIGHTGetText(TField *Sender, AnsiString &Text, bool DisplayText);
	void __fastcall FIBDataSetSmenaBeforeOpen(TDataSet *DataSet);
	void __fastcall FIBDataSetArendaBeforeOpen(TDataSet *DataSet);
	void __fastcall FIBDataSetSmenaEndScroll(TDataSet *DataSet);
	void __fastcall FIBDataSetVehiclesEndScroll(TDataSet *DataSet);
	void __fastcall FIBDataSetLastRecordAfterOpen(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
	__fastcall TDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDM *DM;
//---------------------------------------------------------------------------
#endif
