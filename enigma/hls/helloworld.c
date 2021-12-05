
#include "platform.h"
#include "xenigma.h"
#include "xil_printf.h"

int main()
{
    print("\n\rEnigma\n\r>");

    XEnigma enigma =
    {
        .Control_BaseAddress = XPAR_ENIGMA_0_S_AXI_CONTROL_BASEADDR,
        .IsReady = 0
    };

    init_platform();

    XEnigma_Config* const config = XEnigma_LookupConfig(XPAR_ENIGMA_0_DEVICE_ID);
    const int ret = XEnigma_CfgInitialize( &enigma, config);
    Xil_AssertNonvoid( ret == XST_SUCCESS );

    XEnigma_DisableAutoRestart(&enigma);

    while(1)
    {
        const char c = inbyte();
        if(XEnigma_IsIdle(&enigma))
        {
            XEnigma_Set_input_r(&enigma, c);
            XEnigma_Start(&enigma);

            while(!XEnigma_IsDone(&enigma));

            const uint8_t val = XEnigma_Get_output_r(&enigma);
            outbyte(val);
        }
    }

    cleanup_platform();
    return 0;
}
