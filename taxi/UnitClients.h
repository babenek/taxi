//---------------------------------------------------------------------------

#ifndef UnitClientsH
#define UnitClientsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "DBGridEh.hpp"
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include "FIBDataSet.hpp"
#include "pFIBDataSet.hpp"
#include <Db.hpp>
#include "FIBQuery.hpp"
#include "pFIBQuery.hpp"
#include "pFIBStoredProc.hpp"
#include <DB.hpp>
#include "GridsEh.hpp"
//---------------------------------------------------------------------------
class TFormClients : public TForm
{
__published:	// IDE-managed Components
	TpFIBDataSet *FIBDataSetClients;
	TDataSource *DataSourceClients;
	TGroupBox *GroupBox1;
	TEdit *EditNAME;
	TEdit *EditUNIQC;
	TEdit *EditPHONE;
	TSpeedButton *ButtonZakaz;
	TSpeedButton *ButtonDelay;
	TSpeedButton *ButtonClose;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TEdit *EditADRESS;
	TLabel *Label4;
	TSpeedButton *ButtonClientInsert;
	TEdit *EditINFO;
	TLabel *Label5;
	TpFIBStoredProc *FIBStoredProc_CLIENT_INSERT;
	TDBGridEh *DBGridEhClients;
	TSpeedButton *ButtonClear;
	TGroupBox *GroupBox2;
	TDBGridEh *DBGridEhCltDetail;
	TpFIBDataSet *FIBDataSetCltDetail;
	TDataSource *DataSourceCltDetail;
	TSplitter *Splitter1;
	TSpeedButton *ButtonOrdChange;
	TListBox *ListBoxClientsInfo;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall FormHide(TObject *Sender);
	void __fastcall DBGridEhClientsTitleBtnClick(TObject *Sender, int ACol,
          TColumnEh *Column);
	void __fastcall ButtonClientInsertClick(TObject *Sender);
	void __fastcall EditKeyUp(TObject *Sender, WORD &Key,
          TShiftState Shift);
	void __fastcall ButtonZakazClick(TObject *Sender);
	void __fastcall ButtonCloseClick(TObject *Sender);
	void __fastcall EditEnter(TObject *Sender);
	void __fastcall EditExit(TObject *Sender);
	void __fastcall ButtonClearClick(TObject *Sender);
	void __fastcall ButtonDelayClick(TObject *Sender);
	void __fastcall DBGridEhClientsDblClick(TObject *Sender);
	void __fastcall ButtonOrdChangeClick(TObject *Sender);
	void __fastcall FIBDataSetClientsAfterOpen(TDataSet *DataSet);
	void __fastcall DBGridEhClientsKeyPress(TObject *Sender, char &Key);
private:	// User declarations
public:		// User declarations
	__fastcall TFormClients(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormClients *FormClients;
//---------------------------------------------------------------------------
#endif
