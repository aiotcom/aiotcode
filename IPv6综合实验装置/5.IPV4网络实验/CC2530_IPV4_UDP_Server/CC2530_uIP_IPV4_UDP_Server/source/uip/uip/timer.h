
#ifndef __TIMER_H__
#define __TIMER_H__

#include "clock.h"

/**
 * A timer.
 *
 * This structure is used for declaring a timer. The timer must be set
 * with timer_set() before it can be used.
 *
 * \hideinitializer
 */
struct timer {
  clock_time_t start;
  clock_time_t interval;
};

void timer_set(struct timer *t, clock_time_t interval);
void timer_reset(struct timer *t);
void timer_restart(struct timer *t);
int timer_expired(struct timer *t);

#endif /* __TIMER_H__ */

/** @} */
