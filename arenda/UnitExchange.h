//$$---- Form HDR ----
//---------------------------------------------------------------------------

#ifndef UnitExchangeH
#define UnitExchangeH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TFormExchange : public TForm
{
__published:	// IDE-managed Components
	TEdit *EditExchange;
	TSpeedButton *ButtonExchangeSet;
	void __fastcall ButtonExchangeSetClick(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall EditExchangeKeyPress(TObject *Sender, char &Key);
private:	// User declarations
public:		// User declarations
	__fastcall TFormExchange(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormExchange *FormExchange;
//---------------------------------------------------------------------------
#endif
