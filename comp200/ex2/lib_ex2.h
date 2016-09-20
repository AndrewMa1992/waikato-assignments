/**
 * Writes a character to a serial port.
 * Note: this function blocks.
 *
 * Parameters:
 *  c		The character to send
 *  
 **/
void putc(char c);

/**
 * Writes a character to a serial port.
 * Note: this function blocks.
 *
 * Returns:
 *  		The character read from the serial port
 *  
 **/
int getc();

/**
 * Writes a string to a serial port.
 * Note: this function blocks.
 *
 * Parameters:
 *  s		A pointer to the string to send
 *
 **/
void putstr(const char *s);

/**
 * Writes a number to a serial port.
 * Note: this function blocks.
 *
 * Parameters:
 *  n		The number to send
 *
 **/
void putnumber(int n);

/**
 * Reads a line from a serial port.
 * Note: this function blocks.
 *
 * Parameters:
 *  s		A pointer to an area of memory to read the string into
 *  len		The maximum number of characters to read
 * 
 * Returns:
 *			The number of characters that were read.
 *
 **/
int getstr(char *s, int len);

/**
 * Reads the value on the switches.
 *
 * Returns:
 *  		The current value of the switches.
 **/
int readswitches();
	
/**
 * Writes a number to the seven-segment displays, in decimal.
 *
 * Parameters:
 *  name	The number to write to the displays
 **/
void writessd(int n);

/**
 * Crude delay loop.
 **/
void delay();
