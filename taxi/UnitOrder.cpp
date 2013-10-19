//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UnitOrder.h"
#include "UnitMain.h"
#include "UnitClients.h"
#include "UnitData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "FIBDataSet"
#pragma link "pFIBDataSet"
#pragma link "FIBQuery"
#pragma link "pFIBQuery"
#pragma link "pFIBStoredProc"
#pragma resource "*.dfm"
TFormOrder *FormOrder;
//---------------------------------------------------------------------------
__fastcall TFormOrder::TFormOrder(TComponent* Owner) : TForm(Owner){}
//---------------------------------------------------------------------------
void __fastcall TFormOrder::FormShow(TObject *Sender)
{
	int n;
	AnsiString tmpstr;
//----------------------------------------------------------------------------------------------------------------------
   if(ComboBoxOrdType->Items->Count==0){
      ComboBoxOrdType->Items->Clear();
		FIBDataSetSOrdType->Open();
		NumOrdType=FIBDataSetSOrdType->RecordCount;
		CodOrdType=new int [NumOrdType];
		n=0;
		FIBDataSetSOrdType->First();
		while (!FIBDataSetSOrdType->Eof){
			*(CodOrdType+n)=FIBDataSetSOrdType->FieldValues["COD_ORD_TYPE"];
			if(FIBDataSetSOrdType->FieldValues["NAME_ORD_TYPE"].Type() == varString){
				tmpstr=AnsiString(FIBDataSetSOrdType->FieldValues["NAME_ORD_TYPE"]);
				ComboBoxOrdType->Items->Add(tmpstr+" ("+IntToStr(*(CodOrdType+n))+")");
				}
			else{
				ComboBoxOrdType->Items->Add("? ("+IntToStr(*(CodOrdType+n))+")");
				}
			n++;
			FIBDataSetSOrdType->Next();
			}
		ComboBoxOrdType->ItemIndex=0;
		FIBDataSetSOrdType->Close();
      }
//----------------------------------------------------------------------------------------------------------------------
   if(ComboBoxLocation->Items->Count==0){
      ComboBoxLocation->Items->Clear();
      FIBDataSetSLocation->Open();
      NumLocation=FIBDataSetSLocation->RecordCount;
      CodLocation=new int [NumLocation];
      n=0;
      FIBDataSetSLocation->First();
      while (!FIBDataSetSLocation->Eof){
         *(CodLocation+n)=FIBDataSetSLocation->FieldValues["COD_LOCATION"];
         if(FIBDataSetSLocation->FieldValues["NAME_LOCATION"].Type() == varString){
            tmpstr=AnsiString(FIBDataSetSLocation->FieldValues["NAME_LOCATION"]);
            ComboBoxLocation->Items->Add(tmpstr+" ("+IntToStr(*(CodLocation+n))+")");
            }
         else{
            ComboBoxLocation->Items->Add("? ("+IntToStr(*(CodLocation+n))+")");
            }
         n++;
         FIBDataSetSLocation->Next();
         }
      FIBDataSetSLocation->Close();
      }
//----------------------------------------------------------------------------------------------------------------------
	RadioGroupLocType->ItemIndex=0;
	FIBDataSetOrdEdit->ParamByName("VI_UNIQO")->AsInteger=UniqO;
	FIBDataSetOrdEdit->Open();

	if (FIBDataSetOrdEdit->FieldValues["KEY_LOCATION"].Type() == varInteger){
		for (n=0;n<NumLocation;n++){
			if (*(CodLocation+n) == FIBDataSetOrdEdit->FieldValues["KEY_LOCATION"]){
				ComboBoxLocation->ItemIndex=n;
				break;
				}
			}
		}

	if (FIBDataSetOrdEdit->FieldValues["KEY_THEME"].Type() == varInteger)
		LabelTheme->Caption=FIBDataSetOrdEdit->FieldValues["KEY_THEME"];
	else { LabelTheme->Caption=""; Close(); }

	if (FIBDataSetOrdEdit->FieldValues["ORD_DEPARTURE"].Type() == varString)
		EditDeparture->Text=FIBDataSetOrdEdit->FieldValues["ORD_DEPARTURE"];
	else EditDeparture->Text="";

	if (FIBDataSetOrdEdit->FieldValues["ORD_DESTINATION"].Type() == varString)
		EditDestination->Text=FIBDataSetOrdEdit->FieldValues["ORD_DESTINATION"];
	else EditDestination->Text="";

	if (FIBDataSetOrdEdit->FieldValues["ORD_DURATION"].Type() == varDate){
		EditHour->Text= TDateTime(FIBDataSetOrdEdit->FieldValues["ORD_DURATION"]).FormatString("h");
		EditMinute->Text= TDateTime(FIBDataSetOrdEdit->FieldValues["ORD_DURATION"]).FormatString("n");
		}
	else {EditHour->Text="";EditMinute->Text="";}

	if (FIBDataSetOrdEdit->FieldValues["ORD_DISTANCE"].Type() == varInteger)
		EditDistance->Text=IntToStr((int)FIBDataSetOrdEdit->FieldValues["ORD_DISTANCE"]);
	else EditDistance->Text="";

	if (FIBDataSetOrdEdit->FieldValues["ORD_COST"].Type() == varDouble)
		EditCost->Text=FloatToStrF((double)FIBDataSetOrdEdit->FieldValues["ORD_COST"],ffGeneral ,6,2);
	else EditCost->Text="";

	ComboBoxOrdType->ItemIndex=0;
	if (FIBDataSetOrdEdit->FieldValues["KEY_ORD_TYPE"].Type() == varInteger){
		for(n=0;n<NumOrdType;n++){
			if (*(CodOrdType+n)==(int)FIBDataSetOrdEdit->FieldValues["KEY_ORD_TYPE"]){
				ComboBoxOrdType->ItemIndex=n;
				break;
				}
			}
		}		

	if (FIBDataSetOrdEdit->FieldValues["KEY_CLIENT"].Type() == varInteger)
		EditDiskont->Text=FIBDataSetOrdEdit->FieldValues["KEY_CLIENT"];
	else EditDiskont->Text="";

	if (FIBDataSetOrdEdit->FieldValues["ORD_PHONE"].Type() == varString)
		EditPhone->Text=FIBDataSetOrdEdit->FieldValues["ORD_PHONE"];
	else EditPhone->Text="";

	FIBDataSetOrdEdit->Close();
}
//---------------------------------------------------------------------------

