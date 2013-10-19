//---------------------------------------------------------------------------

#ifndef UnitOrderH
#define UnitOrderH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
#include <ComCtrls.hpp>
#include "FIBQuery.hpp"
#include "pFIBQuery.hpp"
//---------------------------------------------------------------------------
class TFormOrder : public TForm
{
__published:	// IDE-managed Components
	TBitBtn *BitBtnOK;
	TEdit *EditCost;
	TLabel *Label1;
	TBitBtn *BitBtnCancel;
	TMonthCalendar *Calendar;
	TLabel *LabelRepNo;
	TpFIBQuery *FIBQuerySetRep;
	TLabel *LabelField;
	void __fastcall BitBtnOKClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFormOrder(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormOrder *FormOrder;
//---------------------------------------------------------------------------
#endif
