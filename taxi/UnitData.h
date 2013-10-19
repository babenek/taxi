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
	TpFIBDataSet *FIBDataSet_V_LOCATIONS;
	TpFIBDataSet *FIBDataSet_S_LOCATION;
	TpFIBDataSet *FIBDataSet_S_THEME;
	TpFIBDataSet *FIBDataSetCliensOrders;
	TpFIBDataSet *FIBDataSetClientDiscont;
	TpFIBDataSet *FIBDataSetClients;
	TpFIBDataSet *FIBDataSetSOrdType;
	TSIBfibEventAlerter *SIBfibEventAlerterLocRefresh;
	TSIBfibEventAlerter *SIBfibEventAlerterOrdRefresh;
	TpFIBStoredProc *FIBStoredProcSmenaCheck;
	TpFIBStoredProc *FIBStoredProcRessortNight;
	TpFIBStoredProc *FIBStoredProcRessortDay;
	TpFIBStoredProc *FIBStoredProcLocationCheck;
	TpFIBStoredProc *FIBStoredProcSmenaRepNo;
	TpFIBStoredProc *FIBStoredProc_LOCATION_ROLLBACK;
	TpFIBStoredProc *FIBStoredProc_LOCATION_UPDATE;
	TpFIBStoredProc *FIBStoredProc_LOCATION_STOP;
	TpFIBStoredProc *FIBStoredProc_LOCATION_START;
	TpFIBDataSet *FIBDataSet_ORD_RESERV;
	TFIBIntegerField *FIBDataSet_ORD_RESERVUNIQO;
	TFIBSmallIntField *FIBDataSet_ORD_RESERVKEY_THEME;
	TFIBSmallIntField *FIBDataSet_ORD_RESERVKEY_ORD_TYPE;
	TFIBIntegerField *FIBDataSet_ORD_RESERVKEY_CLIENT;
	TFIBIntegerField *FIBDataSet_ORD_RESERVKEY_SMN_START;
	TFIBDateTimeField *FIBDataSet_ORD_RESERVTIME_START;
	TFIBStringField *FIBDataSet_ORD_RESERVORD_DESTINATION;
	TFIBStringField *FIBDataSet_ORD_RESERVORD_DEPARTURE;
	TFIBStringField *FIBDataSet_ORD_RESERVORD_PHONE;
	TDataSource *DataSource_ORD_RESERV;
	TpFIBDataSet *FIBDataSet_ORD_DELAY;
	TFIBIntegerField *FIBDataSet_ORD_DELAYUNIQO;
	TFIBSmallIntField *FIBDataSet_ORD_DELAYKEY_THEME;
	TFIBSmallIntField *FIBDataSet_ORD_DELAYKEY_ORD_TYPE;
	TFIBIntegerField *FIBDataSet_ORD_DELAYKEY_CLIENT;
	TFIBIntegerField *FIBDataSet_ORD_DELAYKEY_SMN_START;
	TFIBDateTimeField *FIBDataSet_ORD_DELAYTIME_START;
	TFIBStringField *FIBDataSet_ORD_DELAYORD_DESTINATION;
	TFIBStringField *FIBDataSet_ORD_DELAYORD_DEPARTURE;
	TFIBStringField *FIBDataSet_ORD_DELAYORD_PHONE;
	TDataSource *DataSource_ORD_DELAY;
	TpFIBDataSet *FIBDataSet_ORD_ONLINE;
	TFIBIntegerField *FIBDataSet_ORD_ONLINEUNIQO;
	TFIBSmallIntField *FIBDataSet_ORD_ONLINEKEY_THEME;
	TFIBIntegerField *FIBDataSet_ORD_ONLINEKEY_LOCATIONS;
	TFIBSmallIntField *FIBDataSet_ORD_ONLINEKEY_ORD_TYPE;
	TFIBIntegerField *FIBDataSet_ORD_ONLINEKEY_CLIENT;
	TFIBSmallIntField *FIBDataSet_ORD_ONLINEORD_STATE;
	TFIBTimeField *FIBDataSet_ORD_ONLINEORD_DURATION;
	TFIBIntegerField *FIBDataSet_ORD_ONLINEORD_DISTANCE;
	TFIBFloatField *FIBDataSet_ORD_ONLINEORD_COST;
	TFIBIntegerField *FIBDataSet_ORD_ONLINEORD_HOURS;
	TFIBFloatField *FIBDataSet_ORD_ONLINEORD_ITOG;
	TFIBIntegerField *FIBDataSet_ORD_ONLINEKEY_SMN_START;
	TFIBIntegerField *FIBDataSet_ORD_ONLINEKEY_SMN_STOP;
	TFIBDateTimeField *FIBDataSet_ORD_ONLINETIME_START;
	TFIBDateTimeField *FIBDataSet_ORD_ONLINETIME_STOP;
	TFIBStringField *FIBDataSet_ORD_ONLINEORD_DESTINATION;
	TFIBStringField *FIBDataSet_ORD_ONLINEORD_DEPARTURE;
	TFIBStringField *FIBDataSet_ORD_ONLINEORD_PHONE;
	TDataSource *DataSource_ORD_ONLINE;
	TpFIBQuery *FIBQueryOrderDelete;
	TpFIBStoredProc *FIBStoredProc_ORDER_STOP;
	TpFIBStoredProc *FIBStoredProc_ORDER_START;
	TpFIBDataSet *FIBDataSet_ORD_REZERV_CHECK;
	TFIBIntegerField *FIBIntegerField1;
	TFIBDateTimeField *FIBDateTimeField1;
	TpFIBStoredProc *FIBStoredProcSmenaWeekEnd;
	TpFIBStoredProc *FIBStoredProcSmenaAction;
	TpFIBDataSet *FIBDataSetSmena;
	TFIBIntegerField *FIBDataSetSmenaUNIQS;
	TFIBDateTimeField *FIBDataSetSmenaSMN_TIME_START;
	TFIBDateTimeField *FIBDataSetSmenaSMN_TIME_STOP;
	TFIBSmallIntField *FIBDataSetSmenaSMN_STATE;
	TFIBSmallIntField *FIBDataSetSmenaSMN_WEEKEND;
	TFIBDateField *FIBDataSetSmenaSMN_DATE;
	TFIBSmallIntField *FIBDataSetSmenaSMN_DAY_NIGHT;
	TFIBStringField *FIBDataSetSmenaUSR_LIST;
	TpFIBDataSet *FIBDataSetCOLORS;
	TpFIBDataSet *FIBDataSetCFG;
	TDataSource *DataSourceSOrdType;
	TpFIBStoredProc *FIBStoredProc_LOCATION_UNMARK;
	TpFIBStoredProc *FIBStoredProc_LOCATION_MARK;
	TpFIBStoredProc *FIBStoredProc_THEME_MARKER;
	TpFIBStoredProc *FIBStoredProc_LOCATION_ROLL;
	void __fastcall SIBfibEventAlerterLocRefreshEventAlert(TObject *Sender,
          AnsiString EventName, int EventCount);
	void __fastcall SIBfibEventAlerterOrdRefreshEventAlert(TObject *Sender,
          AnsiString EventName, int EventCount);
private:	// User declarations
public:		// User declarations
	__fastcall TDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDM *DM;
//---------------------------------------------------------------------------
#endif
