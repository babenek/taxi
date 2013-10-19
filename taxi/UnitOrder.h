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
#include "FIBDataSet.hpp"
#include "pFIBDataSet.hpp"
#include <Db.hpp>
#include <Mask.hpp>
//#include <NMMSG.hpp>
//#include <Psock.hpp>
#include "FIBQuery.hpp"
#include "pFIBQuery.hpp"
#include "pFIBStoredProc.hpp"
#include <DB.hpp>
//---------------------------------------------------------------------------
class TFormOrder : public TForm
{
__published:	// IDE-managed Components
	TEdit *EditDistance;
	TEdit *EditCost;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TRadioGroup *RadioGroupLocType;
	TLabel *LabelTheme;
	TEdit *EditDeparture;
	TEdit *EditDestination;
	TLabel *LabelDestination;
	TLabel *LabelDeparture;
	TEdit *EditHour;
	TEdit *EditMinute;
	TpFIBDataSet *FIBDataSetOrdEdit;
	TEdit *EditDiskont;
	TEdit *EditPhone;
	TLabel *Label7;
	TLabel *Label8;
	TpFIBStoredProc *FIBStoredProc_ORDER_UPDATE;
	TpFIBDataSet *FIBDataSetSOrdType;
	TComboBox *ComboBoxOrdType;
	TComboBox *ComboBoxLocation;
	TpFIBDataSet *FIBDataSetSLocation;
	TLabel *Label4;
	TSpeedButton *ButtonOrdSriw;
	TSpeedButton *ButtonOrdCancel;
	TSpeedButton *ButtonFalse;
	TSpeedButton *ButtonClients;
	TPanel *PanelBottom;
	TSpeedButton *ButtonChange;
	TSpeedButton *ButtonOrderEnd;
	TSpeedButton *ButtonRotate;
	TSpeedButton *ButtonExit;
	void __fastcall ButtonOrderChangeClick(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall RadioGroupLocTypeClick(TObject *Sender);
	void __fastcall ButtonOrderEndClick(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall ButtonExitClick(TObject *Sender);
	void __fastcall ButtonRotateClick(TObject *Sender);
   void __fastcall ButtonClientsClick(TObject *Sender);
	void __fastcall FormHide(TObject *Sender);
private:	// User declarations
	int *CodOrdType;
	int NumOrdType;
	int *CodLocation;
	int NumLocation;
	void __fastcall OrdDelay(void);
public:		// User declarations
	__fastcall TFormOrder(TComponent* Owner);
	short UserID;
	short UserType;
	int UniqO;
};
//---------------------------------------------------------------------------
extern PACKAGE TFormOrder *FormOrder;
//---------------------------------------------------------------------------
#endif
