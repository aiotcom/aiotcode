#ifndef __Noncontact_Temp_H__
#define __Noncontact_Temp_H__

#include <ioCC2530.h>
#include "delay.h"

#define ACK	    0
#define	NACK        1

//MLX90614 constants
#define SA		0x00	// Slave address
#define DEFAULT_SA	0x5B	// Default Slave address
#define RAM_Access	0x20	// RAM access command
#define EEPROM_Access	0x10	// EEPROM access command
#define RAM_To		0x07	// To address in the ram

#define mlx_SCL_PIN     P0_0
#define mlx_SDA_PIN     P0_1

#define mlx_SCL_LOW() 	mlx_SCL_PIN = 0;  // define   SCL
#define mlx_SCL_HIGH() 	mlx_SCL_PIN = 1;  // define   SCL

#define mlx_SDA_LOW() 	mlx_SDA_PIN = 0;  // define   SDA
#define mlx_SDA_HIGH() 	mlx_SDA_PIN = 1;  // define   SDA

#define mlx_SCL_State() mlx_SCL_PIN
#define mlx_SDA_State() mlx_SDA_PIN

void STOP_bit(void);
void START_bit(void);
void mlx_SDA_IN(void);
void mlx_SDA_OUT(void);
void SendRequest(void);
void MLX90615_init(void); 
void mlx_gpio_init(void);
void mlx_SCL_INPUT(void);
void mlx_SCL_OUTPUT(void);
unsigned char Receive_bit(void);
float CalcTemp(unsigned int value);
void send_bit(unsigned char bit_out);
void DummyCommand(unsigned char byte);
unsigned char RX_byte(unsigned char ack_nack);
unsigned char TX_byte(unsigned char Tx_buffer);
unsigned char PEC_calculation(unsigned char pec[]);
unsigned int MemRead(unsigned char SlaveAddress,unsigned char command);

#endif

