

#include "clock-arch.h"


unsigned int uIP_RunTime;//__IO == volatile
/*---------------------------------------------------------------------------*/
clock_time_t clock_time(void)
{
	return uIP_RunTime;
}
/*---------------------------------------------------------------------------*/