void __fastcall TFormOrder::ButtonOrderChangeClick(TObject *Sender)
{
	if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
	FIBStoredProc_ORDER_UPDATE->ParamByName("VI_UNIQO")->AsInteger=UniqO;

	if ( ((TControl *)Sender)->Tag == 0) // если на кнопках теги нули - тип заказа берется от типа кнопки
		FIBStoredProc_ORDER_UPDATE->ParamByName("VI_ORD_TYPE")->AsShort=*(CodOrdType+ComboBoxOrdType->ItemIndex);
	else
		FIBStoredProc_ORDER_UPDATE->ParamByName("VI_ORD_TYPE")->AsShort=((TControl *)Sender)->Tag;

	FIBStoredProc_ORDER_UPDATE->ParamByName("VI_DEPARTURE")->AsString=EditDeparture->Text;
	FIBStoredProc_ORDER_UPDATE->ParamByName("VI_DESTINATION")->AsString=EditDestination->Text;
	FIBStoredProc_ORDER_UPDATE->ParamByName("VI_PHONE")->AsString=EditPhone->Text;

	try{  FIBStoredProc_ORDER_UPDATE->ParamByName("VI_DURATION")->AsTime=EncodeTime( StrToInt(EditHour->Text),StrToInt(EditMinute->Text),0,0); }
	catch(...){ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_DURATION")->Clear(); }
	try{ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_DISTANCE")->AsInteger=StrToInt(EditDistance->Text); }
	catch(...){ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_DISTANCE")->Clear(); }
	try{ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_COST")->AsDouble=(double)EditCost->Text.ToDouble(); }
	catch(...){ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_COST")->Clear(); }
	try{ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_CLIENT")->AsInteger=StrToInt(EditDiskont->Text);}
	catch(...){ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_CLIENT")->Clear(); }

	FIBStoredProc_ORDER_UPDATE->ParamByName("VI_STATE")->AsShort=0;// order is online!
	try{
		FIBStoredProc_ORDER_UPDATE->ExecProc();
		DM->FIBTransactionUpdate->Commit();
		}
	catch(...){
		DM->FIBTransactionUpdate->Rollback();
		MessageDlg("Ошибка при замене!", mtError, TMsgDlgButtons() << mbOK, 0);
		return;
		}
//	if(CheckBoxOrdDelay->Checked) OrdDelay();// если хотят - кинем копию заказа в список
	Close();
}
//---------------------------------------------------------------------------

void __fastcall TFormOrder::FormActivate(TObject *Sender)
{
	RadioGroupLocType->ItemIndex=0;
	EditDeparture->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TFormOrder::RadioGroupLocTypeClick(TObject *Sender)
{
	ComboBoxLocation->Enabled= !(RadioGroupLocType->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TFormOrder::ButtonOrderEndClick(TObject *Sender)
{
	if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
	FIBStoredProc_ORDER_UPDATE->ParamByName("VI_UNIQO")->AsInteger=UniqO;
	if ( ((TControl *)Sender)->Tag == 0 ) // если на кнопках теги нули - тип заказа берется от типа кнопки
		FIBStoredProc_ORDER_UPDATE->ParamByName("VI_ORD_TYPE")->AsShort=*(CodOrdType+ComboBoxOrdType->ItemIndex);
	else
		FIBStoredProc_ORDER_UPDATE->ParamByName("VI_ORD_TYPE")->AsShort=((TControl *)Sender)->Tag;
	FIBStoredProc_ORDER_UPDATE->ParamByName("VI_DEPARTURE")->AsString=EditDeparture->Text;
	FIBStoredProc_ORDER_UPDATE->ParamByName("VI_DESTINATION")->AsString=EditDestination->Text;
	FIBStoredProc_ORDER_UPDATE->ParamByName("VI_SMN_STOP")->AsInteger=FormMain->CurrentSmena;
	FIBStoredProc_ORDER_UPDATE->ParamByName("VI_PHONE")->AsString=EditPhone->Text;

	try{ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_DURATION")->AsTime=EncodeTime( StrToInt(EditHour->Text),StrToInt(EditMinute->Text),0,0); }
	catch(...){ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_DURATION")->Clear(); }
	try{ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_DISTANCE")->AsInteger=StrToInt(EditDistance->Text); }
	catch(...){ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_DISTANCE")->Clear(); }
	try{ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_COST")->AsDouble=(double)EditCost->Text.ToDouble(); }
	catch(...){ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_COST")->Clear(); }
	try{ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_CLIENT")->AsInteger=StrToInt(EditDiskont->Text);}
	catch(...){ FIBStoredProc_ORDER_UPDATE->ParamByName("VI_CLIENT")->Clear(); }

	FIBStoredProc_ORDER_UPDATE->ParamByName("VI_STATE")->AsShort=1;// order is close!
	try{
		FIBStoredProc_ORDER_UPDATE->ExecProc();
		DM->FIBTransactionUpdate->Commit();
		}
	catch(...){
		DM->FIBTransactionUpdate->Rollback();
		MessageDlg("Ошибка при завершении!", mtError, TMsgDlgButtons() << mbOK, 0);
		return;
		}

//	int LocTypeAra[]={1,0}; // для типов локаций
	if (RadioGroupLocType->ItemIndex==1){
		ComboBoxLocation->Tag=1;
		FormMain->ReLocType(ComboBoxLocation);
		}
	else{
		ComboBoxLocation->Tag=*(CodLocation+ComboBoxLocation->ItemIndex);
		FormMain->ReLocation(ComboBoxLocation);
		}
	Close();
}
//---------------------------------------------------------------------------

void __fastcall TFormOrder::ButtonExitClick(TObject *Sender)
{
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TFormOrder::ButtonRotateClick(TObject *Sender)
{
	if( MessageDlg("Отменить заказ, и вернуть его в список?", mtConfirmation, TMsgDlgButtons()<<mbYes<<mbNo, 0) == mrYes ){
		OrdDelay();		
		ComboBoxOrdType->ItemIndex=0;
//ShowMessage(((TControl *)Sender)->Tag);
		ButtonOrderEndClick(Sender);
		}
}
//---------------------------------------------------------------------------

void __fastcall TFormOrder::OrdDelay(void)
{
		if (!DM->FIBTransactionUpdate->InTransaction) DM->FIBTransactionUpdate->StartTransaction();
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_LOCATIONS")->AsInteger=0;
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_THEME")->AsInteger=0;
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_STATE")->AsShort=4;// order is delay!
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_SMN_START")->AsInteger=FormMain->CurrentSmena;
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_DEPARTURE")->AsString=EditDeparture->Text;
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_DESTINATION")->AsString=EditDestination->Text;
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_TYPE")->AsShort=*(CodOrdType+ComboBoxOrdType->ItemIndex);
		DM->FIBStoredProc_ORDER_START->ParamByName("VI_PHONE")->AsString=EditPhone->Text; 	// !!!
		try{ DM->FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->AsInteger=StrToInt(EditDiskont->Text);}
		catch(...){ DM->FIBStoredProc_ORDER_START->ParamByName("VI_CLIENT")->Clear(); }
		try{
			DM->FIBStoredProc_ORDER_START->ExecProc();
			DM->FIBTransactionUpdate->Commit();
			}
		catch(...){
			DM->FIBTransactionUpdate->Rollback();
			MessageDlg("Заказ не копируется в список!", mtError, TMsgDlgButtons() << mbOK, 0);
			}                           }

void __fastcall TFormOrder::ButtonClientsClick(TObject *Sender)
{
	FormClients->ButtonOrdChange->Enabled=true;
	FormClients->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TFormOrder::FormHide(TObject *Sender)
{
	ComboBoxOrdType->Items->Clear();
	delete [] CodOrdType;
	ComboBoxLocation->Items->Clear();
	delete [] CodLocation;	
}
//---------------------------------------------------------------------------

