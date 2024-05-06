#ifndef _meassage_H_
#define _meassage_H_

#include "vos.h"

#define MAX_STRING_LEN	255

extern VOS_HANDLE hUART;

void message(char *str);
void number(unsigned char val);

#endif /* _meassage_H_ */
