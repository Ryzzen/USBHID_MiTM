#include "message.h"

/*
** message
**
** Print a string in the terminal application.
**
** Parameters:	str - Message to be printed
** Returns:	void
** Comments:
*/
void message(char *str)
{

	int length = 0;
	char *tmp = str;

	while (tmp[length] && (length < MAX_STRING_LEN))
		length++;                           /*calculate string length*/

	vos_dev_write(hUART, (uint8 *) str, (uint16) length, NULL);
}
	
	/*
** number
**
** Print a character in the terminal application.
**
** Parameters:	val - Byte to be printed
** Returns:	void
** Comments:
*/
void number(unsigned char val)
{
	unsigned char nibble;

	nibble = (val >> 4) + '0';
	if (nibble > '9') nibble += ('A' - '9' - 1);

	vos_dev_write(hUART, &nibble, (uint16) 1, NULL);

	nibble = (val & 15) + '0';
	if (nibble > '9') nibble += ('A' - '9' - 1);

	vos_dev_write(hUART, &nibble, (uint16) 1, NULL);
}
