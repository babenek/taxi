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
#pragma resource "*.dfm"
TDM *DM;
//---------------------------------------------------------------------------
__fastcall TDM::TDM(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TDM::FIBDataSetSMN_WEEKENDGetText(TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="будни";
		else if(Sender->Value == 1) Text="праздник";
		else Text="";
		}
}
//---------------------------------------------------------------------------
void __fastcall TDM::FIBDataSetSMN_STATEGetText(TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="активна";
		else if(Sender->Value == 1) Text="закрыта";
		else Text="???";
		}
}
//---------------------------------------------------------------------------
void __fastcall TDM::FIBDataSetSMN_DAY_NIGHTGetText(TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="день";
		else if(Sender->Value == 1) Text="ночь";
		else Text="";
		}
}
//---------------------------------------------------------------------------

void __fastcall TDM::FIBDataSetClientsBeforeOpen(TDataSet *DataSet)
{
	if(FIBDataSetClients->Active)FIBDataSetClients->Close();
	FIBDataSetClients->SQLs->SelectSQL->Clear();
	FIBDataSetClients->SQLs->SelectSQL->Add("SELECT	 UNIQC,	 CLT_NAME,	 CLT_TYPE,	 CLT_COUNTER,	 CLT_ADRESS,	 CLT_PHONE,	 CLT_INFO,	 CLT_DISCOUNT  	FROM	 CLIENTS where uniqc <> 0");
	for (int n=0;n<FormMain->DBGridEhClients->Columns->Count;n++){
		if(FormMain->DBGridEhClients->Columns->Items[n]->Title->SortMarker==smDownEh){
			FIBDataSetClients->SQLs->SelectSQL->Add("order by "+FormMain->DBGridEhClients->Columns->Items[n]->FieldName);
			break;
			}
		if(FormMain->DBGridEhClients->Columns->Items[n]->Title->SortMarker==smUpEh){
			FIBDataSetClients->SQLs->SelectSQL->Add("order by "+FormMain->DBGridEhClients->Columns->Items[n]->FieldName+" desc");
			break;
			}
		}
}
//---------------------------------------------------------------------------

void __fastcall TDM::FIBDataSetOrdModBeforeOpen(TDataSet *DataSet)
{
	FIBDataSetOrdMod->ParamByName("KEY_ORD_TYPE")->AsShort=FIBDataSetOrdCost->FieldValues["COD_ORD_TYPE"];
}
//---------------------------------------------------------------------------

void __fastcall TDM::FIBDataSetOrdCostAfterScroll(TDataSet *DataSet)
{
	FIBDataSetOrdMod->CloseOpen(true);
}
//---------------------------------------------------------------------------




void __fastcall TDM::FIBDataSetOrdModNewRecord(TDataSet *DataSet)
{
	FIBDataSetOrdMod->FieldValues["KEY_ORD_TYPE"]=FIBDataSetOrdCost->FieldValues["COD_ORD_TYPE"];;	
}
//---------------------------------------------------------------------------

