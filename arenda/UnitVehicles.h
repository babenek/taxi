//$$---- Form HDR ----
//---------------------------------------------------------------------------

#ifndef UnitVehiclesH
#define UnitVehiclesH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DBGridEh.hpp"
#include "GridsEh.hpp"
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <DBCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Mask.hpp>
#include "DBCtrlsEh.hpp"
#include "DBLookupEh.hpp"
//---------------------------------------------------------------------------
class TFormVehicles : public TForm
{
__published:	// IDE-managed Components
	TGroupBox *GroupBox6;
	TDBGridEh *DBGridEh1;
	TPanel *Panel1;
	TLabel *Label1;
	TLabel *Label5;
	TLabel *Label6;
	TDBText *DBText2;
	TSpeedButton *SpeedButton1;
	TGroupBox *GroupBox1;
	TSpeedButton *ButtonSetExchange;
	TDBText *DBText1;
	TDBText *DBText3;
	TLabel *Label4;
	TDBEdit *DBEdit5;
	TGroupBox *GroupBox3;
	TLabel *LabelCurrency;
	TLabel *Label15;
	TEdit *EditCost;
	TGroupBox *GroupBox2;
	TLabel *Label11;
	TLabel *Label12;
	TLabel *Label10;
	TLabel *Label13;
	TDateTimePicker *DateTimePickerStart;
	TDateTimePicker *DateTimePickerStop;
	TEdit *EditDuration;
	TGroupBox *GroupBox4;
	TLabel *LabelRent;
	TLabel *Label2;
	TEdit *EditRental;
	TEdit *Edit_KEY_THEME;
	TEdit *Edit_MODEL;
	TEdit *Edit_NUMBER;
	TEdit *Edit_INFO;
	TLabel *LabelInfo;
	TSpeedButton *SpeedButtonApply;
	TSpeedButton *ButtonDelete;
	void __fastcall ExchangeSet(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
	void __fastcall ButtonPostClick(TObject *Sender);
	void __fastcall DateTimePickerStartChange(TObject *Sender);
	void __fastcall EditCostChange(TObject *Sender);
	void __fastcall EditDurationChange(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall SpeedButtonApplyClick(TObject *Sender);
	void __fastcall ButtonDeleteClick(TObject *Sender);
private:	// User declarations

public:		// User declarations
	__fastcall TFormVehicles(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormVehicles *FormVehicles;
//---------------------------------------------------------------------------
#endif
