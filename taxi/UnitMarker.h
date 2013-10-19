//---------------------------------------------------------------------------

#ifndef UnitMarkerH
#define UnitMarkerH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <Mask.hpp>
//---------------------------------------------------------------------------
class TFormMarker : public TForm
{
__published:	// IDE-managed Components
	TMaskEdit *MaskEditMarker;
	TBitBtn *BitBtn1;
	TBitBtn *BitBtn2;
	void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFormMarker(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormMarker *FormMarker;
//---------------------------------------------------------------------------
#endif
