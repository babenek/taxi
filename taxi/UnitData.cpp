//$$---- Form CPP ----
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UnitData.h"
#include "UnitMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "FIBDatabase"
#pragma link "FIBDataSet"
#pragma link "FIBQuery"
#pragma link "pFIBDatabase"
#pragma link "pFIBDataSet"
#pragma link "pFIBQuery"
#pragma link "pFIBStoredProc"
#pragma link "SIBEABase"
#pragma link "SIBFIBEA"
#pragma resource "*.dfm"
TDM *DM;
//---------------------------------------------------------------------------
__fastcall TDM::TDM(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDM::SIBfibEventAlerterLocRefreshEventAlert(TObject *Sender,
      AnsiString EventName, int EventCount)
{
	if (EventName == "LOC_REFRESH"){
		FormMain->LocRefresh(this);
		}
}
//---------------------------------------------------------------------------
void __fastcall TDM::SIBfibEventAlerterOrdRefreshEventAlert(TObject *Sender,
      AnsiString EventName, int EventCount)
{
// обновление таблиц заказов
	if (EventName == "ORD_REFRESH_ONLINE" && FormMain->OrdRefreshOnline){
		FIBDataSet_ORD_ONLINE->CloseOpen(true);
		}
	if (EventName == "ORD_REFRESH_DELAY" && FormMain->OrdRefreshDelay){
		FIBDataSet_ORD_DELAY->CloseOpen(true);
		}
	if (EventName == "ORD_REFRESH_REZERV" && FormMain->OrdRefreshRezerv){
		FIBDataSet_ORD_RESERV->CloseOpen(true);
		}
}
//---------------------------------------------------------------------------


