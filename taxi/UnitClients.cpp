//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UnitClients.h"
#include "UnitMain.h"
#include "UnitOrder.h"
#include "UnitData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "DBGridEh"
#pragma link "FIBDataSet"
#pragma link "pFIBDataSet"
#pragma link "FIBQuery"
#pragma link "pFIBQuery"
#pragma link "pFIBStoredProc"
#pragma link "GridsEh"
#pragma link "GridsEh"
#pragma resource "*.dfm"
TFormClients *FormClients;
//---------------------------------------------------------------------------
__fastcall TFormClients::TFormClients(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormClients::FormShow(TObject *Sender)
{
	ListBoxClientsInfo->Items->Clear();
	Left=1;Top=1;

	if(EditPHONE->Text.Length()>0){
		EditPHONE->Tag=1;
		EditNAME->Tag=0;
		EditKeyUp(Sender, 0, TShiftState());
		}
	else{
		EditPHONE->Tag=0;
		EditNAME->Tag=1;
		if(FIBDataSetClients->Active)FIBDataSetClients->Close();

		FIBDataSetClients->SQLs->SelectSQL->Clear();
		FIBDataSetClients->SQLs->SelectSQL->Add("SELECT UNIQC, CLT_NAME, CLT_INFO, CLT_ADRESS, CLT_TYPE, CLT_PHONE, CLT_COUNTER, CLT_DISCOUNT FROM CLIENTS where uniqc > 0");

		for(int n=0;n<DBGridEhClients->Columns->Count;n++){
			if (DBGridEhClients->Columns->Items[n]->Title->SortMarker==smDownEh){
				FIBDataSetClients->SQLs->SelectSQL->Add("order by "+DBGridEhClients->Columns->Items[n]->FieldName);
				break;
				}
			else if (DBGridEhClients->Columns->Items[n]->Title->SortMarker==smUpEh){
				FIBDataSetClients->SQLs->SelectSQL->Add("order by "+DBGridEhClients->Columns->Items[n]->FieldName+" desc");
				break;
				}
			}
		FIBDataSetClients->Open();
		EditNAME->SetFocus();
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormClients::FormHide(TObject *Sender)
{
	FIBDataSetClients->Close();
	FIBDataSetCltDetail->Close();
	ButtonClearClick(this);
   ButtonZakaz->Enabled=false;
	ButtonDelay->Enabled=false;
	ButtonOrdChange->Enabled=false;
}
//---------------------------------------------------------------------------
void __fastcall TFormClients::DBGridEhClientsTitleBtnClick(TObject *Sender,
		int ACol, TColumnEh *Column)
{
	if(FIBDataSetClients->Active)FIBDataSetClients->Close();
	FIBDataSetClients->SQLs->SelectSQL->Clear();
	FIBDataSetClients->SQLs->SelectSQL->Add("SELECT UNIQC, CLT_NAME, CLT_INFO, CLT_ADRESS, CLT_TYPE, CLT_PHONE, CLT_COUNTER, CLT_DISCOUNT FROM CLIENTS where uniqc > 0");

	if(EditUNIQC->Tag==1) FIBDataSetClients->SQLs->SelectSQL->Add("AND Upper(CLT_UNIQC) like \'"+EditUNIQC->Text.UpperCase()+"%\'");
	if(EditNAME->Tag==1) FIBDataSetClients->SQLs->SelectSQL->Add("AND Upper(CLT_NAME) like \'"+EditNAME->Text.UpperCase()+"%\'");
	if(EditADRESS->Tag==1) FIBDataSetClients->SQLs->SelectSQL->Add("AND Upper(CLT_ADRESS) like \'"+EditADRESS->Text.UpperCase()+"%\'");
	if(EditINFO->Tag==1) FIBDataSetClients->SQLs->SelectSQL->Add("AND Upper(CLT_INFO) like \'"+EditINFO->Text.UpperCase()+"%\'");
	if(EditPHONE->Tag==1) FIBDataSetClients->SQLs->SelectSQL->Add("AND Upper(CLT_PHONE) like \'"+EditPHONE->Text.UpperCase()+"%\'");

	if (Column->Title->SortMarker==smNoneEh){
		FIBDataSetClients->SQLs->SelectSQL->Add("order by "+Column->FieldName);
		Column->Title->SortMarker=smDownEh;
		}
	else if (Column->Title->SortMarker==smDownEh){
		FIBDataSetClients->SQLs->SelectSQL->Add("order by "+Column->FieldName+" desc");
		Column->Title->SortMarker=smUpEh;
		}
	else{
		Column->Title->SortMarker=smNoneEh;
		}
	FIBDataSetClients->Open();
}
//---------------------------------------------------------------------------
void __fastcall TFormClients::ButtonClientInsertClick(TObject *Sender)
{
	if(EditNAME->Text.Length() && EditPHONE->Text.Length()){
		if(FIBDataSetClients->Active)FIBDataSetClients->Close();
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		FIBStoredProc_CLIENT_INSERT->ParamByName("VI_NAME")->AsString=EditNAME->Text;
		FIBStoredProc_CLIENT_INSERT->ParamByName("VI_INFO")->AsString=EditINFO->Text;
		FIBStoredProc_CLIENT_INSERT->ParamByName("VI_ADRESS")->AsString=EditADRESS->Text;
		FIBStoredProc_CLIENT_INSERT->ParamByName("VI_PHONE")->AsString=EditPHONE->Text;
		try{
			FIBStoredProc_CLIENT_INSERT->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("Ошибка при добавлении в базу клиентов!", mtError, TMsgDlgButtons() << mbOK, 0);
			}	
		FormShow(this);					
		}			
	else{	
		MessageDlg("Введите пожалуйста НАИМЕНОВАНИЕ и ТЕЛЕФОН", mtError, TMsgDlgButtons() << mbOK, 0);
		}

}
//---------------------------------------------------------------------------

void __fastcall TFormClients::EditKeyUp(TObject *Sender, WORD &Key,
		TShiftState Shift)
{
	if(Key == VK_ESCAPE){
		ButtonClearClick(this);
		}
	else if(Key == VK_RETURN){
		if (FIBDataSetClients->RecordCount==1){
			FormMain->EditDiskont->Text=FIBDataSetClients->FieldValues["UNIQC"];
			FormMain->EditDiskontChange(this);
			Close();
			}
		else{
			MessageDlg("Укажите точный код клиента!", mtError, TMsgDlgButtons() << mbOK, 0);
			}
		}
	else if(Key == VK_INSERT){
		TLocateOptions Opts;
		Opts.Clear();
		Opts << loPartialKey;
		if(!FIBDataSetClients->Locate("UNIQC",Variant(EditUNIQC->Text),Opts)){
			EditNAME->Text="";
			EditINFO->Text="";
			EditADRESS->Text="";
			EditPHONE->Text="";
			}
		Opts.Clear();
		}
	else {
		if(FIBDataSetClients->Active)FIBDataSetClients->Close();
		FIBDataSetClients->SQLs->SelectSQL->Clear();
		FIBDataSetClients->SQLs->SelectSQL->Add("SELECT UNIQC, CLT_NAME, CLT_INFO, CLT_ADRESS, CLT_TYPE, CLT_PHONE, CLT_COUNTER, CLT_DISCOUNT FROM CLIENTS where uniqc > 0");

		if(EditUNIQC->Tag==1) FIBDataSetClients->SQLs->SelectSQL->Add("AND Upper(UNIQC) like \'"+EditUNIQC->Text.UpperCase()+"%\'");
		if(EditNAME->Tag==1) FIBDataSetClients->SQLs->SelectSQL->Add("AND Upper(CLT_NAME) like \'"+EditNAME->Text.UpperCase()+"%\'");
		if(EditADRESS->Tag==1) FIBDataSetClients->SQLs->SelectSQL->Add("AND Upper(CLT_ADRESS) like \'"+EditADRESS->Text.UpperCase()+"%\'");
		if(EditINFO->Tag==1) FIBDataSetClients->SQLs->SelectSQL->Add("AND Upper(CLT_INFO) like \'"+EditINFO->Text.UpperCase()+"%\'");
		if(EditPHONE->Tag==1) FIBDataSetClients->SQLs->SelectSQL->Add("AND Upper(CLT_PHONE) like \'"+EditPHONE->Text.UpperCase()+"%\'");

		for(int n=0;n<DBGridEhClients->Columns->Count;n++){

			if (DBGridEhClients->Columns->Items[n]->Title->SortMarker==smDownEh)
				FIBDataSetClients->SQLs->SelectSQL->Add("order by "+DBGridEhClients->Columns->Items[n]->FieldName);
			if (DBGridEhClients->Columns->Items[n]->Title->SortMarker==smUpEh)
				FIBDataSetClients->SQLs->SelectSQL->Add("order by "+DBGridEhClients->Columns->Items[n]->FieldName+" desc");

			}
		FIBDataSetClients->Open();


		}
}
//---------------------------------------------------------------------------
void __fastcall TFormClients::ButtonZakazClick(TObject *Sender)
{
		FormMain->EditDiskont->Text=FIBDataSetClients->FieldValues["UNIQC"];
		FormMain->EditDiskont->Tag=FIBDataSetClients->FieldValues["UNIQC"];
		FormMain->EditDiskontChange(this);
		Close();
}
//---------------------------------------------------------------------------
void __fastcall TFormClients::ButtonCloseClick(TObject *Sender)
{
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TFormClients::EditEnter(TObject *Sender)
{
	((TControl *)Sender)->Tag=1;
}
//---------------------------------------------------------------------------
void __fastcall TFormClients::EditExit(TObject *Sender)
{
	((TControl *)Sender)->Tag=0;	
}
//---------------------------------------------------------------------------
void __fastcall TFormClients::ButtonClearClick(TObject *Sender)
{
	EditUNIQC->Text="";
	EditNAME->Text="";
	EditINFO->Text="";
	EditADRESS->Text="";
	EditPHONE->Text="";
}
//---------------------------------------------------------------------------
void __fastcall TFormClients::ButtonDelayClick(TObject *Sender)
{
	FormMain->EditDiskont->Text=FIBDataSetClients->FieldValues["UNIQC"];
	FormMain->EditDiskontChange(Sender);
	FormMain->ButtonDelayClick(Sender);
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TFormClients::DBGridEhClientsDblClick(TObject *Sender)
{
	if(FIBDataSetCltDetail->Active) FIBDataSetCltDetail->Close();
	FIBDataSetCltDetail->ParamByName("VI_UNIQC")->AsInteger=FIBDataSetClients->FieldValues["UNIQC"];
	FIBDataSetCltDetail->Open();

	double n,m,l,k;
	if(FIBDataSetClients->FieldValues["CLT_COUNTER"].Type() == varInteger)
		n = FIBDataSetClients->FieldValues["CLT_COUNTER"]; // счетчик какая поездка халявная
	else n=0;
	if(FIBDataSetClients->FieldValues["CLT_DISCOUNT"].Type() == varInteger)
		k = FIBDataSetClients->FieldValues["CLT_DISCOUNT"]; // сколько халявных поездок
	else k=0;

	ListBoxClientsInfo->Items->Clear();
	if(DM->FIBDataSetCliensOrders->Active)DM->FIBDataSetCliensOrders->Close();
	DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Clear();
	DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Add("Select count(uniqo) count_orders from orders, s_ord_type");
	DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Add("where key_ord_type=cod_ord_type and key_client="+FIBDataSetClients->FieldValues["UNIQC"]);
	DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Add("and ord_state in (1,3) and ord_type in (1,3)");
	DM->FIBDataSetCliensOrders->Open();
	m=DM->FIBDataSetCliensOrders->FieldValues["count_orders"]; //наезжано за баблосы
	if(DM->FIBDataSetCliensOrders->Active)DM->FIBDataSetCliensOrders->Close();
	DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Clear();
	DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Add("Select count(uniqo) count_orders from orders");
	DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Add("where key_ord_type=20 and key_client="+FIBDataSetClients->FieldValues["UNIQC"]);
	DM->FIBDataSetCliensOrders->SQLs->SelectSQL->Add("and ord_state in (1,3) ");
	DM->FIBDataSetCliensOrders->Open();
	l=DM->FIBDataSetCliensOrders->FieldValues["count_orders"]; // использовано халявы
	if(DM->FIBDataSetCliensOrders->Active)DM->FIBDataSetCliensOrders->Close();
	ListBoxClientsInfo->Items->Add("Заказов всего: "+IntToStr((int)m)+" / "+IntToStr((int)l));
		if (n>0){
			if ((m/(n-1)-l+k)>0)
				ListBoxClientsInfo->Items->Add("Накоплено: "+IntToStr((int)(m/(n-1)-l+k)));
			else
				ListBoxClientsInfo->Items->Add("Накопленых нет");
			if(m>=(n-1)*(1+l-k))
				ListBoxClientsInfo->Items->Add("Есть халява");
			else
				ListBoxClientsInfo->Items->Add("До администрации: "+IntToStr((int)( (n-1)*(1+l-k)-m )));
			}
		else{
			if ((k-l)>0)
				ListBoxClientsInfo->Items->Add("Халявных: "+IntToStr((int)(k-l)));
			else
				ListBoxClientsInfo->Items->Add("Халявы нет");
			}


}
//---------------------------------------------------------------------------


void __fastcall TFormClients::ButtonOrdChangeClick(TObject *Sender)
{
		FormOrder->EditDiskont->Text=FIBDataSetClients->FieldValues["UNIQC"];
		Close();
}
//---------------------------------------------------------------------------





void __fastcall TFormClients::FIBDataSetClientsAfterOpen(TDataSet *DataSet)
{
//	if(DataSet->RecordCount==1) DBGridEhClientsDblClick(this);
}
//---------------------------------------------------------------------------

void __fastcall TFormClients::DBGridEhClientsKeyPress(TObject *Sender, char &Key)
{
	if(Key==VK_RETURN && FIBDataSetClients->State==dsEdit)
		FIBDataSetClients->Post();
}
//---------------------------------------------------------------------------

