п»ї//$$---- Form CPP ----
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
#pragma link "pFIBSQLLog"
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
		if(Sender->Value == 0) Text="Р±СѓРґРЅРё";
		else if(Sender->Value == 1) Text="РїСЂР°Р·РґРЅРёРє";
		else Text="";
		}
}
//---------------------------------------------------------------------------
void __fastcall TDM::FIBDataSetSMN_STATEGetText(TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="Р°РєС‚РёРІРЅР°";
		else if(Sender->Value == 1) Text="Р·Р°РєСЂС‹С‚Р°";
		else Text="???";
		}
}
//---------------------------------------------------------------------------
void __fastcall TDM::FIBDataSetSMN_DAY_NIGHTGetText(TField *Sender, AnsiString &Text, bool DisplayText)
{
	if(Sender->DataType == ftSmallint){
		if(Sender->Value == 0) Text="РґРµРЅСЊ";
		else if(Sender->Value == 1) Text="РЅРѕС‡СЊ";
		else Text="";
		}
}
//---------------------------------------------------------------------------
void __fastcall TDM::FIBDataSetSmenaBeforeOpen(TDataSet *DataSet)
{
	if(FIBDataSetSmena->Active) FIBDataSetSmena->Close();
	FIBDataSetSmena->SQLs->SelectSQL->Clear();
	FIBDataSetSmena->SQLs->SelectSQL->Add("SELECT UNIQS, SMN_TIME_START, SMN_TIME_STOP, SMN_STATE, SMN_WEEKEND, SMN_DATE, SMN_DAY_NIGHT, USR_LIST");
	FIBDataSetSmena->SQLs->SelectSQL->Add("FROM SMENA where uniqs is not null");

	if (FormMain->CheckBoxProtect->Checked){
		FIBDataSetSmena->SQLs->SelectSQL->Add("and smn_state = 0");
		}

	FIBDataSetSmena->SQLs->SelectSQL->Add("order by uniqs");
}
//---------------------------------------------------------------------------

void __fastcall TDM::FIBDataSetArendaBeforeOpen(TDataSet *DataSet)
{
	if(FIBDataSetArenda->Active) FIBDataSetArenda->Close();
	FIBDataSetArenda->SQLs->SelectSQL->Clear();
	FIBDataSetArenda->SQLs->SelectSQL->Add("\
SELECT                             \
	 ARENDA.UNIQA                         ,\
	 ARENDA.PREV_UNIQA                    ,\
	 ARENDA.ARN_STATE                     ,\
	 ARENDA.KEY_UNIQV                     ,\
	 ARENDA.KEY_THEME                     ,\
	 ARENDA.ARN_DATE                      ,\
	 ARENDA.KEY_SMN_START                 ,\
	 ARENDA.KEY_SMN_STOP                  ,\
	 ARENDA.KEY_ARN_ACTION                ,\
	 ARENDA.TIME_START                    ,\
	 ARENDA.TIME_STOP                     ,\
	 ARENDA.MONEY                         ,\
	 ARENDA.CURRENCY                      ,\
	 ARENDA.BALANCE                       ,\
	 ARENDA.KEY_EXCHANGE                  ,\
	 ARENDA.INFO \
FROM ARENDA, vehicles \
where UNIQA > 0 and key_uniqv=uniqv and vhc_state=0 and arn_state in(0,1,3)");

	if (FormMain->CheckBoxProtect->Checked || FormMain->CheckBoxOneSmenaOnly->Checked){
		FIBDataSetArenda->SQLs->SelectSQL->Add("and key_smn_start = "+IntToStr((int)FIBDataSetSmena->FieldValues["UNIQS"]));
		}

	if (FormMain->CheckBoxOneVehiclesOnly->Checked){
		FIBDataSetArenda->SQLs->SelectSQL->Add("and key_uniqv = "+IntToStr((int)FIBDataSetVehicles->FieldValues["UNIQV"]));
		}

	if (FormMain->CheckBoxArenda->Checked){
		FIBDataSetArenda->SQLs->SelectSQL->Add("and key_arn_action in(1,3,4,5,7) ");
		}

	FIBDataSetArenda->SQLs->SelectSQL->Add("order by uniqa");
}
//---------------------------------------------------------------------------


void __fastcall TDM::FIBDataSetSmenaEndScroll(TDataSet *DataSet)
{
	if (FormMain->CheckBoxOneSmenaOnly->Checked)
		FIBDataSetArenda->CloseOpen(true);
}
//---------------------------------------------------------------------------

void __fastcall TDM::FIBDataSetVehiclesEndScroll(TDataSet *DataSet)
{
	if (FormMain->CheckBoxOneVehiclesOnly->Checked)
		FIBDataSetArenda->CloseOpen(true);
}
//---------------------------------------------------------------------------

void __fastcall TDM::FIBDataSetLastRecordAfterOpen(TDataSet *DataSet)
{
	DataSet->Last();
}
//---------------------------------------------------------------------------

