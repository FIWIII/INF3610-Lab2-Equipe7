#include "xhls_accel.h"

XHls_accel_Config XHls_accel_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,HLS-accel-1.0", /* compatible */
		0x43c00000 /* reg */
	},
	 {
		 NULL
	}
};