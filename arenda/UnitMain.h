//$$---- Form HDR ----
//---------------------------------------------------------------------------

#ifndef UnitMainH
#define UnitMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DBCtrlsEh.hpp"
#include "DBGridEh.hpp"
#include "DBLookupEh.hpp"
#include "GridsEh.hpp"
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Mask.hpp>
#include <Sockets.hpp>
#include <DBCtrls.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:	// IDE-managed Components
	TTcpClient *TcpClient1;
	TPanel *Panel4;
	TGroupBox *GroupBox2;
	TDBGridEh *DBGridEh2;
	TGroupBox *GroupBox1;
	TDBGridEh *DBGridEhSmena;
	TPanel *Panel1;
	TCheckBox *CheckBoxProtect;
	TCheckBox *CheckBoxOneSmenaOnly;
	TCheckBox *CheckBoxOneVehiclesOnly;
	TPanel *Panel3;
	TGroupBox *GroupBoxZakazEdit;
	TLabel *Label6;
	TLabel *Label1;
	TLabel *Label4;
	TLabel *Label5;
	TDBText *DBText2;
	TDBText *DBText3;
	TDBText *DBText4;
	TDBText *DBText5;
	TDBGridEh *DBGridEh1;
	TSplitter *Splitter1;
	TLabel *Label2;
	TDBText *DBText6;
	TLabel *Label3;
	TDBText *DBText7;
	TGroupBox *GroupBox3;
	TEdit *EditMoney;
	TSpeedButton *ButtonAccountCharge;
	TSpeedButton *ButtonPay;
	TEdit *EditArnInfo;
	TSpeedButton *SpeedButton2;
	TCheckBox *CheckBoxArenda;
	TSplitter *Splitter2;
	TSpeedButton *ButtonRollback;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall CheckBoxProtectClick(TObject *Sender);
	void __fastcall CheckBoxOneOnlyClick(TObject *Sender);
	void __fastcall SpeedButton2Click(TObject *Sender);
	void __fastcall ButtonAccountChargeClick(TObject *Sender);
	void __fastcall ButtonPayClick(TObject *Sender);
	void __fastcall ButtonRollbackClick(TObject *Sender);
	void __fastcall EditMoneyKeyPress(TObject *Sender, char &Key);
private:	// User declarations
	bool MainHost;
	AnsiString HostName;
	AnsiString PrimaryHost;
	AnsiString SecondaryHost;
	AnsiString DBTaxiPath;
public:		// User declarations
	__fastcall TFormMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormMain *FormMain;
//---------------------------------------------------------------------------
#endif
