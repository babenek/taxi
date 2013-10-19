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
#include "pFIBDatabase.hpp"
#include "pFIBDataSet.hpp"
#include <DB.hpp>
//---------------------------------------------------------------------------
class TDM : public TDataModule
{
__published:	// IDE-managed Components
	TpFIBDatabase *FIBDatabasePhones;
	TpFIBTransaction *pFIBTransaction;
	TpFIBTransaction *pFIBTransactionUpdate;
	TpFIBDataSet *DataSetMain;
	TFIBStringField *DataSetMainPHONE;
	TFIBStringField *DataSetMainNAME;
	TFIBStringField *DataSetMainHOUSE;
	TFIBStringField *DataSetMainFLAT;
	TFIBSmallIntField *DataSetMainTOS;
	TFIBIntegerField *DataSetMainUNIQP;
	TFIBIntegerField *DataSetMainSTREET;
	TFIBIntegerField *DataSetMainSTREET_TYPE;
	TStringField *DataSetMainlu_street;
	TStringField *DataSetMainlu_street_type;
	TDataSource *DataSourceMain;
	TpFIBDataSet *pFIBDataSet2;
	TpFIBDataSet *pFIBDataSet1;
private:	// User declarations
public:		// User declarations
	__fastcall TDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDM *DM;
//---------------------------------------------------------------------------
#endif
