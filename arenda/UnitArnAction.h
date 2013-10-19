//$$---- Form HDR ----
//---------------------------------------------------------------------------

#ifndef UnitArnActionH
#define UnitArnActionH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DBCtrlsEh.hpp"
#include "DBGridEh.hpp"
#include "DBLookupEh.hpp"
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <Mask.hpp>
#include <DBCtrls.hpp>
//---------------------------------------------------------------------------
class TFormArnAction : public TForm
{
__published:	// IDE-managed Components
	TGroupBox *GroupBox7;
	TSpeedButton *SpeedButton4;
	TLabel *Label3;
	TLabel *Label7;
	TLabel *Label8;
	TLabel *Label9;
	TEdit *EditMoney;
	TDBLookupComboboxEh *DBLookupComboboxEh_SMN_ACTION;
	TDateTimePicker *DateTimePickerArendaDate;
	TEdit *EditArnInfo;
	TLabel *Label6;
	TDBText *DBText3;
	TDBText *DBText2;
	TLabel *Label1;
	TLabel *Label5;
	TDBText *DBText5;
	TLabel *Label2;
	TDBText *DBText7;
	TDBText *DBText6;
	TLabel *Label4;
	TLabel *Label10;
	void __fastcall SpeedButton4Click(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFormArnAction(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormArnAction *FormArnAction;
//---------------------------------------------------------------------------
#endif
