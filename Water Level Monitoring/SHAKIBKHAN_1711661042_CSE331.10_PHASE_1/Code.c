// LCD module connections
sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;
// End LCD module connections

char txt1[] = "Project";
char txt2[] = "Developed By....";
char txt3[] = "GROUP 08";
char txt4[] = "---------------";

char mtr1[] = "Motor ";
char mtr2[] = "OFF";
char mtr3[] = "ON";

char wtr1[] = "Level: ";
char wtr2[] = "Very Low";
char wtr3[] = "Low";
char wtr4[] = "Medium";
char wtr5[] = "High";
char wtr6[] = "Full";



void main()
{

  int i = 0;
  int c = 16;
  int b = 0;
  CMCON = 0x07;
  ADCON1 = 0x06;
  TRISA = 0x0F;          // set direction to be input
  PORTA = 0x00;
  PORTD = 0x00;
  PORTC = 0x00;
  TRISB = 0x00;          //  set direction to be output
  TRISC = 0x00;          // set direction to be output
  TRISD = 0x80;          // set direction to be output

  PORTD.F2 = 1;
  PORTD.F7 = 1;

  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,1,txt1);                 // Write text in first row
  Lcd_Out(2,1,txt2);                 // Write text in second row
  Delay_ms(500);
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Out(1,1,txt3);                 // Write text in first row
  Lcd_Out(2,1,txt4);                 // Write text in second row
  Delay_ms(500);

// Moving text
for(i=0; i<15; i++)
{ // Move text to the right 16 times
  Lcd_Cmd(_LCD_SHIFT_RIGHT);
  Delay_ms(125);
}
i=0;

do
{
   Lcd_Cmd(_LCD_CLEAR);
   Lcd_Out(1,1,wtr1);
   Lcd_Out(2,1,mtr1);
   if(c>0)
   {
      PORTD.F2 = 1;
      c--;
   }
   else
      PORTD.F2 = 0;

   if(b>0)
   {
       PORTD.F0 = 1;
       Delay_ms(125);
       PORTD.F0 = 0;
       b--;
   }

   if(PORTD.F7 == 0)
     c = 16;

   if(PORTA == 0x0F)
   {
       PORTD.F1 = 1;
       Lcd_Out(1,8,wtr2);
       Lcd_Out(2,7,mtr3);
       PORTC = 1;
       if(i == 0)
       {
          c = 16;
          b = 3;
       }
       i=1;
   }
   else if(PORTA == 0x0E)
   {
       Lcd_Out(1,8,wtr3);
       if(i == 1)
          Lcd_Out(2,7,mtr3);
       else
          Lcd_Out(2,7,mtr2);
       PORTC = 3;
   }
   else if(PORTA == 0x0C)
   {
       Lcd_Out(1,8,wtr4);
       if(i == 1)
          Lcd_Out(2,7,mtr3);
       else
          Lcd_Out(2,7,mtr2);
       PORTC = 7;
   }
   else if(PORTA == 0x08)
   {
       Lcd_Out(1,8,wtr5);
       if(i == 1)
          Lcd_Out(2,7,mtr3);
       else
          Lcd_Out(2,7,mtr2);
          PORTC = 15;
   }

   else if(PORTA == 0x00)
   {
       Lcd_Out(1,8,wtr6);
       Lcd_Out(2,7,mtr2);
       PORTD.F1 = 0;
       if(i == 1)
       {
         c = 16;
         b = 3;
       }
       i=0;
       PORTC = 31;
   }
   else
       PORTA = 0x0F;
   Delay_ms(125);


}while(1);            // Endless loop
}