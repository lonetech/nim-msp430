import iomacros
# ============================================================================ 
# Copyright (c) 2012, Texas Instruments Incorporated                           
#  All rights reserved.                                                        
#                                                                              
#  Redistribution and use in source and binary forms, with or without          
#  modification, are permitted provided that the following conditions          
#  are met:                                                                    
#                                                                              
#  *  Redistributions of source code must retain the above copyright           
#     notice, this list of conditions and the following disclaimer.            
#                                                                              
#  *  Redistributions in binary form must reproduce the above copyright        
#     notice, this list of conditions and the following disclaimer in the      
#     documentation and/or other materials provided with the distribution.     
#                                                                              
#  *  Neither the name of Texas Instruments Incorporated nor the names of      
#     its contributors may be used to endorse or promote products derived      
#     from this software without specific prior written permission.            
#                                                                              
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
#  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,       
#  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR      
#  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR            
#  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,       
#  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,         
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; 
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,    
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR     
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,              
#  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                          
# ============================================================================ 
#*******************************************************************
#
# Standard register and bit definitions for the Texas Instruments
# MSP430 microcontroller.
#
# This file supports assembler and C development for
# MSP430F5510 devices.
#
# Texas Instruments, Version 1.4
#
# Rev. 1.0, Setup
# Rev. 1.1, Fixed Error in DMA Trigger Definitons
# Rev. 1.2, fixed SYSUNIV_BUSIFG definition
#           fixed wrong bit definition in PM5CTL0 (LOCKLPM5)
# Rev. 1.3, Changed access type of DMAxSZ registers to word only
# Rev. 1.4  Changed access type of TimerA/B registers to word only
#
#******************************************************************

when not(defined(MSP430F5510)): 
  const 
    MSP430F5510* = true
    MSP430_HEADER_VERSION* = 1064
    MSP430_TI_HEADERS* = true
  #***********************************************************
  # STANDARD BITS
  # Interrupt Vectors (offset from 0xFF80)
  #**********************************************************
  const 
    RTC_VECTOR* = (0x00000052) # 0xFFD2 RTC 
    PORT2_VECTOR* = (0x00000054) # 0xFFD4 Port 2 
    TIMER2_A1_VECTOR* = (0x00000056) # 0xFFD6 Timer0_A5 CC1-4, TA 
    TIMER2_A0_VECTOR* = (0x00000058) # 0xFFD8 Timer0_A5 CC0 
    USCI_B1_VECTOR* = (0x0000005A) # 0xFFDA USCI B1 Receive/Transmit 
    USCI_A1_VECTOR* = (0x0000005C) # 0xFFDC USCI A1 Receive/Transmit 
    PORT1_VECTOR* = (0x0000005E) # 0xFFDE Port 1 
    TIMER1_A1_VECTOR* = (0x00000060) # 0xFFE0 Timer1_A3 CC1-2, TA1 
    TIMER1_A0_VECTOR* = (0x00000062) # 0xFFE2 Timer1_A3 CC0 
    DMA_VECTOR* = (0x00000064) # 0xFFE4 DMA 
    USB_UBM_VECTOR* = (0x00000066) # 0xFFE6 USB Timer / cable event / USB reset 
    TIMER0_A1_VECTOR* = (0x00000068) # 0xFFE8 Timer0_A5 CC1-4, TA 
    TIMER0_A0_VECTOR* = (0x0000006A) # 0xFFEA Timer0_A5 CC0 
    ADC10_VECTOR* = (0x0000006C) # 0xFFEC ADC 
    USCI_B0_VECTOR* = (0x0000006E) # 0xFFEE USCI B0 Receive/Transmit 
    USCI_A0_VECTOR* = (0x00000070) # 0xFFF0 USCI A0 Receive/Transmit 
    WDT_VECTOR* = (0x00000072) # 0xFFF2 Watchdog Timer 
    TIMER0_B1_VECTOR* = (0x00000074) # 0xFFF4 Timer0_B7 CC1-6, TB 
    TIMER0_B0_VECTOR* = (0x00000076) # 0xFFF6 Timer0_B7 CC0 
    COMP_B_VECTOR* = (0x00000078) # 0xFFF8 Comparator B 
    UNMI_VECTOR* = (0x0000007A) # 0xFFFA User Non-maskable 
    SYSNMI_VECTOR* = (0x0000007C) # 0xFFFC System Non-maskable 
    RESET_VECTOR* = (0x0000007E) # 0xFFFE Reset [Highest Priority] 
  #***********************************************************
  # End of Modules
  #**********************************************************
  const 
    BIT0* = (0x00000001)
    BIT1* = (0x00000002)
    BIT2* = (0x00000004)
    BIT3* = (0x00000008)
    BIT4* = (0x00000010)
    BIT5* = (0x00000020)
    BIT6* = (0x00000040)
    BIT7* = (0x00000080)
    BIT8* = (0x00000100)
    BIT9* = (0x00000200)
    BITA* = (0x00000400)
    BITB* = (0x00000800)
    BITC* = (0x00001000)
    BITD* = (0x00002000)
    BITE* = (0x00004000)
    BITF* = (0x00008000)
  #***********************************************************
  # STATUS REGISTER BITS
  #**********************************************************
  const 
    C* = (0x00000001)
    Z* = (0x00000002)
    N* = (0x00000004)
    V* = (0x00000100)
    GIE* = (0x00000008)
    CPUOFF* = (0x00000010)
    OSCOFF* = (0x00000020)
    SCG0* = (0x00000040)
    SCG1* = (0x00000080)
  # Low Power Modes coded with Bits 4-7 in SR 
  when not(defined(STDC)): # Begin #defines for assembler 
    const 
      LPM0* = (CPUOFF)
      LPM1* = (SCG0 + CPUOFF)
      LPM2* = (SCG1 + CPUOFF)
      LPM3* = (SCG1 + SCG0 + CPUOFF)
      LPM4* = (SCG1 + SCG0 + OSCOFF + CPUOFF)
    # End #defines for assembler 
  else: 
    const 
      LPM0_bits* = (CPUOFF)
      LPM1_bits* = (SCG0 + CPUOFF)
      LPM2_bits* = (SCG1 + CPUOFF)
      LPM3_bits* = (SCG1 + SCG0 + CPUOFF)
      LPM4_bits* = (SCG1 + SCG0 + OSCOFF + CPUOFF)
    import 
      "in430"

    const 
      LPM0* = BIS_SR(LPM0_bits) # Enter Low Power Mode 0 
      LPM0_EXIT* = BIC_SR_IRQ(LPM0_bits) # Exit Low Power Mode 0 
      LPM1* = BIS_SR(LPM1_bits) # Enter Low Power Mode 1 
      LPM1_EXIT* = BIC_SR_IRQ(LPM1_bits) # Exit Low Power Mode 1 
      LPM2* = BIS_SR(LPM2_bits) # Enter Low Power Mode 2 
      LPM2_EXIT* = BIC_SR_IRQ(LPM2_bits) # Exit Low Power Mode 2 
      LPM3* = BIS_SR(LPM3_bits) # Enter Low Power Mode 3 
      LPM3_EXIT* = BIC_SR_IRQ(LPM3_bits) # Exit Low Power Mode 3 
      LPM4* = BIS_SR(LPM4_bits) # Enter Low Power Mode 4 
      LPM4_EXIT* = BIC_SR_IRQ(LPM4_bits) # Exit Low Power Mode 4 
  #***********************************************************
  # CPU
  #**********************************************************
  const 
    MSP430_HAS_MSP430XV2_CPU* = true # Definition to show that it has MSP430XV2 CPU 
  #***********************************************************
  # PERIPHERAL FILE MAP
  #**********************************************************
  #***********************************************************
  # ADC10_A
  #**********************************************************
  const 
    MSP430_HAS_ADC10_A* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_ADC10_A* = 0x00000740
    ADC10CTL0_ADDR* = 0x00000740
  sfrb(ADC10CTL0_L, ADC10CTL0_ADDR)
  sfrb(ADC10CTL0_H, ADC10CTL0_ADDR + 1)
  sfrw(ADC10CTL0, ADC10CTL0_ADDR)
  const 
    ADC10CTL1_ADDR* = 0x00000742
  sfrb(ADC10CTL1_L, ADC10CTL1_ADDR)
  sfrb(ADC10CTL1_H, ADC10CTL1_ADDR + 1)
  sfrw(ADC10CTL1, ADC10CTL1_ADDR)
  const 
    ADC10CTL2_ADDR* = 0x00000744
  sfrb(ADC10CTL2_L, ADC10CTL2_ADDR)
  sfrb(ADC10CTL2_H, ADC10CTL2_ADDR + 1)
  sfrw(ADC10CTL2, ADC10CTL2_ADDR)
  const 
    ADC10LO_ADDR* = 0x00000746
  sfrb(ADC10LO_L, ADC10LO_ADDR)
  sfrb(ADC10LO_H, ADC10LO_ADDR + 1)
  sfrw(ADC10LO, ADC10LO_ADDR)
  const 
    ADC10HI_ADDR* = 0x00000748
  sfrb(ADC10HI_L, ADC10HI_ADDR)
  sfrb(ADC10HI_H, ADC10HI_ADDR + 1)
  sfrw(ADC10HI, ADC10HI_ADDR)
  const 
    ADC10MCTL0_ADDR* = 0x0000074A
  sfrb(ADC10MCTL0_L, ADC10MCTL0_ADDR)
  sfrb(ADC10MCTL0_H, ADC10MCTL0_ADDR + 1)
  sfrw(ADC10MCTL0, ADC10MCTL0_ADDR)
  const 
    ADC10MEM0_ADDR* = 0x00000752
  sfrb(ADC10MEM0_L, ADC10MEM0_ADDR)
  sfrb(ADC10MEM0_H, ADC10MEM0_ADDR + 1)
  sfrw(ADC10MEM0, ADC10MEM0_ADDR)
  const 
    ADC10IE_ADDR* = 0x0000075A
  sfrb(ADC10IE_L, ADC10IE_ADDR)
  sfrb(ADC10IE_H, ADC10IE_ADDR + 1)
  sfrw(ADC10IE, ADC10IE_ADDR)
  const 
    ADC10IFG_ADDR* = 0x0000075C
  sfrb(ADC10IFG_L, ADC10IFG_ADDR)
  sfrb(ADC10IFG_H, ADC10IFG_ADDR + 1)
  sfrw(ADC10IFG, ADC10IFG_ADDR)
  const 
    ADC10IV_ADDR* = 0x0000075E
  sfrb(ADC10IV_L, ADC10IV_ADDR)
  sfrb(ADC10IV_H, ADC10IV_ADDR + 1)
  sfrw(ADC10IV, ADC10IV_ADDR)
  # ADC10CTL0 Control Bits 
  const 
    ADC10SC* = (0x00000001)   # ADC10 Start Conversion 
    ADC10ENC* = (0x00000002)  # ADC10 Enable Conversion 
    ADC10ON* = (0x00000010)   # ADC10 On/enable 
    ADC10MSC* = (0x00000080)  # ADC10 Multiple SampleConversion 
    ADC10SHT0* = (0x00000100) # ADC10 Sample Hold Select Bit: 0 
    ADC10SHT1* = (0x00000200) # ADC10 Sample Hold Select Bit: 1 
    ADC10SHT2* = (0x00000400) # ADC10 Sample Hold Select Bit: 2 
    ADC10SHT3* = (0x00000800) # ADC10 Sample Hold Select Bit: 3 
  # ADC10CTL0 Control Bits 
  const 
    ADC10SC_L* = (0x00000001) # ADC10 Start Conversion 
    ADC10ENC_L* = (0x00000002) # ADC10 Enable Conversion 
    ADC10ON_L* = (0x00000010) # ADC10 On/enable 
    ADC10MSC_L* = (0x00000080) # ADC10 Multiple SampleConversion 
  # ADC10CTL0 Control Bits 
  const 
    ADC10SHT0_H* = (0x00000001) # ADC10 Sample Hold Select Bit: 0 
    ADC10SHT1_H* = (0x00000002) # ADC10 Sample Hold Select Bit: 1 
    ADC10SHT2_H* = (0x00000004) # ADC10 Sample Hold Select Bit: 2 
    ADC10SHT3_H* = (0x00000008) # ADC10 Sample Hold Select Bit: 3 
    ADC10SHT_BIT0* = (0x00000000) # ADC10 Sample Hold Select 0 
    ADC10SHT_BIT1* = (0x00000100) # ADC10 Sample Hold Select 1 
    ADC10SHT_BIT2* = (0x00000200) # ADC10 Sample Hold Select 2 
    ADC10SHT_BIT3* = (0x00000300) # ADC10 Sample Hold Select 3 
    ADC10SHT_BIT4* = (0x00000400) # ADC10 Sample Hold Select 4 
    ADC10SHT_BIT5* = (0x00000500) # ADC10 Sample Hold Select 5 
    ADC10SHT_BIT6* = (0x00000600) # ADC10 Sample Hold Select 6 
    ADC10SHT_BIT7* = (0x00000700) # ADC10 Sample Hold Select 7 
    ADC10SHT_BIT8* = (0x00000800) # ADC10 Sample Hold Select 8 
    ADC10SHT_BIT9* = (0x00000900) # ADC10 Sample Hold Select 9 
    ADC10SHT_BIT10* = (0x00000A00) # ADC10 Sample Hold Select 10 
    ADC10SHT_BIT11* = (0x00000B00) # ADC10 Sample Hold Select 11 
    ADC10SHT_BIT12* = (0x00000C00) # ADC10 Sample Hold Select 12 
    ADC10SHT_BIT13* = (0x00000D00) # ADC10 Sample Hold Select 13 
    ADC10SHT_BIT14* = (0x00000E00) # ADC10 Sample Hold Select 14 
    ADC10SHT_BIT15* = (0x00000F00) # ADC10 Sample Hold Select 15 
  # ADC10CTL1 Control Bits 
  const 
    ADC10BUSY* = (0x00000001) # ADC10 Busy 
    ADC10CONSEQ0* = (0x00000002) # ADC10 Conversion Sequence Select 0 
    ADC10CONSEQ1* = (0x00000004) # ADC10 Conversion Sequence Select 1 
    ADC10SSEL0* = (0x00000008) # ADC10 Clock Source Select 0 
    ADC10SSEL1* = (0x00000010) # ADC10 Clock Source Select 1 
    ADC10DIV0* = (0x00000020) # ADC10 Clock Divider Select 0 
    ADC10DIV1* = (0x00000040) # ADC10 Clock Divider Select 1 
    ADC10DIV2* = (0x00000080) # ADC10 Clock Divider Select 2 
    ADC10ISSH* = (0x00000100) # ADC10 Invert Sample Hold Signal 
    ADC10SHP* = (0x00000200)  # ADC10 Sample/Hold Pulse Mode 
    ADC10SHS0* = (0x00000400) # ADC10 Sample/Hold Source 0 
    ADC10SHS1* = (0x00000800) # ADC10 Sample/Hold Source 1 
  # ADC10CTL1 Control Bits 
  const 
    ADC10BUSY_L* = (0x00000001) # ADC10 Busy 
    ADC10CONSEQ0_L* = (0x00000002) # ADC10 Conversion Sequence Select 0 
    ADC10CONSEQ1_L* = (0x00000004) # ADC10 Conversion Sequence Select 1 
    ADC10SSEL0_L* = (0x00000008) # ADC10 Clock Source Select 0 
    ADC10SSEL1_L* = (0x00000010) # ADC10 Clock Source Select 1 
    ADC10DIV0_L* = (0x00000020) # ADC10 Clock Divider Select 0 
    ADC10DIV1_L* = (0x00000040) # ADC10 Clock Divider Select 1 
    ADC10DIV2_L* = (0x00000080) # ADC10 Clock Divider Select 2 
  # ADC10CTL1 Control Bits 
  const 
    ADC10ISSH_H* = (0x00000001) # ADC10 Invert Sample Hold Signal 
    ADC10SHP_H* = (0x00000002) # ADC10 Sample/Hold Pulse Mode 
    ADC10SHS0_H* = (0x00000004) # ADC10 Sample/Hold Source 0 
    ADC10SHS1_H* = (0x00000008) # ADC10 Sample/Hold Source 1 
    ADC10CONSEQ_BIT0* = (0x00000000) # ADC10 Conversion Sequence Select: 0 
    ADC10CONSEQ_BIT1* = (0x00000002) # ADC10 Conversion Sequence Select: 1 
    ADC10CONSEQ_BIT2* = (0x00000004) # ADC10 Conversion Sequence Select: 2 
    ADC10CONSEQ_BIT3* = (0x00000006) # ADC10 Conversion Sequence Select: 3 
    ADC10SSEL_BIT0* = (0x00000000) # ADC10 Clock Source Select: 0 
    ADC10SSEL_BIT1* = (0x00000008) # ADC10 Clock Source Select: 1 
    ADC10SSEL_BIT2* = (0x00000010) # ADC10 Clock Source Select: 2 
    ADC10SSEL_BIT3* = (0x00000018) # ADC10 Clock Source Select: 3 
    ADC10DIV_BIT0* = (0x00000000) # ADC10 Clock Divider Select: 0 
    ADC10DIV_BIT1* = (0x00000020) # ADC10 Clock Divider Select: 1 
    ADC10DIV_BIT2* = (0x00000040) # ADC10 Clock Divider Select: 2 
    ADC10DIV_BIT3* = (0x00000060) # ADC10 Clock Divider Select: 3 
    ADC10DIV_BIT4* = (0x00000080) # ADC10 Clock Divider Select: 4 
    ADC10DIV_BIT5* = (0x000000A0) # ADC10 Clock Divider Select: 5 
    ADC10DIV_BIT6* = (0x000000C0) # ADC10 Clock Divider Select: 6 
    ADC10DIV_BIT7* = (0x000000E0) # ADC10 Clock Divider Select: 7 
    ADC10SHS_BIT0* = (0x00000000) # ADC10 Sample/Hold Source: 0 
    ADC10SHS_BIT1* = (0x00000400) # ADC10 Sample/Hold Source: 1 
    ADC10SHS_BIT2* = (0x00000800) # ADC10 Sample/Hold Source: 2 
    ADC10SHS_BIT3* = (0x00000C00) # ADC10 Sample/Hold Source: 3 
  # ADC10CTL2 Control Bits 
  const 
    ADC10REFBURST* = (0x00000001) # ADC10 Reference Burst 
    ADC10SR* = (0x00000004)   # ADC10 Sampling Rate 
    ADC10DF* = (0x00000008)   # ADC10 Data Format 
    ADC10RES* = (0x00000010)  # ADC10 Resolution Bit 
    ADC10PDIV0* = (0x00000100) # ADC10 predivider Bit: 0 
    ADC10PDIV1* = (0x00000200) # ADC10 predivider Bit: 1 
  # ADC10CTL2 Control Bits 
  const 
    ADC10REFBURST_L* = (0x00000001) # ADC10 Reference Burst 
    ADC10SR_L* = (0x00000004) # ADC10 Sampling Rate 
    ADC10DF_L* = (0x00000008) # ADC10 Data Format 
    ADC10RES_L* = (0x00000010) # ADC10 Resolution Bit 
  # ADC10CTL2 Control Bits 
  const 
    ADC10PDIV0_H* = (0x00000001) # ADC10 predivider Bit: 0 
    ADC10PDIV1_H* = (0x00000002) # ADC10 predivider Bit: 1 
    ADC10PDIV_BIT0* = (0x00000000) # ADC10 predivider /1 
    ADC10PDIV_BIT1* = (0x00000100) # ADC10 predivider /2 
    ADC10PDIV_BIT2* = (0x00000200) # ADC10 predivider /64 
    ADC10PDIV_BIT3* = (0x00000300) # ADC10 predivider reserved 
    ADC10PDIV_VAL_1* = (0x00000000) # ADC10 predivider /1 
    ADC10PDIV_VAL_4* = (0x00000100) # ADC10 predivider /2 
    ADC10PDIV_VAL_64* = (0x00000200) # ADC10 predivider /64 
  # ADC10MCTL0 Control Bits 
  const 
    ADC10INCH0* = (0x00000001) # ADC10 Input Channel Select Bit 0 
    ADC10INCH1* = (0x00000002) # ADC10 Input Channel Select Bit 1 
    ADC10INCH2* = (0x00000004) # ADC10 Input Channel Select Bit 2 
    ADC10INCH3* = (0x00000008) # ADC10 Input Channel Select Bit 3 
    ADC10SREF0* = (0x00000010) # ADC10 Select Reference Bit 0 
    ADC10SREF1* = (0x00000020) # ADC10 Select Reference Bit 1 
    ADC10SREF2* = (0x00000040) # ADC10 Select Reference Bit 2 
  # ADC10MCTL0 Control Bits 
  const 
    ADC10INCH0_L* = (0x00000001) # ADC10 Input Channel Select Bit 0 
    ADC10INCH1_L* = (0x00000002) # ADC10 Input Channel Select Bit 1 
    ADC10INCH2_L* = (0x00000004) # ADC10 Input Channel Select Bit 2 
    ADC10INCH3_L* = (0x00000008) # ADC10 Input Channel Select Bit 3 
    ADC10SREF0_L* = (0x00000010) # ADC10 Select Reference Bit 0 
    ADC10SREF1_L* = (0x00000020) # ADC10 Select Reference Bit 1 
    ADC10SREF2_L* = (0x00000040) # ADC10 Select Reference Bit 2 
  # ADC10MCTL0 Control Bits 
  const 
    ADC10INCH_BIT0* = (0)        # ADC10 Input Channel 0 
    ADC10INCH_BIT1* = (1)        # ADC10 Input Channel 1 
    ADC10INCH_BIT2* = (2)        # ADC10 Input Channel 2 
    ADC10INCH_BIT3* = (3)        # ADC10 Input Channel 3 
    ADC10INCH_BIT4* = (4)        # ADC10 Input Channel 4 
    ADC10INCH_BIT5* = (5)        # ADC10 Input Channel 5 
    ADC10INCH_BIT6* = (6)        # ADC10 Input Channel 6 
    ADC10INCH_BIT7* = (7)        # ADC10 Input Channel 7 
    ADC10INCH_BIT8* = (8)        # ADC10 Input Channel 8 
    ADC10INCH_BIT9* = (9)        # ADC10 Input Channel 9 
    ADC10INCH_BIT10* = (10)      # ADC10 Input Channel 10 
    ADC10INCH_BIT11* = (11)      # ADC10 Input Channel 11 
    ADC10INCH_BIT12* = (12)      # ADC10 Input Channel 12 
    ADC10INCH_BIT13* = (13)      # ADC10 Input Channel 13 
    ADC10INCH_BIT14* = (14)      # ADC10 Input Channel 14 
    ADC10INCH_BIT15* = (15)      # ADC10 Input Channel 15 
    ADC10SREF_BIT0* = (0x00000000) # ADC10 Select Reference 0 
    ADC10SREF_BIT1* = (0x00000010) # ADC10 Select Reference 1 
    ADC10SREF_BIT2* = (0x00000020) # ADC10 Select Reference 2 
    ADC10SREF_BIT3* = (0x00000030) # ADC10 Select Reference 3 
    ADC10SREF_BIT4* = (0x00000040) # ADC10 Select Reference 4 
    ADC10SREF_BIT5* = (0x00000050) # ADC10 Select Reference 5 
    ADC10SREF_BIT6* = (0x00000060) # ADC10 Select Reference 6 
    ADC10SREF_BIT7* = (0x00000070) # ADC10 Select Reference 7 
  # ADC10IE Interrupt Enable Bits 
  const 
    ADC10IE0* = (0x00000001)  # ADC10_A Interrupt enable 
    ADC10INIE* = (0x00000002) # ADC10_A Interrupt enable for the inside of window of the Window comparator 
    ADC10LOIE* = (0x00000004) # ADC10_A Interrupt enable for lower threshold of the Window comparator 
    ADC10HIIE* = (0x00000008) # ADC10_A Interrupt enable for upper threshold of the Window comparator 
    ADC10OVIE* = (0x00000010) # ADC10_A ADC10MEM overflow Interrupt enable 
    ADC10TOVIE* = (0x00000020) # ADC10_A conversion-time-overflow Interrupt enable 
  # ADC10IE Interrupt Enable Bits 
  const 
    ADC10IE0_L* = (0x00000001) # ADC10_A Interrupt enable 
    ADC10INIE_L* = (0x00000002) # ADC10_A Interrupt enable for the inside of window of the Window comparator 
    ADC10LOIE_L* = (0x00000004) # ADC10_A Interrupt enable for lower threshold of the Window comparator 
    ADC10HIIE_L* = (0x00000008) # ADC10_A Interrupt enable for upper threshold of the Window comparator 
    ADC10OVIE_L* = (0x00000010) # ADC10_A ADC10MEM overflow Interrupt enable 
    ADC10TOVIE_L* = (0x00000020) # ADC10_A conversion-time-overflow Interrupt enable 
  # ADC10IE Interrupt Enable Bits 
  # ADC10IFG Interrupt Flag Bits 
  const 
    ADC10IFG0* = (0x00000001) # ADC10_A Interrupt Flag 
    ADC10INIFG* = (0x00000002) # ADC10_A Interrupt Flag for the inside of window of the Window comparator 
    ADC10LOIFG* = (0x00000004) # ADC10_A Interrupt Flag for lower threshold of the Window comparator 
    ADC10HIIFG* = (0x00000008) # ADC10_A Interrupt Flag for upper threshold of the Window comparator 
    ADC10OVIFG* = (0x00000010) # ADC10_A ADC10MEM overflow Interrupt Flag 
    ADC10TOVIFG* = (0x00000020) # ADC10_A conversion-time-overflow Interrupt Flag 
  # ADC10IFG Interrupt Flag Bits 
  const 
    ADC10IFG0_L* = (0x00000001) # ADC10_A Interrupt Flag 
    ADC10INIFG_L* = (0x00000002) # ADC10_A Interrupt Flag for the inside of window of the Window comparator 
    ADC10LOIFG_L* = (0x00000004) # ADC10_A Interrupt Flag for lower threshold of the Window comparator 
    ADC10HIIFG_L* = (0x00000008) # ADC10_A Interrupt Flag for upper threshold of the Window comparator 
    ADC10OVIFG_L* = (0x00000010) # ADC10_A ADC10MEM overflow Interrupt Flag 
    ADC10TOVIFG_L* = (0x00000020) # ADC10_A conversion-time-overflow Interrupt Flag 
  # ADC10IFG Interrupt Flag Bits 
  # ADC10IV Definitions 
  const 
    ADC10IV_NONE* = (0x00000000) # No Interrupt pending 
    ADC10IV_ADC10OVIFG* = (0x00000002) # ADC10OVIFG 
    ADC10IV_ADC10TOVIFG* = (0x00000004) # ADC10TOVIFG 
    ADC10IV_ADC10HIIFG* = (0x00000006) # ADC10HIIFG 
    ADC10IV_ADC10LOIFG* = (0x00000008) # ADC10LOIFG 
    ADC10IV_ADC10INIFG* = (0x0000000A) # ADC10INIFG 
    ADC10IV_ADC10IFG* = (0x0000000C) # ADC10IFG 
  #***********************************************************
  # Comparator B
  #**********************************************************
  const 
    MSP430_HAS_COMPB* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_COMPB* = 0x000008C0
    CBCTL0_ADDR* = 0x000008C0
  sfrb(CBCTL0_L, CBCTL0_ADDR)
  sfrb(CBCTL0_H, CBCTL0_ADDR + 1)
  sfrw(CBCTL0, CBCTL0_ADDR)
  const 
    CBCTL1_ADDR* = 0x000008C2
  sfrb(CBCTL1_L, CBCTL1_ADDR)
  sfrb(CBCTL1_H, CBCTL1_ADDR + 1)
  sfrw(CBCTL1, CBCTL1_ADDR)
  const 
    CBCTL2_ADDR* = 0x000008C4
  sfrb(CBCTL2_L, CBCTL2_ADDR)
  sfrb(CBCTL2_H, CBCTL2_ADDR + 1)
  sfrw(CBCTL2, CBCTL2_ADDR)
  const 
    CBCTL3_ADDR* = 0x000008C6
  sfrb(CBCTL3_L, CBCTL3_ADDR)
  sfrb(CBCTL3_H, CBCTL3_ADDR + 1)
  sfrw(CBCTL3, CBCTL3_ADDR)
  const 
    CBINT_ADDR* = 0x000008CC
  sfrb(CBINT_L, CBINT_ADDR)
  sfrb(CBINT_H, CBINT_ADDR + 1)
  sfrw(CBINT, CBINT_ADDR)
  const 
    CBIV_ADDR* = 0x000008CE
  sfrw(CBIV, CBIV_ADDR)
  # CBCTL0 Control Bits 
  const 
    CBIPSEL0* = (0x00000001)  # Comp. B Pos. Channel Input Select 0 
    CBIPSEL1* = (0x00000002)  # Comp. B Pos. Channel Input Select 1 
    CBIPSEL2* = (0x00000004)  # Comp. B Pos. Channel Input Select 2 
    CBIPSEL3* = (0x00000008)  # Comp. B Pos. Channel Input Select 3 
  ##define RESERVED            (0x0010)  /* Comp. B */
  ##define RESERVED            (0x0020)  /* Comp. B */
  ##define RESERVED            (0x0040)  /* Comp. B */
  const 
    CBIPEN* = (0x00000080)    # Comp. B Pos. Channel Input Enable 
    CBIMSEL0* = (0x00000100)  # Comp. B Neg. Channel Input Select 0 
    CBIMSEL1* = (0x00000200)  # Comp. B Neg. Channel Input Select 1 
    CBIMSEL2* = (0x00000400)  # Comp. B Neg. Channel Input Select 2 
    CBIMSEL3* = (0x00000800)  # Comp. B Neg. Channel Input Select 3 
  ##define RESERVED            (0x1000)  /* Comp. B */
  ##define RESERVED            (0x2000)  /* Comp. B */
  ##define RESERVED            (0x4000)  /* Comp. B */
  const 
    CBIMEN* = (0x00008000)    # Comp. B Neg. Channel Input Enable 
  # CBCTL0 Control Bits 
  const 
    CBIPSEL0_L* = (0x00000001) # Comp. B Pos. Channel Input Select 0 
    CBIPSEL1_L* = (0x00000002) # Comp. B Pos. Channel Input Select 1 
    CBIPSEL2_L* = (0x00000004) # Comp. B Pos. Channel Input Select 2 
    CBIPSEL3_L* = (0x00000008) # Comp. B Pos. Channel Input Select 3 
  ##define RESERVED            (0x0010)  /* Comp. B */
  ##define RESERVED            (0x0020)  /* Comp. B */
  ##define RESERVED            (0x0040)  /* Comp. B */
  const 
    CBIPEN_L* = (0x00000080)  # Comp. B Pos. Channel Input Enable 
  ##define RESERVED            (0x1000)  /* Comp. B */
  ##define RESERVED            (0x2000)  /* Comp. B */
  ##define RESERVED            (0x4000)  /* Comp. B */
  # CBCTL0 Control Bits 
  ##define RESERVED            (0x0010)  /* Comp. B */
  ##define RESERVED            (0x0020)  /* Comp. B */
  ##define RESERVED            (0x0040)  /* Comp. B */
  const 
    CBIMSEL0_H* = (0x00000001) # Comp. B Neg. Channel Input Select 0 
    CBIMSEL1_H* = (0x00000002) # Comp. B Neg. Channel Input Select 1 
    CBIMSEL2_H* = (0x00000004) # Comp. B Neg. Channel Input Select 2 
    CBIMSEL3_H* = (0x00000008) # Comp. B Neg. Channel Input Select 3 
  ##define RESERVED            (0x1000)  /* Comp. B */
  ##define RESERVED            (0x2000)  /* Comp. B */
  ##define RESERVED            (0x4000)  /* Comp. B */
  const 
    CBIMEN_H* = (0x00000080)  # Comp. B Neg. Channel Input Enable 
    CBIPSEL_BIT0* = (0x00000000) # Comp. B V+ terminal Input Select: Channel 0 
    CBIPSEL_BIT1* = (0x00000001) # Comp. B V+ terminal Input Select: Channel 1 
    CBIPSEL_BIT2* = (0x00000002) # Comp. B V+ terminal Input Select: Channel 2 
    CBIPSEL_BIT3* = (0x00000003) # Comp. B V+ terminal Input Select: Channel 3 
    CBIPSEL_BIT4* = (0x00000004) # Comp. B V+ terminal Input Select: Channel 4 
    CBIPSEL_BIT5* = (0x00000005) # Comp. B V+ terminal Input Select: Channel 5 
    CBIPSEL_BIT6* = (0x00000006) # Comp. B V+ terminal Input Select: Channel 6 
    CBIPSEL_BIT7* = (0x00000007) # Comp. B V+ terminal Input Select: Channel 7 
    CBIPSEL_BIT8* = (0x00000008) # Comp. B V+ terminal Input Select: Channel 8 
    CBIPSEL_BIT9* = (0x00000009) # Comp. B V+ terminal Input Select: Channel 9 
    CBIPSEL_BIT10* = (0x0000000A) # Comp. B V+ terminal Input Select: Channel 10 
    CBIPSEL_BIT11* = (0x0000000B) # Comp. B V+ terminal Input Select: Channel 11 
    CBIPSEL_BIT12* = (0x0000000C) # Comp. B V+ terminal Input Select: Channel 12 
    CBIPSEL_BIT13* = (0x0000000D) # Comp. B V+ terminal Input Select: Channel 13 
    CBIPSEL_BIT14* = (0x0000000E) # Comp. B V+ terminal Input Select: Channel 14 
    CBIPSEL_BIT15* = (0x0000000F) # Comp. B V+ terminal Input Select: Channel 15 
    CBIMSEL_BIT0* = (0x00000000) # Comp. B V- Terminal Input Select: Channel 0 
    CBIMSEL_BIT1* = (0x00000100) # Comp. B V- Terminal Input Select: Channel 1 
    CBIMSEL_BIT2* = (0x00000200) # Comp. B V- Terminal Input Select: Channel 2 
    CBIMSEL_BIT3* = (0x00000300) # Comp. B V- Terminal Input Select: Channel 3 
    CBIMSEL_BIT4* = (0x00000400) # Comp. B V- Terminal Input Select: Channel 4 
    CBIMSEL_BIT5* = (0x00000500) # Comp. B V- Terminal Input Select: Channel 5 
    CBIMSEL_BIT6* = (0x00000600) # Comp. B V- Terminal Input Select: Channel 6 
    CBIMSEL_BIT7* = (0x00000700) # Comp. B V- Terminal Input Select: Channel 7 
    CBIMSEL_BIT8* = (0x00000800) # Comp. B V- terminal Input Select: Channel 8 
    CBIMSEL_BIT9* = (0x00000900) # Comp. B V- terminal Input Select: Channel 9 
    CBIMSEL_BIT10* = (0x00000A00) # Comp. B V- terminal Input Select: Channel 10 
    CBIMSEL_BIT11* = (0x00000B00) # Comp. B V- terminal Input Select: Channel 11 
    CBIMSEL_BIT12* = (0x00000C00) # Comp. B V- terminal Input Select: Channel 12 
    CBIMSEL_BIT13* = (0x00000D00) # Comp. B V- terminal Input Select: Channel 13 
    CBIMSEL_BIT14* = (0x00000E00) # Comp. B V- terminal Input Select: Channel 14 
    CBIMSEL_BIT15* = (0x00000F00) # Comp. B V- terminal Input Select: Channel 15 
  # CBCTL1 Control Bits 
  const 
    CBOUT* = (0x00000001)     # Comp. B Output 
    CBOUTPOL* = (0x00000002)  # Comp. B Output Polarity 
    CBF* = (0x00000004)       # Comp. B Enable Output Filter 
    CBIES* = (0x00000008)     # Comp. B Interrupt Edge Select 
    CBSHORT* = (0x00000010)   # Comp. B Input Short 
    CBEX* = (0x00000020)      # Comp. B Exchange Inputs 
    CBFDLY0* = (0x00000040)   # Comp. B Filter delay Bit 0 
    CBFDLY1* = (0x00000080)   # Comp. B Filter delay Bit 1 
    CBPWRMD0* = (0x00000100)  # Comp. B Power Mode Bit 0 
    CBPWRMD1* = (0x00000200)  # Comp. B Power Mode Bit 1 
    CBON* = (0x00000400)      # Comp. B enable 
    CBMRVL* = (0x00000800)    # Comp. B CBMRV Level 
    CBMRVS* = (0x00001000)    # Comp. B Output selects between VREF0 or VREF1
  ##define RESERVED            (0x2000)  /* Comp. B */
  ##define RESERVED            (0x4000)  /* Comp. B */
  ##define RESERVED            (0x8000)  /* Comp. B */
  # CBCTL1 Control Bits 
  const 
    CBOUT_L* = (0x00000001)   # Comp. B Output 
    CBOUTPOL_L* = (0x00000002) # Comp. B Output Polarity 
    CBF_L* = (0x00000004)     # Comp. B Enable Output Filter 
    CBIES_L* = (0x00000008)   # Comp. B Interrupt Edge Select 
    CBSHORT_L* = (0x00000010) # Comp. B Input Short 
    CBEX_L* = (0x00000020)    # Comp. B Exchange Inputs 
    CBFDLY0_L* = (0x00000040) # Comp. B Filter delay Bit 0 
    CBFDLY1_L* = (0x00000080) # Comp. B Filter delay Bit 1 
  ##define RESERVED            (0x2000)  /* Comp. B */
  ##define RESERVED            (0x4000)  /* Comp. B */
  ##define RESERVED            (0x8000)  /* Comp. B */
  # CBCTL1 Control Bits 
  const 
    CBPWRMD0_H* = (0x00000001) # Comp. B Power Mode Bit 0 
    CBPWRMD1_H* = (0x00000002) # Comp. B Power Mode Bit 1 
    CBON_H* = (0x00000004)    # Comp. B enable 
    CBMRVL_H* = (0x00000008)  # Comp. B CBMRV Level 
    CBMRVS_H* = (0x00000010)  # Comp. B Output selects between VREF0 or VREF1
  ##define RESERVED            (0x2000)  /* Comp. B */
  ##define RESERVED            (0x4000)  /* Comp. B */
  ##define RESERVED            (0x8000)  /* Comp. B */
  const 
    CBFDLY_BIT0* = (0x00000000)  # Comp. B Filter delay 0 : 450ns 
    CBFDLY_BIT1* = (0x00000040)  # Comp. B Filter delay 1 : 900ns 
    CBFDLY_BIT2* = (0x00000080)  # Comp. B Filter delay 2 : 1800ns 
    CBFDLY_BIT3* = (0x000000C0)  # Comp. B Filter delay 3 : 3600ns 
    CBPWRMD_BIT0* = (0x00000000) # Comp. B Power Mode 0 : High speed 
    CBPWRMD_BIT1* = (0x00000100) # Comp. B Power Mode 1 : Normal 
    CBPWRMD_BIT2* = (0x00000200) # Comp. B Power Mode 2 : Ultra-Low
    CBPWRMD_BIT3* = (0x00000300) # Comp. B Power Mode 3 : Reserved 
  # CBCTL2 Control Bits 
  const 
    CBREF00* = (0x00000001)   # Comp. B Reference 0 Resistor Select Bit : 0 
    CBREF01* = (0x00000002)   # Comp. B Reference 0 Resistor Select Bit : 1 
    CBREF02* = (0x00000004)   # Comp. B Reference 0 Resistor Select Bit : 2 
    CBREF03* = (0x00000008)   # Comp. B Reference 0 Resistor Select Bit : 3 
    CBREF04* = (0x00000010)   # Comp. B Reference 0 Resistor Select Bit : 4 
    CBRSEL* = (0x00000020)    # Comp. B Reference select 
    CBRS0* = (0x00000040)     # Comp. B Reference Source Bit : 0 
    CBRS1* = (0x00000080)     # Comp. B Reference Source Bit : 1 
    CBREF10* = (0x00000100)   # Comp. B Reference 1 Resistor Select Bit : 0 
    CBREF11* = (0x00000200)   # Comp. B Reference 1 Resistor Select Bit : 1 
    CBREF12* = (0x00000400)   # Comp. B Reference 1 Resistor Select Bit : 2 
    CBREF13* = (0x00000800)   # Comp. B Reference 1 Resistor Select Bit : 3 
    CBREF14* = (0x00001000)   # Comp. B Reference 1 Resistor Select Bit : 4 
    CBREFL0* = (0x00002000)   # Comp. B Reference voltage level Bit : 0 
    CBREFL1* = (0x00004000)   # Comp. B Reference voltage level Bit : 1 
    CBREFACC* = (0x00008000)  # Comp. B Reference Accuracy 
  # CBCTL2 Control Bits 
  const 
    CBREF00_L* = (0x00000001) # Comp. B Reference 0 Resistor Select Bit : 0 
    CBREF01_L* = (0x00000002) # Comp. B Reference 0 Resistor Select Bit : 1 
    CBREF02_L* = (0x00000004) # Comp. B Reference 0 Resistor Select Bit : 2 
    CBREF03_L* = (0x00000008) # Comp. B Reference 0 Resistor Select Bit : 3 
    CBREF04_L* = (0x00000010) # Comp. B Reference 0 Resistor Select Bit : 4 
    CBRSEL_L* = (0x00000020)  # Comp. B Reference select 
    CBRS0_L* = (0x00000040)   # Comp. B Reference Source Bit : 0 
    CBRS1_L* = (0x00000080)   # Comp. B Reference Source Bit : 1 
  # CBCTL2 Control Bits 
  const 
    CBREF10_H* = (0x00000001) # Comp. B Reference 1 Resistor Select Bit : 0 
    CBREF11_H* = (0x00000002) # Comp. B Reference 1 Resistor Select Bit : 1 
    CBREF12_H* = (0x00000004) # Comp. B Reference 1 Resistor Select Bit : 2 
    CBREF13_H* = (0x00000008) # Comp. B Reference 1 Resistor Select Bit : 3 
    CBREF14_H* = (0x00000010) # Comp. B Reference 1 Resistor Select Bit : 4 
    CBREFL0_H* = (0x00000020) # Comp. B Reference voltage level Bit : 0 
    CBREFL1_H* = (0x00000040) # Comp. B Reference voltage level Bit : 1 
    CBREFACC_H* = (0x00000080) # Comp. B Reference Accuracy 
    CBREF0_BIT0* = (0x00000000)  # Comp. B Int. Ref.0 Select 0 : 1/32 
    CBREF0_BIT1* = (0x00000001)  # Comp. B Int. Ref.0 Select 1 : 2/32 
    CBREF0_BIT2* = (0x00000002)  # Comp. B Int. Ref.0 Select 2 : 3/32 
    CBREF0_BIT3* = (0x00000003)  # Comp. B Int. Ref.0 Select 3 : 4/32 
    CBREF0_BIT4* = (0x00000004)  # Comp. B Int. Ref.0 Select 4 : 5/32 
    CBREF0_BIT5* = (0x00000005)  # Comp. B Int. Ref.0 Select 5 : 6/32 
    CBREF0_BIT6* = (0x00000006)  # Comp. B Int. Ref.0 Select 6 : 7/32 
    CBREF0_BIT7* = (0x00000007)  # Comp. B Int. Ref.0 Select 7 : 8/32 
    CBREF0_BIT8* = (0x00000008)  # Comp. B Int. Ref.0 Select 0 : 9/32 
    CBREF0_BIT9* = (0x00000009)  # Comp. B Int. Ref.0 Select 1 : 10/32 
    CBREF0_BIT10* = (0x0000000A) # Comp. B Int. Ref.0 Select 2 : 11/32 
    CBREF0_BIT11* = (0x0000000B) # Comp. B Int. Ref.0 Select 3 : 12/32 
    CBREF0_BIT12* = (0x0000000C) # Comp. B Int. Ref.0 Select 4 : 13/32 
    CBREF0_BIT13* = (0x0000000D) # Comp. B Int. Ref.0 Select 5 : 14/32 
    CBREF0_BIT14* = (0x0000000E) # Comp. B Int. Ref.0 Select 6 : 15/32 
    CBREF0_BIT15* = (0x0000000F) # Comp. B Int. Ref.0 Select 7 : 16/32 
    CBREF0_BIT16* = (0x00000010) # Comp. B Int. Ref.0 Select 0 : 17/32 
    CBREF0_BIT17* = (0x00000011) # Comp. B Int. Ref.0 Select 1 : 18/32 
    CBREF0_BIT18* = (0x00000012) # Comp. B Int. Ref.0 Select 2 : 19/32 
    CBREF0_BIT19* = (0x00000013) # Comp. B Int. Ref.0 Select 3 : 20/32 
    CBREF0_BIT20* = (0x00000014) # Comp. B Int. Ref.0 Select 4 : 21/32 
    CBREF0_BIT21* = (0x00000015) # Comp. B Int. Ref.0 Select 5 : 22/32 
    CBREF0_BIT22* = (0x00000016) # Comp. B Int. Ref.0 Select 6 : 23/32 
    CBREF0_BIT23* = (0x00000017) # Comp. B Int. Ref.0 Select 7 : 24/32 
    CBREF0_BIT24* = (0x00000018) # Comp. B Int. Ref.0 Select 0 : 25/32 
    CBREF0_BIT25* = (0x00000019) # Comp. B Int. Ref.0 Select 1 : 26/32 
    CBREF0_BIT26* = (0x0000001A) # Comp. B Int. Ref.0 Select 2 : 27/32 
    CBREF0_BIT27* = (0x0000001B) # Comp. B Int. Ref.0 Select 3 : 28/32 
    CBREF0_BIT28* = (0x0000001C) # Comp. B Int. Ref.0 Select 4 : 29/32 
    CBREF0_BIT29* = (0x0000001D) # Comp. B Int. Ref.0 Select 5 : 30/32 
    CBREF0_BIT30* = (0x0000001E) # Comp. B Int. Ref.0 Select 6 : 31/32 
    CBREF0_BIT31* = (0x0000001F) # Comp. B Int. Ref.0 Select 7 : 32/32 
    CBRS_BIT0* = (0x00000000)    # Comp. B Reference Source 0 : Off 
    CBRS_BIT1* = (0x00000040)    # Comp. B Reference Source 1 : Vcc 
    CBRS_BIT2* = (0x00000080)    # Comp. B Reference Source 2 : Shared Ref. 
    CBRS_BIT3* = (0x000000C0)    # Comp. B Reference Source 3 : Shared Ref. / Off 
    CBREF1_BIT0* = (0x00000000)  # Comp. B Int. Ref.1 Select 0 : 1/32 
    CBREF1_BIT1* = (0x00000100)  # Comp. B Int. Ref.1 Select 1 : 2/32 
    CBREF1_BIT2* = (0x00000200)  # Comp. B Int. Ref.1 Select 2 : 3/32 
    CBREF1_BIT3* = (0x00000300)  # Comp. B Int. Ref.1 Select 3 : 4/32 
    CBREF1_BIT4* = (0x00000400)  # Comp. B Int. Ref.1 Select 4 : 5/32 
    CBREF1_BIT5* = (0x00000500)  # Comp. B Int. Ref.1 Select 5 : 6/32 
    CBREF1_BIT6* = (0x00000600)  # Comp. B Int. Ref.1 Select 6 : 7/32 
    CBREF1_BIT7* = (0x00000700)  # Comp. B Int. Ref.1 Select 7 : 8/32 
    CBREF1_BIT8* = (0x00000800)  # Comp. B Int. Ref.1 Select 0 : 9/32 
    CBREF1_BIT9* = (0x00000900)  # Comp. B Int. Ref.1 Select 1 : 10/32 
    CBREF1_BIT10* = (0x00000A00) # Comp. B Int. Ref.1 Select 2 : 11/32 
    CBREF1_BIT11* = (0x00000B00) # Comp. B Int. Ref.1 Select 3 : 12/32 
    CBREF1_BIT12* = (0x00000C00) # Comp. B Int. Ref.1 Select 4 : 13/32 
    CBREF1_BIT13* = (0x00000D00) # Comp. B Int. Ref.1 Select 5 : 14/32 
    CBREF1_BIT14* = (0x00000E00) # Comp. B Int. Ref.1 Select 6 : 15/32 
    CBREF1_BIT15* = (0x00000F00) # Comp. B Int. Ref.1 Select 7 : 16/32 
    CBREF1_BIT16* = (0x00001000) # Comp. B Int. Ref.1 Select 0 : 17/32 
    CBREF1_BIT17* = (0x00001100) # Comp. B Int. Ref.1 Select 1 : 18/32 
    CBREF1_BIT18* = (0x00001200) # Comp. B Int. Ref.1 Select 2 : 19/32 
    CBREF1_BIT19* = (0x00001300) # Comp. B Int. Ref.1 Select 3 : 20/32 
    CBREF1_BIT20* = (0x00001400) # Comp. B Int. Ref.1 Select 4 : 21/32 
    CBREF1_BIT21* = (0x00001500) # Comp. B Int. Ref.1 Select 5 : 22/32 
    CBREF1_BIT22* = (0x00001600) # Comp. B Int. Ref.1 Select 6 : 23/32 
    CBREF1_BIT23* = (0x00001700) # Comp. B Int. Ref.1 Select 7 : 24/32 
    CBREF1_BIT24* = (0x00001800) # Comp. B Int. Ref.1 Select 0 : 25/32 
    CBREF1_BIT25* = (0x00001900) # Comp. B Int. Ref.1 Select 1 : 26/32 
    CBREF1_BIT26* = (0x00001A00) # Comp. B Int. Ref.1 Select 2 : 27/32 
    CBREF1_BIT27* = (0x00001B00) # Comp. B Int. Ref.1 Select 3 : 28/32 
    CBREF1_BIT28* = (0x00001C00) # Comp. B Int. Ref.1 Select 4 : 29/32 
    CBREF1_BIT29* = (0x00001D00) # Comp. B Int. Ref.1 Select 5 : 30/32 
    CBREF1_BIT30* = (0x00001E00) # Comp. B Int. Ref.1 Select 6 : 31/32 
    CBREF1_BIT31* = (0x00001F00) # Comp. B Int. Ref.1 Select 7 : 32/32 
    CBREFL_BIT0* = (0x00000000)  # Comp. B Reference voltage level 0 : None 
    CBREFL_BIT1* = (0x00002000)  # Comp. B Reference voltage level 1 : 1.5V 
    CBREFL_BIT2* = (0x00004000)  # Comp. B Reference voltage level 2 : 2.0V  
    CBREFL_BIT3* = (0x00006000)  # Comp. B Reference voltage level 3 : 2.5V  
    CBPD0* = (0x00000001)     # Comp. B Disable Input Buffer of Port Register .0 
    CBPD1* = (0x00000002)     # Comp. B Disable Input Buffer of Port Register .1 
    CBPD2* = (0x00000004)     # Comp. B Disable Input Buffer of Port Register .2 
    CBPD3* = (0x00000008)     # Comp. B Disable Input Buffer of Port Register .3 
    CBPD4* = (0x00000010)     # Comp. B Disable Input Buffer of Port Register .4 
    CBPD5* = (0x00000020)     # Comp. B Disable Input Buffer of Port Register .5 
    CBPD6* = (0x00000040)     # Comp. B Disable Input Buffer of Port Register .6 
    CBPD7* = (0x00000080)     # Comp. B Disable Input Buffer of Port Register .7 
    CBPD8* = (0x00000100)     # Comp. B Disable Input Buffer of Port Register .8 
    CBPD9* = (0x00000200)     # Comp. B Disable Input Buffer of Port Register .9 
    CBPD10* = (0x00000400)    # Comp. B Disable Input Buffer of Port Register .10 
    CBPD11* = (0x00000800)    # Comp. B Disable Input Buffer of Port Register .11 
    CBPD12* = (0x00001000)    # Comp. B Disable Input Buffer of Port Register .12 
    CBPD13* = (0x00002000)    # Comp. B Disable Input Buffer of Port Register .13 
    CBPD14* = (0x00004000)    # Comp. B Disable Input Buffer of Port Register .14 
    CBPD15* = (0x00008000)    # Comp. B Disable Input Buffer of Port Register .15 
    CBPD0_L* = (0x00000001)   # Comp. B Disable Input Buffer of Port Register .0 
    CBPD1_L* = (0x00000002)   # Comp. B Disable Input Buffer of Port Register .1 
    CBPD2_L* = (0x00000004)   # Comp. B Disable Input Buffer of Port Register .2 
    CBPD3_L* = (0x00000008)   # Comp. B Disable Input Buffer of Port Register .3 
    CBPD4_L* = (0x00000010)   # Comp. B Disable Input Buffer of Port Register .4 
    CBPD5_L* = (0x00000020)   # Comp. B Disable Input Buffer of Port Register .5 
    CBPD6_L* = (0x00000040)   # Comp. B Disable Input Buffer of Port Register .6 
    CBPD7_L* = (0x00000080)   # Comp. B Disable Input Buffer of Port Register .7 
    CBPD8_H* = (0x00000001)   # Comp. B Disable Input Buffer of Port Register .8 
    CBPD9_H* = (0x00000002)   # Comp. B Disable Input Buffer of Port Register .9 
    CBPD10_H* = (0x00000004)  # Comp. B Disable Input Buffer of Port Register .10 
    CBPD11_H* = (0x00000008)  # Comp. B Disable Input Buffer of Port Register .11 
    CBPD12_H* = (0x00000010)  # Comp. B Disable Input Buffer of Port Register .12 
    CBPD13_H* = (0x00000020)  # Comp. B Disable Input Buffer of Port Register .13 
    CBPD14_H* = (0x00000040)  # Comp. B Disable Input Buffer of Port Register .14 
    CBPD15_H* = (0x00000080)  # Comp. B Disable Input Buffer of Port Register .15 
  # CBINT Control Bits 
  const 
    CBIFG* = (0x00000001)     # Comp. B Interrupt Flag 
    CBIIFG* = (0x00000002)    # Comp. B Interrupt Flag Inverted Polarity 
  ##define RESERVED             (0x0004)  /* Comp. B */
  ##define RESERVED             (0x0008)  /* Comp. B */
  ##define RESERVED             (0x0010)  /* Comp. B */
  ##define RESERVED             (0x0020)  /* Comp. B */
  ##define RESERVED             (0x0040)  /* Comp. B */
  ##define RESERVED             (0x0080)  /* Comp. B */
  const 
    CBIE* = (0x00000100)      # Comp. B Interrupt Enable 
    CBIIE* = (0x00000200)     # Comp. B Interrupt Enable Inverted Polarity 
  ##define RESERVED             (0x0400)  /* Comp. B */
  ##define RESERVED             (0x0800)  /* Comp. B */
  ##define RESERVED             (0x1000)  /* Comp. B */
  ##define RESERVED             (0x2000)  /* Comp. B */
  ##define RESERVED             (0x4000)  /* Comp. B */
  ##define RESERVED             (0x8000)  /* Comp. B */
  # CBINT Control Bits 
  const 
    CBIFG_L* = (0x00000001)   # Comp. B Interrupt Flag 
    CBIIFG_L* = (0x00000002)  # Comp. B Interrupt Flag Inverted Polarity 
  ##define RESERVED             (0x0004)  /* Comp. B */
  ##define RESERVED             (0x0008)  /* Comp. B */
  ##define RESERVED             (0x0010)  /* Comp. B */
  ##define RESERVED             (0x0020)  /* Comp. B */
  ##define RESERVED             (0x0040)  /* Comp. B */
  ##define RESERVED             (0x0080)  /* Comp. B */
  ##define RESERVED             (0x0400)  /* Comp. B */
  ##define RESERVED             (0x0800)  /* Comp. B */
  ##define RESERVED             (0x1000)  /* Comp. B */
  ##define RESERVED             (0x2000)  /* Comp. B */
  ##define RESERVED             (0x4000)  /* Comp. B */
  ##define RESERVED             (0x8000)  /* Comp. B */
  # CBINT Control Bits 
  ##define RESERVED             (0x0004)  /* Comp. B */
  ##define RESERVED             (0x0008)  /* Comp. B */
  ##define RESERVED             (0x0010)  /* Comp. B */
  ##define RESERVED             (0x0020)  /* Comp. B */
  ##define RESERVED             (0x0040)  /* Comp. B */
  ##define RESERVED             (0x0080)  /* Comp. B */
  const 
    CBIE_H* = (0x00000001)    # Comp. B Interrupt Enable 
    CBIIE_H* = (0x00000002)   # Comp. B Interrupt Enable Inverted Polarity 
  ##define RESERVED             (0x0400)  /* Comp. B */
  ##define RESERVED             (0x0800)  /* Comp. B */
  ##define RESERVED             (0x1000)  /* Comp. B */
  ##define RESERVED             (0x2000)  /* Comp. B */
  ##define RESERVED             (0x4000)  /* Comp. B */
  ##define RESERVED             (0x8000)  /* Comp. B */
  # CBIV Definitions 
  const 
    CBIV_NONE* = (0x00000000) # No Interrupt pending 
    CBIV_CBIFG* = (0x00000002) # CBIFG 
    CBIV_CBIIFG* = (0x00000004) # CBIIFG 
  #************************************************************
  # CRC Module
  #***********************************************************
  const 
    MSP430_HAS_CRC* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_CRC* = 0x00000150
    CRCDI_ADDR* = 0x00000150
  sfrb(CRCDI_L, CRCDI_ADDR)
  sfrb(CRCDI_H, CRCDI_ADDR + 1)
  sfrw(CRCDI, CRCDI_ADDR)
  const 
    CRCDIRB_ADDR* = 0x00000152
  sfrb(CRCDIRB_L, CRCDIRB_ADDR)
  sfrb(CRCDIRB_H, CRCDIRB_ADDR + 1)
  sfrw(CRCDIRB, CRCDIRB_ADDR)
  const 
    CRCINIRES_ADDR* = 0x00000154
  sfrb(CRCINIRES_L, CRCINIRES_ADDR)
  sfrb(CRCINIRES_H, CRCINIRES_ADDR + 1)
  sfrw(CRCINIRES, CRCINIRES_ADDR)
  const 
    CRCRESR_ADDR* = 0x00000156
  sfrb(CRCRESR_L, CRCRESR_ADDR)
  sfrb(CRCRESR_H, CRCRESR_ADDR + 1)
  sfrw(CRCRESR, CRCRESR_ADDR)
  #***********************************************************
  # DMA_X
  #**********************************************************
  const 
    MSP430_HAS_DMAX_BIT3* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_DMAX_BIT3* = 0x00000500
    DMACTL0_ADDR* = 0x00000500
  sfrb(DMACTL0_L, DMACTL0_ADDR)
  sfrb(DMACTL0_H, DMACTL0_ADDR + 1)
  sfrw(DMACTL0, DMACTL0_ADDR)
  const 
    DMACTL1_ADDR* = 0x00000502
  sfrb(DMACTL1_L, DMACTL1_ADDR)
  sfrb(DMACTL1_H, DMACTL1_ADDR + 1)
  sfrw(DMACTL1, DMACTL1_ADDR)
  const 
    DMACTL2_ADDR* = 0x00000504
  sfrb(DMACTL2_L, DMACTL2_ADDR)
  sfrb(DMACTL2_H, DMACTL2_ADDR + 1)
  sfrw(DMACTL2, DMACTL2_ADDR)
  const 
    DMACTL3_ADDR* = 0x00000506
  sfrb(DMACTL3_L, DMACTL3_ADDR)
  sfrb(DMACTL3_H, DMACTL3_ADDR + 1)
  sfrw(DMACTL3, DMACTL3_ADDR)
  const 
    DMACTL4_ADDR* = 0x00000508
  sfrb(DMACTL4_L, DMACTL4_ADDR)
  sfrb(DMACTL4_H, DMACTL4_ADDR + 1)
  sfrw(DMACTL4, DMACTL4_ADDR)
  const 
    DMAIV_ADDR* = 0x0000050E
  sfrb(DMAIV_L, DMAIV_ADDR)
  sfrb(DMAIV_H, DMAIV_ADDR + 1)
  sfrw(DMAIV, DMAIV_ADDR)
  const 
    DMA0CTL_ADDR* = 0x00000510
  sfrb(DMA0CTL_L, DMA0CTL_ADDR)
  sfrb(DMA0CTL_H, DMA0CTL_ADDR + 1)
  sfrw(DMA0CTL, DMA0CTL_ADDR)
  const 
    DMA0SA_ADDR* = 0x00000512
  sfra(DMA0SA, DMA0SA_ADDR)
  const 
    DMA0DA_ADDR* = 0x00000516
  sfra(DMA0DA, DMA0DA_ADDR)
  const 
    DMA0SZ_ADDR* = 0x0000051A
  sfrw(DMA0SZ, DMA0SZ_ADDR)
  const 
    DMA1CTL_ADDR* = 0x00000520
  sfrb(DMA1CTL_L, DMA1CTL_ADDR)
  sfrb(DMA1CTL_H, DMA1CTL_ADDR + 1)
  sfrw(DMA1CTL, DMA1CTL_ADDR)
  const 
    DMA1SA_ADDR* = 0x00000522
  sfra(DMA1SA, DMA1SA_ADDR)
  const 
    DMA1DA_ADDR* = 0x00000526
  sfra(DMA1DA, DMA1DA_ADDR)
  const 
    DMA1SZ_ADDR* = 0x0000052A
  sfrw(DMA1SZ, DMA1SZ_ADDR)
  const 
    DMA2CTL_ADDR* = 0x00000530
  sfrb(DMA2CTL_L, DMA2CTL_ADDR)
  sfrb(DMA2CTL_H, DMA2CTL_ADDR + 1)
  sfrw(DMA2CTL, DMA2CTL_ADDR)
  const 
    DMA2SA_ADDR* = 0x00000532
  sfra(DMA2SA, DMA2SA_ADDR)
  const 
    DMA2DA_ADDR* = 0x00000536
  sfra(DMA2DA, DMA2DA_ADDR)
  const 
    DMA2SZ_ADDR* = 0x0000053A
  sfrw(DMA2SZ, DMA2SZ_ADDR)
  # DMACTL0 Control Bits 
  const 
    DMA0TSEL0* = (0x00000001) # DMA channel 0 transfer select bit 0 
    DMA0TSEL1* = (0x00000002) # DMA channel 0 transfer select bit 1 
    DMA0TSEL2* = (0x00000004) # DMA channel 0 transfer select bit 2 
    DMA0TSEL3* = (0x00000008) # DMA channel 0 transfer select bit 3 
    DMA0TSEL4* = (0x00000010) # DMA channel 0 transfer select bit 4 
    DMA1TSEL0* = (0x00000100) # DMA channel 1 transfer select bit 0 
    DMA1TSEL1* = (0x00000200) # DMA channel 1 transfer select bit 1 
    DMA1TSEL2* = (0x00000400) # DMA channel 1 transfer select bit 2 
    DMA1TSEL3* = (0x00000800) # DMA channel 1 transfer select bit 3 
    DMA1TSEL4* = (0x00001000) # DMA channel 1 transfer select bit 4 
  # DMACTL0 Control Bits 
  const 
    DMA0TSEL0_L* = (0x00000001) # DMA channel 0 transfer select bit 0 
    DMA0TSEL1_L* = (0x00000002) # DMA channel 0 transfer select bit 1 
    DMA0TSEL2_L* = (0x00000004) # DMA channel 0 transfer select bit 2 
    DMA0TSEL3_L* = (0x00000008) # DMA channel 0 transfer select bit 3 
    DMA0TSEL4_L* = (0x00000010) # DMA channel 0 transfer select bit 4 
  # DMACTL0 Control Bits 
  const 
    DMA1TSEL0_H* = (0x00000001) # DMA channel 1 transfer select bit 0 
    DMA1TSEL1_H* = (0x00000002) # DMA channel 1 transfer select bit 1 
    DMA1TSEL2_H* = (0x00000004) # DMA channel 1 transfer select bit 2 
    DMA1TSEL3_H* = (0x00000008) # DMA channel 1 transfer select bit 3 
    DMA1TSEL4_H* = (0x00000010) # DMA channel 1 transfer select bit 4 
  # DMACTL01 Control Bits 
  const 
    DMA2TSEL0* = (0x00000001) # DMA channel 2 transfer select bit 0 
    DMA2TSEL1* = (0x00000002) # DMA channel 2 transfer select bit 1 
    DMA2TSEL2* = (0x00000004) # DMA channel 2 transfer select bit 2 
    DMA2TSEL3* = (0x00000008) # DMA channel 2 transfer select bit 3 
    DMA2TSEL4* = (0x00000010) # DMA channel 2 transfer select bit 4 
  # DMACTL01 Control Bits 
  const 
    DMA2TSEL0_L* = (0x00000001) # DMA channel 2 transfer select bit 0 
    DMA2TSEL1_L* = (0x00000002) # DMA channel 2 transfer select bit 1 
    DMA2TSEL2_L* = (0x00000004) # DMA channel 2 transfer select bit 2 
    DMA2TSEL3_L* = (0x00000008) # DMA channel 2 transfer select bit 3 
    DMA2TSEL4_L* = (0x00000010) # DMA channel 2 transfer select bit 4 
  # DMACTL01 Control Bits 
  # DMACTL4 Control Bits 
  const 
    ENNMI* = (0x00000001)     # Enable NMI interruption of DMA 
    ROUNDROBIN* = (0x00000002) # Round-Robin DMA channel priorities 
    DMARMWDIS* = (0x00000004) # Inhibited DMA transfers during read-modify-write CPU operations 
  # DMACTL4 Control Bits 
  const 
    ENNMI_L* = (0x00000001)   # Enable NMI interruption of DMA 
    ROUNDROBIN_L* = (0x00000002) # Round-Robin DMA channel priorities 
    DMARMWDIS_L* = (0x00000004) # Inhibited DMA transfers during read-modify-write CPU operations 
  # DMACTL4 Control Bits 
  # DMAxCTL Control Bits 
  const 
    DMAREQ* = (0x00000001)    # Initiate DMA transfer with DMATSEL 
    DMAABORT* = (0x00000002)  # DMA transfer aborted by NMI 
    DMAIE* = (0x00000004)     # DMA interrupt enable 
    DMAIFG* = (0x00000008)    # DMA interrupt flag 
    DMAEN* = (0x00000010)     # DMA enable 
    DMALEVEL* = (0x00000020)  # DMA level sensitive trigger select 
    DMASRCBYTE* = (0x00000040) # DMA source byte 
    DMADSTBYTE* = (0x00000080) # DMA destination byte 
    DMASRCINCR0* = (0x00000100) # DMA source increment bit 0 
    DMASRCINCR1* = (0x00000200) # DMA source increment bit 1 
    DMADSTINCR0* = (0x00000400) # DMA destination increment bit 0 
    DMADSTINCR1* = (0x00000800) # DMA destination increment bit 1 
    DMADT0* = (0x00001000)    # DMA transfer mode bit 0 
    DMADT1* = (0x00002000)    # DMA transfer mode bit 1 
    DMADT2* = (0x00004000)    # DMA transfer mode bit 2 
  # DMAxCTL Control Bits 
  const 
    DMAREQ_L* = (0x00000001)  # Initiate DMA transfer with DMATSEL 
    DMAABORT_L* = (0x00000002) # DMA transfer aborted by NMI 
    DMAIE_L* = (0x00000004)   # DMA interrupt enable 
    DMAIFG_L* = (0x00000008)  # DMA interrupt flag 
    DMAEN_L* = (0x00000010)   # DMA enable 
    DMALEVEL_L* = (0x00000020) # DMA level sensitive trigger select 
    DMASRCBYTE_L* = (0x00000040) # DMA source byte 
    DMADSTBYTE_L* = (0x00000080) # DMA destination byte 
  # DMAxCTL Control Bits 
  const 
    DMASRCINCR0_H* = (0x00000001) # DMA source increment bit 0 
    DMASRCINCR1_H* = (0x00000002) # DMA source increment bit 1 
    DMADSTINCR0_H* = (0x00000004) # DMA destination increment bit 0 
    DMADSTINCR1_H* = (0x00000008) # DMA destination increment bit 1 
    DMADT0_H* = (0x00000010)  # DMA transfer mode bit 0 
    DMADT1_H* = (0x00000020)  # DMA transfer mode bit 1 
    DMADT2_H* = (0x00000040)  # DMA transfer mode bit 2 
    DMASWDW* = (0x00000000)   # DMA transfer: source word to destination word 
    DMASBDW* = (0x00000040)   # DMA transfer: source byte to destination word 
    DMASWDB* = (0x00000080)   # DMA transfer: source word to destination byte 
    DMASBDB* = (0x000000C0)   # DMA transfer: source byte to destination byte 
    DMASRCINCR_BIT0* = (0x00000000) # DMA source increment 0: source address unchanged 
    DMASRCINCR_BIT1* = (0x00000100) # DMA source increment 1: source address unchanged 
    DMASRCINCR_BIT2* = (0x00000200) # DMA source increment 2: source address decremented 
    DMASRCINCR_BIT3* = (0x00000300) # DMA source increment 3: source address incremented 
    DMADSTINCR_BIT0* = (0x00000000) # DMA destination increment 0: destination address unchanged 
    DMADSTINCR_BIT1* = (0x00000400) # DMA destination increment 1: destination address unchanged 
    DMADSTINCR_BIT2* = (0x00000800) # DMA destination increment 2: destination address decremented 
    DMADSTINCR_BIT3* = (0x00000C00) # DMA destination increment 3: destination address incremented 
    DMADT_BIT0* = (0x00000000)   # DMA transfer mode 0: Single transfer 
    DMADT_BIT1* = (0x00001000)   # DMA transfer mode 1: Block transfer 
    DMADT_BIT2* = (0x00002000)   # DMA transfer mode 2: Burst-Block transfer 
    DMADT_BIT3* = (0x00003000)   # DMA transfer mode 3: Burst-Block transfer 
    DMADT_BIT4* = (0x00004000)   # DMA transfer mode 4: Repeated Single transfer 
    DMADT_BIT5* = (0x00005000)   # DMA transfer mode 5: Repeated Block transfer 
    DMADT_BIT6* = (0x00006000)   # DMA transfer mode 6: Repeated Burst-Block transfer 
    DMADT_BIT7* = (0x00007000)   # DMA transfer mode 7: Repeated Burst-Block transfer 
  # DMAIV Definitions 
  const 
    DMAIV_NONE* = (0x00000000) # No Interrupt pending 
    DMAIV_DMA0IFG* = (0x00000002) # DMA0IFG
    DMAIV_DMA1IFG* = (0x00000004) # DMA1IFG
    DMAIV_DMA2IFG* = (0x00000006) # DMA2IFG
    DMA0TSEL_BIT0* = (0x00000000) # DMA channel 0 transfer select 0:  DMA_REQ (sw) 
    DMA0TSEL_BIT1* = (0x00000001) # DMA channel 0 transfer select 1:  Timer0_A (TA0CCR0.IFG) 
    DMA0TSEL_BIT2* = (0x00000002) # DMA channel 0 transfer select 2:  Timer0_A (TA0CCR2.IFG) 
    DMA0TSEL_BIT3* = (0x00000003) # DMA channel 0 transfer select 3:  Timer1_A (TA1CCR0.IFG) 
    DMA0TSEL_BIT4* = (0x00000004) # DMA channel 0 transfer select 4:  Timer1_A (TA1CCR2.IFG) 
    DMA0TSEL_BIT5* = (0x00000005) # DMA channel 0 transfer select 5:  Timer2_A (TA2CCR0.IFG) 
    DMA0TSEL_BIT6* = (0x00000006) # DMA channel 0 transfer select 6:  Timer2_A (TA2CCR2.IFG) 
    DMA0TSEL_BIT7* = (0x00000007) # DMA channel 0 transfer select 7:  TimerB (TB0CCR0.IFG) 
    DMA0TSEL_BIT8* = (0x00000008) # DMA channel 0 transfer select 8:  TimerB (TB0CCR2.IFG) 
    DMA0TSEL_BIT9* = (0x00000009) # DMA channel 0 transfer select 9:  Reserved 
    DMA0TSEL_BIT10* = (0x0000000A) # DMA channel 0 transfer select 10: Reserved 
    DMA0TSEL_BIT11* = (0x0000000B) # DMA channel 0 transfer select 11: Reserved 
    DMA0TSEL_BIT12* = (0x0000000C) # DMA channel 0 transfer select 12: Reserved 
    DMA0TSEL_BIT13* = (0x0000000D) # DMA channel 0 transfer select 13: Reserved 
    DMA0TSEL_BIT14* = (0x0000000E) # DMA channel 0 transfer select 14: Reserved 
    DMA0TSEL_BIT15* = (0x0000000F) # DMA channel 0 transfer select 15: Reserved 
    DMA0TSEL_BIT16* = (0x00000010) # DMA channel 0 transfer select 16: USCIA0 receive 
    DMA0TSEL_BIT17* = (0x00000011) # DMA channel 0 transfer select 17: USCIA0 transmit 
    DMA0TSEL_BIT18* = (0x00000012) # DMA channel 0 transfer select 18: USCIB0 receive 
    DMA0TSEL_BIT19* = (0x00000013) # DMA channel 0 transfer select 19: USCIB0 transmit 
    DMA0TSEL_BIT20* = (0x00000014) # DMA channel 0 transfer select 20: USCIA1 receive 
    DMA0TSEL_BIT21* = (0x00000015) # DMA channel 0 transfer select 21: USCIA1 transmit 
    DMA0TSEL_BIT22* = (0x00000016) # DMA channel 0 transfer select 22: USCIB1 receive 
    DMA0TSEL_BIT23* = (0x00000017) # DMA channel 0 transfer select 23: USCIB1 transmit 
    DMA0TSEL_BIT24* = (0x00000018) # DMA channel 0 transfer select 24: ADC12IFGx 
    DMA0TSEL_BIT25* = (0x00000019) # DMA channel 0 transfer select 25: Reserved 
    DMA0TSEL_BIT26* = (0x0000001A) # DMA channel 0 transfer select 26: Reserved 
    DMA0TSEL_BIT27* = (0x0000001B) # DMA channel 0 transfer select 27: USB FNRXD 
    DMA0TSEL_BIT28* = (0x0000001C) # DMA channel 0 transfer select 28: USB ready 
    DMA0TSEL_BIT29* = (0x0000001D) # DMA channel 0 transfer select 29: Multiplier ready 
    DMA0TSEL_BIT30* = (0x0000001E) # DMA channel 0 transfer select 30: previous DMA channel DMA2IFG 
    DMA0TSEL_BIT31* = (0x0000001F) # DMA channel 0 transfer select 31: ext. Trigger (DMAE0) 
    DMA1TSEL_BIT0* = (0x00000000) # DMA channel 1 transfer select 0:  DMA_REQ (sw) 
    DMA1TSEL_BIT1* = (0x00000100) # DMA channel 1 transfer select 1:  Timer0_A (TA0CCR0.IFG) 
    DMA1TSEL_BIT2* = (0x00000200) # DMA channel 1 transfer select 2:  Timer0_A (TA0CCR2.IFG) 
    DMA1TSEL_BIT3* = (0x00000300) # DMA channel 1 transfer select 3:  Timer1_A (TA1CCR0.IFG) 
    DMA1TSEL_BIT4* = (0x00000400) # DMA channel 1 transfer select 4:  Timer1_A (TA1CCR2.IFG) 
    DMA1TSEL_BIT5* = (0x00000500) # DMA channel 1 transfer select 5:  Timer2_A (TA2CCR0.IFG) 
    DMA1TSEL_BIT6* = (0x00000600) # DMA channel 1 transfer select 6:  Timer2_A (TA2CCR2.IFG) 
    DMA1TSEL_BIT7* = (0x00000700) # DMA channel 1 transfer select 7:  TimerB (TB0CCR0.IFG) 
    DMA1TSEL_BIT8* = (0x00000800) # DMA channel 1 transfer select 8:  TimerB (TB0CCR2.IFG) 
    DMA1TSEL_BIT9* = (0x00000900) # DMA channel 1 transfer select 9:  Reserved 
    DMA1TSEL_BIT10* = (0x00000A00) # DMA channel 1 transfer select 10: Reserved 
    DMA1TSEL_BIT11* = (0x00000B00) # DMA channel 1 transfer select 11: Reserved 
    DMA1TSEL_BIT12* = (0x00000C00) # DMA channel 1 transfer select 12: Reserved 
    DMA1TSEL_BIT13* = (0x00000D00) # DMA channel 1 transfer select 13: Reserved 
    DMA1TSEL_BIT14* = (0x00000E00) # DMA channel 1 transfer select 14: Reserved 
    DMA1TSEL_BIT15* = (0x00000F00) # DMA channel 1 transfer select 15: Reserved 
    DMA1TSEL_BIT16* = (0x00001000) # DMA channel 1 transfer select 16: USCIA0 receive 
    DMA1TSEL_BIT17* = (0x00001100) # DMA channel 1 transfer select 17: USCIA0 transmit 
    DMA1TSEL_BIT18* = (0x00001200) # DMA channel 1 transfer select 18: USCIB0 receive 
    DMA1TSEL_BIT19* = (0x00001300) # DMA channel 1 transfer select 19: USCIB0 transmit 
    DMA1TSEL_BIT20* = (0x00001400) # DMA channel 1 transfer select 20: USCIA1 receive 
    DMA1TSEL_BIT21* = (0x00001500) # DMA channel 1 transfer select 21: USCIA1 transmit 
    DMA1TSEL_BIT22* = (0x00001600) # DMA channel 1 transfer select 22: USCIB1 receive 
    DMA1TSEL_BIT23* = (0x00001700) # DMA channel 1 transfer select 23: USCIB1 transmit 
    DMA1TSEL_BIT24* = (0x00001800) # DMA channel 1 transfer select 24: ADC12IFGx 
    DMA1TSEL_BIT25* = (0x00001900) # DMA channel 1 transfer select 25: Reserved 
    DMA1TSEL_BIT26* = (0x00001A00) # DMA channel 1 transfer select 26: Reserved 
    DMA1TSEL_BIT27* = (0x00001B00) # DMA channel 1 transfer select 27: USB FNRXD 
    DMA1TSEL_BIT28* = (0x00001C00) # DMA channel 1 transfer select 28: USB ready 
    DMA1TSEL_BIT29* = (0x00001D00) # DMA channel 1 transfer select 29: Multiplier ready 
    DMA1TSEL_BIT30* = (0x00001E00) # DMA channel 1 transfer select 30: previous DMA channel DMA0IFG 
    DMA1TSEL_BIT31* = (0x00001F00) # DMA channel 1 transfer select 31: ext. Trigger (DMAE0) 
    DMA2TSEL_BIT0* = (0x00000000) # DMA channel 2 transfer select 0:  DMA_REQ (sw) 
    DMA2TSEL_BIT1* = (0x00000001) # DMA channel 2 transfer select 1:  Timer0_A (TA0CCR0.IFG) 
    DMA2TSEL_BIT2* = (0x00000002) # DMA channel 2 transfer select 2:  Timer0_A (TA0CCR2.IFG) 
    DMA2TSEL_BIT3* = (0x00000003) # DMA channel 2 transfer select 3:  Timer1_A (TA1CCR0.IFG) 
    DMA2TSEL_BIT4* = (0x00000004) # DMA channel 2 transfer select 4:  Timer1_A (TA1CCR2.IFG) 
    DMA2TSEL_BIT5* = (0x00000005) # DMA channel 2 transfer select 5:  Timer2_A (TA2CCR0.IFG) 
    DMA2TSEL_BIT6* = (0x00000006) # DMA channel 2 transfer select 6:  Timer2_A (TA2CCR2.IFG) 
    DMA2TSEL_BIT7* = (0x00000007) # DMA channel 2 transfer select 7:  TimerB (TB0CCR0.IFG) 
    DMA2TSEL_BIT8* = (0x00000008) # DMA channel 2 transfer select 8:  TimerB (TB0CCR2.IFG) 
    DMA2TSEL_BIT9* = (0x00000009) # DMA channel 2 transfer select 9:  Reserved 
    DMA2TSEL_BIT10* = (0x0000000A) # DMA channel 2 transfer select 10: Reserved 
    DMA2TSEL_BIT11* = (0x0000000B) # DMA channel 2 transfer select 11: Reserved 
    DMA2TSEL_BIT12* = (0x0000000C) # DMA channel 2 transfer select 12: Reserved 
    DMA2TSEL_BIT13* = (0x0000000D) # DMA channel 2 transfer select 13: Reserved 
    DMA2TSEL_BIT14* = (0x0000000E) # DMA channel 2 transfer select 14: Reserved 
    DMA2TSEL_BIT15* = (0x0000000F) # DMA channel 2 transfer select 15: Reserved 
    DMA2TSEL_BIT16* = (0x00000010) # DMA channel 2 transfer select 16: USCIA0 receive 
    DMA2TSEL_BIT17* = (0x00000011) # DMA channel 2 transfer select 17: USCIA0 transmit 
    DMA2TSEL_BIT18* = (0x00000012) # DMA channel 2 transfer select 18: USCIB0 receive 
    DMA2TSEL_BIT19* = (0x00000013) # DMA channel 2 transfer select 19: USCIB0 transmit 
    DMA2TSEL_BIT20* = (0x00000014) # DMA channel 2 transfer select 20: USCIA1 receive 
    DMA2TSEL_BIT21* = (0x00000015) # DMA channel 2 transfer select 21: USCIA1 transmit 
    DMA2TSEL_BIT22* = (0x00000016) # DMA channel 2 transfer select 22: USCIB1 receive 
    DMA2TSEL_BIT23* = (0x00000017) # DMA channel 2 transfer select 23: USCIB1 transmit 
    DMA2TSEL_BIT24* = (0x00000018) # DMA channel 2 transfer select 24: ADC12IFGx 
    DMA2TSEL_BIT25* = (0x00000019) # DMA channel 2 transfer select 25: Reserved 
    DMA2TSEL_BIT26* = (0x0000001A) # DMA channel 2 transfer select 26: Reserved 
    DMA2TSEL_BIT27* = (0x0000001B) # DMA channel 2 transfer select 27: USB FNRXD 
    DMA2TSEL_BIT28* = (0x0000001C) # DMA channel 2 transfer select 28: USB ready 
    DMA2TSEL_BIT29* = (0x0000001D) # DMA channel 2 transfer select 29: Multiplier ready 
    DMA2TSEL_BIT30* = (0x0000001E) # DMA channel 2 transfer select 30: previous DMA channel DMA1IFG 
    DMA2TSEL_BIT31* = (0x0000001F) # DMA channel 2 transfer select 31: ext. Trigger (DMAE0) 
    DMA0TSEL_DMA_REQ* = (0x00000000) # DMA channel 0 transfer select 0:  DMA_REQ (sw) 
    DMA0TSEL_TA0CCR0* = (0x00000001) # DMA channel 0 transfer select 1:  Timer0_A (TA0CCR0.IFG) 
    DMA0TSEL_TA0CCR2* = (0x00000002) # DMA channel 0 transfer select 2:  Timer0_A (TA0CCR2.IFG) 
    DMA0TSEL_TA1CCR0* = (0x00000003) # DMA channel 0 transfer select 3:  Timer1_A (TA1CCR0.IFG) 
    DMA0TSEL_TA1CCR2* = (0x00000004) # DMA channel 0 transfer select 4:  Timer1_A (TA1CCR2.IFG) 
    DMA0TSEL_TA2CCR0* = (0x00000005) # DMA channel 0 transfer select 5:  Timer2_A (TA2CCR0.IFG) 
    DMA0TSEL_TA2CCR2* = (0x00000006) # DMA channel 0 transfer select 6:  Timer2_A (TA2CCR2.IFG) 
    DMA0TSEL_TB0CCR0* = (0x00000007) # DMA channel 0 transfer select 7:  TimerB (TB0CCR0.IFG) 
    DMA0TSEL_TB0CCR2* = (0x00000008) # DMA channel 0 transfer select 8:  TimerB (TB0CCR2.IFG) 
    DMA0TSEL_RES9* = (0x00000009) # DMA channel 0 transfer select 9:  Reserved 
    DMA0TSEL_RES10* = (0x0000000A) # DMA channel 0 transfer select 10: Reserved 
    DMA0TSEL_RES11* = (0x0000000B) # DMA channel 0 transfer select 11: Reserved 
    DMA0TSEL_RES12* = (0x0000000C) # DMA channel 0 transfer select 12: Reserved 
    DMA0TSEL_RES13* = (0x0000000D) # DMA channel 0 transfer select 13: Reserved 
    DMA0TSEL_RES14* = (0x0000000E) # DMA channel 0 transfer select 14: Reserved 
    DMA0TSEL_RES15* = (0x0000000F) # DMA channel 0 transfer select 15: Reserved 
    DMA0TSEL_USCIA0RX* = (0x00000010) # DMA channel 0 transfer select 16: USCIA0 receive 
    DMA0TSEL_USCIA0TX* = (0x00000011) # DMA channel 0 transfer select 17: USCIA0 transmit 
    DMA0TSEL_USCIB0RX* = (0x00000012) # DMA channel 0 transfer select 18: USCIB0 receive 
    DMA0TSEL_USCIB0TX* = (0x00000013) # DMA channel 0 transfer select 19: USCIB0 transmit 
    DMA0TSEL_USCIA1RX* = (0x00000014) # DMA channel 0 transfer select 20: USCIA1 receive 
    DMA0TSEL_USCIA1TX* = (0x00000015) # DMA channel 0 transfer select 21: USCIA1 transmit 
    DMA0TSEL_USCIB1RX* = (0x00000016) # DMA channel 0 transfer select 22: USCIB1 receive 
    DMA0TSEL_USCIB1TX* = (0x00000017) # DMA channel 0 transfer select 23: USCIB1 transmit 
    DMA0TSEL_ADC10IFG* = (0x00000018) # DMA channel 0 transfer select 24: ADC10IFGx 
    DMA0TSEL_RES25* = (0x00000019) # DMA channel 0 transfer select 25: Reserved 
    DMA0TSEL_RES26* = (0x0000001A) # DMA channel 0 transfer select 26: Reserved 
    DMA0TSEL_USB_FNRXD* = (0x0000001B) # DMA channel 0 transfer select 27: USB FNRXD 
    DMA0TSEL_USB_READY* = (0x0000001C) # DMA channel 0 transfer select 28: USB ready 
    DMA0TSEL_MPY* = (0x0000001D) # DMA channel 0 transfer select 29: Multiplier ready 
    DMA0TSEL_DMA2IFG* = (0x0000001E) # DMA channel 0 transfer select 30: previous DMA channel DMA2IFG 
    DMA0TSEL_DMAE0* = (0x0000001F) # DMA channel 0 transfer select 31: ext. Trigger (DMAE0) 
    DMA1TSEL_DMA_REQ* = (0x00000000) # DMA channel 1 transfer select 0:  DMA_REQ (sw) 
    DMA1TSEL_TA0CCR0* = (0x00000100) # DMA channel 1 transfer select 1:  Timer0_A (TA0CCR0.IFG) 
    DMA1TSEL_TA0CCR2* = (0x00000200) # DMA channel 1 transfer select 2:  Timer0_A (TA0CCR2.IFG) 
    DMA1TSEL_TA1CCR0* = (0x00000300) # DMA channel 1 transfer select 3:  Timer1_A (TA1CCR0.IFG) 
    DMA1TSEL_TA1CCR2* = (0x00000400) # DMA channel 1 transfer select 4:  Timer1_A (TA1CCR2.IFG) 
    DMA1TSEL_TA2CCR0* = (0x00000500) # DMA channel 1 transfer select 5:  Timer2_A (TA2CCR0.IFG) 
    DMA1TSEL_TA2CCR2* = (0x00000600) # DMA channel 1 transfer select 6:  Timer2_A (TA2CCR2.IFG) 
    DMA1TSEL_TB0CCR0* = (0x00000700) # DMA channel 1 transfer select 7:  TimerB (TB0CCR0.IFG) 
    DMA1TSEL_TB0CCR2* = (0x00000800) # DMA channel 1 transfer select 8:  TimerB (TB0CCR2.IFG) 
    DMA1TSEL_RES9* = (0x00000900) # DMA channel 1 transfer select 9:  Reserved 
    DMA1TSEL_RES10* = (0x00000A00) # DMA channel 1 transfer select 10: Reserved 
    DMA1TSEL_RES11* = (0x00000B00) # DMA channel 1 transfer select 11: Reserved 
    DMA1TSEL_RES12* = (0x00000C00) # DMA channel 1 transfer select 12: Reserved 
    DMA1TSEL_RES13* = (0x00000D00) # DMA channel 1 transfer select 13: Reserved 
    DMA1TSEL_RES14* = (0x00000E00) # DMA channel 1 transfer select 14: Reserved 
    DMA1TSEL_RES15* = (0x00000F00) # DMA channel 1 transfer select 15: Reserved 
    DMA1TSEL_USCIA0RX* = (0x00001000) # DMA channel 1 transfer select 16: USCIA0 receive 
    DMA1TSEL_USCIA0TX* = (0x00001100) # DMA channel 1 transfer select 17: USCIA0 transmit 
    DMA1TSEL_USCIB0RX* = (0x00001200) # DMA channel 1 transfer select 18: USCIB0 receive 
    DMA1TSEL_USCIB0TX* = (0x00001300) # DMA channel 1 transfer select 19: USCIB0 transmit 
    DMA1TSEL_USCIA1RX* = (0x00001400) # DMA channel 1 transfer select 20: USCIA1 receive 
    DMA1TSEL_USCIA1TX* = (0x00001500) # DMA channel 1 transfer select 21: USCIA1 transmit 
    DMA1TSEL_USCIB1RX* = (0x00001600) # DMA channel 1 transfer select 22: USCIB1 receive 
    DMA1TSEL_USCIB1TX* = (0x00001700) # DMA channel 1 transfer select 23: USCIB1 transmit 
    DMA1TSEL_ADC10IFG* = (0x00001800) # DMA channel 1 transfer select 24: ADC10IFGx 
    DMA1TSEL_RES25* = (0x00001900) # DMA channel 1 transfer select 25: Reserved 
    DMA1TSEL_RES26* = (0x00001A00) # DMA channel 1 transfer select 26: Reserved 
    DMA1TSEL_USB_FNRXD* = (0x00001B00) # DMA channel 1 transfer select 27: USB FNRXD 
    DMA1TSEL_USB_READY* = (0x00001C00) # DMA channel 1 transfer select 28: USB ready 
    DMA1TSEL_MPY* = (0x00001D00) # DMA channel 1 transfer select 29: Multiplier ready 
    DMA1TSEL_DMA0IFG* = (0x00001E00) # DMA channel 1 transfer select 30: previous DMA channel DMA0IFG 
    DMA1TSEL_DMAE0* = (0x00001F00) # DMA channel 1 transfer select 31: ext. Trigger (DMAE0) 
    DMA2TSEL_DMA_REQ* = (0x00000000) # DMA channel 2 transfer select 0:  DMA_REQ (sw) 
    DMA2TSEL_TA0CCR0* = (0x00000001) # DMA channel 2 transfer select 1:  Timer0_A (TA0CCR0.IFG) 
    DMA2TSEL_TA0CCR2* = (0x00000002) # DMA channel 2 transfer select 2:  Timer0_A (TA0CCR2.IFG) 
    DMA2TSEL_TA1CCR0* = (0x00000003) # DMA channel 2 transfer select 3:  Timer1_A (TA1CCR0.IFG) 
    DMA2TSEL_TA1CCR2* = (0x00000004) # DMA channel 2 transfer select 4:  Timer1_A (TA1CCR2.IFG) 
    DMA2TSEL_TA2CCR0* = (0x00000005) # DMA channel 2 transfer select 5:  Timer2_A (TA2CCR0.IFG) 
    DMA2TSEL_TA2CCR2* = (0x00000006) # DMA channel 2 transfer select 6:  Timer2_A (TA2CCR2.IFG) 
    DMA2TSEL_TB0CCR0* = (0x00000007) # DMA channel 2 transfer select 7:  TimerB (TB0CCR0.IFG) 
    DMA2TSEL_TB0CCR2* = (0x00000008) # DMA channel 2 transfer select 8:  TimerB (TB0CCR2.IFG) 
    DMA2TSEL_RES9* = (0x00000009) # DMA channel 2 transfer select 9:  Reserved 
    DMA2TSEL_RES10* = (0x0000000A) # DMA channel 2 transfer select 10: Reserved 
    DMA2TSEL_RES11* = (0x0000000B) # DMA channel 2 transfer select 11: Reserved 
    DMA2TSEL_RES12* = (0x0000000C) # DMA channel 2 transfer select 12: Reserved 
    DMA2TSEL_RES13* = (0x0000000D) # DMA channel 2 transfer select 13: Reserved 
    DMA2TSEL_RES14* = (0x0000000E) # DMA channel 2 transfer select 14: Reserved 
    DMA2TSEL_RES15* = (0x0000000F) # DMA channel 2 transfer select 15: Reserved 
    DMA2TSEL_USCIA0RX* = (0x00000010) # DMA channel 2 transfer select 16: USCIA0 receive 
    DMA2TSEL_USCIA0TX* = (0x00000011) # DMA channel 2 transfer select 17: USCIA0 transmit 
    DMA2TSEL_USCIB0RX* = (0x00000012) # DMA channel 2 transfer select 18: USCIB0 receive 
    DMA2TSEL_USCIB0TX* = (0x00000013) # DMA channel 2 transfer select 19: USCIB0 transmit 
    DMA2TSEL_USCIA1RX* = (0x00000014) # DMA channel 2 transfer select 20: USCIA1 receive 
    DMA2TSEL_USCIA1TX* = (0x00000015) # DMA channel 2 transfer select 21: USCIA1 transmit 
    DMA2TSEL_USCIB1RX* = (0x00000016) # DMA channel 2 transfer select 22: USCIB1 receive 
    DMA2TSEL_USCIB1TX* = (0x00000017) # DMA channel 2 transfer select 23: USCIB1 transmit 
    DMA2TSEL_ADC10IFG* = (0x00000018) # DMA channel 2 transfer select 24: ADC10IFGx 
    DMA2TSEL_RES25* = (0x00000019) # DMA channel 2 transfer select 25: Reserved 
    DMA2TSEL_RES26* = (0x0000001A) # DMA channel 2 transfer select 26: Reserved 
    DMA2TSEL_USB_FNRXD* = (0x0000001B) # DMA channel 2 transfer select 27: USB FNRXD 
    DMA2TSEL_USB_READY* = (0x0000001C) # DMA channel 2 transfer select 28: USB ready 
    DMA2TSEL_MPY* = (0x0000001D) # DMA channel 2 transfer select 29: Multiplier ready 
    DMA2TSEL_DMA1IFG* = (0x0000001E) # DMA channel 2 transfer select 30: previous DMA channel DMA1IFG 
    DMA2TSEL_DMAE0* = (0x0000001F) # DMA channel 2 transfer select 31: ext. Trigger (DMAE0) 
  #************************************************************
  # Flash Memory
  #***********************************************************
  const 
    MSP430_HAS_FLASH* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_FLASH* = 0x00000140
    FCTL1_ADDR* = 0x00000140
  sfrb(FCTL1_L, FCTL1_ADDR)
  sfrb(FCTL1_H, FCTL1_ADDR + 1)
  sfrw(FCTL1, FCTL1_ADDR)
  #sfrbw    FCTL2               (0x0142)  /* FLASH Control 2 */
  const 
    FCTL3_ADDR* = 0x00000144
  sfrb(FCTL3_L, FCTL3_ADDR)
  sfrb(FCTL3_H, FCTL3_ADDR + 1)
  sfrw(FCTL3, FCTL3_ADDR)
  const 
    FCTL4_ADDR* = 0x00000146
  sfrb(FCTL4_L, FCTL4_ADDR)
  sfrb(FCTL4_H, FCTL4_ADDR + 1)
  sfrw(FCTL4, FCTL4_ADDR)
  const 
    FRPW* = (0x00009600)      # Flash password returned by read 
    FWPW* = (0x0000A500)      # Flash password for write 
    FXPW* = (0x00003300)      # for use with XOR instruction 
    FRKEY* = (0x00009600)     # (legacy definition) Flash key returned by read 
    FWKEY* = (0x0000A500)     # (legacy definition) Flash key for write 
    FXKEY* = (0x00003300)     # (legacy definition) for use with XOR instruction 
  # FCTL1 Control Bits 
  ##define RESERVED            (0x0001)  /* Reserved */
  const 
    ERASE* = (0x00000002)     # Enable bit for Flash segment erase 
    MERAS* = (0x00000004)     # Enable bit for Flash mass erase 
  ##define RESERVED            (0x0008)  /* Reserved */
  ##define RESERVED            (0x0010)  /* Reserved */
  const 
    SWRT* = (0x00000020)      # Smart Write enable 
    WRT* = (0x00000040)       # Enable bit for Flash write 
    BLKWRT* = (0x00000080)    # Enable bit for Flash segment write 
  # FCTL1 Control Bits 
  ##define RESERVED            (0x0001)  /* Reserved */
  const 
    ERASE_L* = (0x00000002)   # Enable bit for Flash segment erase 
    MERAS_L* = (0x00000004)   # Enable bit for Flash mass erase 
  ##define RESERVED            (0x0008)  /* Reserved */
  ##define RESERVED            (0x0010)  /* Reserved */
  const 
    SWRT_L* = (0x00000020)    # Smart Write enable 
    WRT_L* = (0x00000040)     # Enable bit for Flash write 
    BLKWRT_L* = (0x00000080)  # Enable bit for Flash segment write 
  # FCTL1 Control Bits 
  ##define RESERVED            (0x0001)  /* Reserved */
  ##define RESERVED            (0x0008)  /* Reserved */
  ##define RESERVED            (0x0010)  /* Reserved */
  # FCTL3 Control Bits 
  const 
    BUSY* = (0x00000001)      # Flash busy: 1 
    KEYV* = (0x00000002)      # Flash Key violation flag 
    ACCVIFG* = (0x00000004)   # Flash Access violation flag 
    WAIT* = (0x00000008)      # Wait flag for segment write 
    LOCK* = (0x00000010)      # Lock bit: 1 - Flash is locked (read only) 
    EMEX* = (0x00000020)      # Flash Emergency Exit 
    LOCKA* = (0x00000040)     # Segment A Lock bit: read = 1 - Segment is locked (read only) 
  ##define RESERVED            (0x0080)  /* Reserved */
  # FCTL3 Control Bits 
  const 
    BUSY_L* = (0x00000001)    # Flash busy: 1 
    KEYV_L* = (0x00000002)    # Flash Key violation flag 
    ACCVIFG_L* = (0x00000004) # Flash Access violation flag 
    WAIT_L* = (0x00000008)    # Wait flag for segment write 
    LOCK_L* = (0x00000010)    # Lock bit: 1 - Flash is locked (read only) 
    EMEX_L* = (0x00000020)    # Flash Emergency Exit 
    LOCKA_L* = (0x00000040)   # Segment A Lock bit: read = 1 - Segment is locked (read only) 
  ##define RESERVED            (0x0080)  /* Reserved */
  # FCTL3 Control Bits 
  ##define RESERVED            (0x0080)  /* Reserved */
  # FCTL4 Control Bits 
  const 
    VPE* = (0x00000001)       # Voltage Changed during Program Error Flag 
    MGR0* = (0x00000010)      # Marginal read 0 mode. 
    MGR1* = (0x00000020)      # Marginal read 1 mode. 
    LOCKINFO* = (0x00000080)  # Lock INFO Memory bit: read = 1 - Segment is locked (read only) 
  # FCTL4 Control Bits 
  const 
    VPE_L* = (0x00000001)     # Voltage Changed during Program Error Flag 
    MGR0_L* = (0x00000010)    # Marginal read 0 mode. 
    MGR1_L* = (0x00000020)    # Marginal read 1 mode. 
    LOCKINFO_L* = (0x00000080) # Lock INFO Memory bit: read = 1 - Segment is locked (read only) 
  # FCTL4 Control Bits 
  #***********************************************************
  # HARDWARE MULTIPLIER 32Bit
  #**********************************************************
  const 
    MSP430_HAS_MPY32* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_MPY32* = 0x000004C0
    MPY_ADDR* = 0x000004C0
  sfrb(MPY_L, MPY_ADDR)
  sfrb(MPY_H, MPY_ADDR + 1)
  sfrw(MPY, MPY_ADDR)
  const 
    MPYS_ADDR* = 0x000004C2
  sfrb(MPYS_L, MPYS_ADDR)
  sfrb(MPYS_H, MPYS_ADDR + 1)
  sfrw(MPYS, MPYS_ADDR)
  const 
    MAC_ADDR* = 0x000004C4
  sfrb(MAC_L, MAC_ADDR)
  sfrb(MAC_H, MAC_ADDR + 1)
  sfrw(MAC, MAC_ADDR)
  const 
    MACS_ADDR* = 0x000004C6
  sfrb(MACS_L, MACS_ADDR)
  sfrb(MACS_H, MACS_ADDR + 1)
  sfrw(MACS, MACS_ADDR)
  const 
    OP2_ADDR* = 0x000004C8
  sfrw(OP2, OP2_ADDR)
  const 
    RESLO_ADDR* = 0x000004CA
  sfrb(RESLO_L, RESLO_ADDR)
  sfrb(RESLO_H, RESLO_ADDR + 1)
  sfrw(RESLO, RESLO_ADDR)
  const 
    RESHI_ADDR* = 0x000004CC
  sfrb(RESHI_L, RESHI_ADDR)
  sfrb(RESHI_H, RESHI_ADDR + 1)
  sfrw(RESHI, RESHI_ADDR)
  const 
    SUMEXT_ADDR* = 0x000004CE
  const_sfrb(SUMEXT_L, SUMEXT_ADDR)
  const_sfrb(SUMEXT_H, SUMEXT_ADDR + 1)
  const_sfrw(SUMEXT, SUMEXT_ADDR)
  const 
    MPY32L_ADDR* = 0x000004D0
  sfrb(MPY32L_L, MPY32L_ADDR)
  sfrb(MPY32L_H, MPY32L_ADDR + 1)
  sfrw(MPY32L, MPY32L_ADDR)
  const 
    MPY32H_ADDR* = 0x000004D2
  sfrb(MPY32H_L, MPY32H_ADDR)
  sfrb(MPY32H_H, MPY32H_ADDR + 1)
  sfrw(MPY32H, MPY32H_ADDR)
  const 
    MPYS32L_ADDR* = 0x000004D4
  sfrb(MPYS32L_L, MPYS32L_ADDR)
  sfrb(MPYS32L_H, MPYS32L_ADDR + 1)
  sfrw(MPYS32L, MPYS32L_ADDR)
  const 
    MPYS32H_ADDR* = 0x000004D6
  sfrb(MPYS32H_L, MPYS32H_ADDR)
  sfrb(MPYS32H_H, MPYS32H_ADDR + 1)
  sfrw(MPYS32H, MPYS32H_ADDR)
  const 
    MAC32L_ADDR* = 0x000004D8
  sfrb(MAC32L_L, MAC32L_ADDR)
  sfrb(MAC32L_H, MAC32L_ADDR + 1)
  sfrw(MAC32L, MAC32L_ADDR)
  const 
    MAC32H_ADDR* = 0x000004DA
  sfrb(MAC32H_L, MAC32H_ADDR)
  sfrb(MAC32H_H, MAC32H_ADDR + 1)
  sfrw(MAC32H, MAC32H_ADDR)
  const 
    MACS32L_ADDR* = 0x000004DC
  sfrb(MACS32L_L, MACS32L_ADDR)
  sfrb(MACS32L_H, MACS32L_ADDR + 1)
  sfrw(MACS32L, MACS32L_ADDR)
  const 
    MACS32H_ADDR* = 0x000004DE
  sfrb(MACS32H_L, MACS32H_ADDR)
  sfrb(MACS32H_H, MACS32H_ADDR + 1)
  sfrw(MACS32H, MACS32H_ADDR)
  const 
    OP2L_ADDR* = 0x000004E0
  sfrb(OP2L_L, OP2L_ADDR)
  sfrb(OP2L_H, OP2L_ADDR + 1)
  sfrw(OP2L, OP2L_ADDR)
  const 
    OP2H_ADDR* = 0x000004E2
  sfrb(OP2H_L, OP2H_ADDR)
  sfrb(OP2H_H, OP2H_ADDR + 1)
  sfrw(OP2H, OP2H_ADDR)
  const 
    RES0_ADDR* = 0x000004E4
  sfrb(RES0_L, RES0_ADDR)
  sfrb(RES0_H, RES0_ADDR + 1)
  sfrw(RES0, RES0_ADDR)
  const 
    RES1_ADDR* = 0x000004E6
  sfrb(RES1_L, RES1_ADDR)
  sfrb(RES1_H, RES1_ADDR + 1)
  sfrw(RES1, RES1_ADDR)
  const 
    RES2_ADDR* = 0x000004E8
  sfrb(RES2_L, RES2_ADDR)
  sfrb(RES2_H, RES2_ADDR + 1)
  sfrw(RES2, RES2_ADDR)
  const 
    RES3_ADDR* = 0x000004EA
  sfrb(RES3_L, RES3_ADDR)
  sfrb(RES3_H, RES3_ADDR + 1)
  sfrw(RES3, RES3_ADDR)
  const 
    MPY32CTL0_ADDR* = 0x000004EC
  sfrb(MPY32CTL0_L, MPY32CTL0_ADDR)
  sfrb(MPY32CTL0_H, MPY32CTL0_ADDR + 1)
  sfrw(MPY32CTL0, MPY32CTL0_ADDR)
  #const 
  template MPY_B* = MPY_L
  template MPYS_B* = MPYS_L
  template MAC_B* = MAC_L
  template MACS_B* = MACS_L
  template OP2_B* = OP2_L
  template MPY32L_B* = MPY32L_L
  template MPY32H_B* = MPY32H_L
  template MPYS32L_B* = MPYS32L_L
  template MPYS32H_B* = MPYS32H_L
  template MAC32L_B* = MAC32L_L
  template MAC32H_B* = MAC32H_L
  template MACS32L_B* = MACS32L_L
  template MACS32H_B* = MACS32H_L
  template OP2L_B* = OP2L_L
  template OP2H_B* = OP2H_L
  # MPY32CTL0 Control Bits 
  const 
    MPYC* = (0x00000001)      # Carry of the multiplier 
  ##define RESERVED            (0x0002)  /* Reserved */
  const 
    MPYFRAC* = (0x00000004)   # Fractional mode 
    MPYSAT* = (0x00000008)    # Saturation mode 
    MPYM0* = (0x00000010)     # Multiplier mode Bit:0 
    MPYM1* = (0x00000020)     # Multiplier mode Bit:1 
    OP1_BIT32* = (0x00000040)    # Bit-width of operand 1 0:16Bit / 1:32Bit 
    OP2_BIT32* = (0x00000080)    # Bit-width of operand 2 0:16Bit / 1:32Bit 
    MPYDLYWRTEN* = (0x00000100) # Delayed write enable 
    MPYDLY32* = (0x00000200)  # Delayed write mode 
  # MPY32CTL0 Control Bits 
  const 
    MPYC_L* = (0x00000001)    # Carry of the multiplier 
  ##define RESERVED            (0x0002)  /* Reserved */
  const 
    MPYFRAC_L* = (0x00000004) # Fractional mode 
    MPYSAT_L* = (0x00000008)  # Saturation mode 
    MPYM0_L* = (0x00000010)   # Multiplier mode Bit:0 
    MPYM1_L* = (0x00000020)   # Multiplier mode Bit:1 
    OP1_32_L* = (0x00000040)  # Bit-width of operand 1 0:16Bit / 1:32Bit 
    OP2_32_L* = (0x00000080)  # Bit-width of operand 2 0:16Bit / 1:32Bit 
  # MPY32CTL0 Control Bits 
  ##define RESERVED            (0x0002)  /* Reserved */
  const 
    MPYDLYWRTEN_H* = (0x00000001) # Delayed write enable 
    MPYDLY32_H* = (0x00000002) # Delayed write mode 
    MPYM_BIT0* = (0x00000000)    # Multiplier mode: MPY 
    MPYM_BIT1* = (0x00000010)    # Multiplier mode: MPYS 
    MPYM_BIT2* = (0x00000020)    # Multiplier mode: MAC 
    MPYM_BIT3* = (0x00000030)    # Multiplier mode: MACS 
    MPYM_MPY* = (0x00000000) # Multiplier mode: MPY 
    MPYM_MPYS* = (0x00000010) # Multiplier mode: MPYS 
    MPYM_MAC* = (0x00000020) # Multiplier mode: MAC 
    MPYM_MACS* = (0x00000030) # Multiplier mode: MACS 
  #***********************************************************
  # DIGITAL I/O Port1/2 Pull up / Pull down Resistors
  #**********************************************************
  const 
    MSP430_HAS_PORT1_R* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PORT1_R* = 0x00000200
    MSP430_HAS_PORT2_R* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PORT2_R* = 0x00000200
    MSP430_HAS_PORTA_R* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PORTA_R* = 0x00000200
    PAIN_ADDR* = 0x00000200
  const_sfrb(PAIN_L, PAIN_ADDR)
  const_sfrb(PAIN_H, PAIN_ADDR + 1)
  const_sfrw(PAIN, PAIN_ADDR)
  const 
    PAOUT_ADDR* = 0x00000202
  sfrb(PAOUT_L, PAOUT_ADDR)
  sfrb(PAOUT_H, PAOUT_ADDR + 1)
  sfrw(PAOUT, PAOUT_ADDR)
  const 
    PADIR_ADDR* = 0x00000204
  sfrb(PADIR_L, PADIR_ADDR)
  sfrb(PADIR_H, PADIR_ADDR + 1)
  sfrw(PADIR, PADIR_ADDR)
  const 
    PAREN_ADDR* = 0x00000206
  sfrb(PAREN_L, PAREN_ADDR)
  sfrb(PAREN_H, PAREN_ADDR + 1)
  sfrw(PAREN, PAREN_ADDR)
  const 
    PADS_ADDR* = 0x00000208
  sfrb(PADS_L, PADS_ADDR)
  sfrb(PADS_H, PADS_ADDR + 1)
  sfrw(PADS, PADS_ADDR)
  const 
    PASEL_ADDR* = 0x0000020A
  sfrb(PASEL_L, PASEL_ADDR)
  sfrb(PASEL_H, PASEL_ADDR + 1)
  sfrw(PASEL, PASEL_ADDR)
  const 
    PAIES_ADDR* = 0x00000218
  sfrb(PAIES_L, PAIES_ADDR)
  sfrb(PAIES_H, PAIES_ADDR + 1)
  sfrw(PAIES, PAIES_ADDR)
  const 
    PAIE_ADDR* = 0x0000021A
  sfrb(PAIE_L, PAIE_ADDR)
  sfrb(PAIE_H, PAIE_ADDR + 1)
  sfrw(PAIE, PAIE_ADDR)
  const 
    PAIFG_ADDR* = 0x0000021C
  sfrb(PAIFG_L, PAIFG_ADDR)
  sfrb(PAIFG_H, PAIFG_ADDR + 1)
  sfrw(PAIFG, PAIFG_ADDR)
  const 
    P1IV_ADDR* = 0x0000020E
  sfrw(P1IV, P1IV_ADDR)
  const 
    P2IV_ADDR* = 0x0000021E
  sfrw(P2IV, P2IV_ADDR)
  #const 
  template P1IN* = (PAIN_L)          # Port 1 Input 
  template P1OUT* = (PAOUT_L)        # Port 1 Output 
  template P1DIR* = (PADIR_L)        # Port 1 Direction 
  template P1REN* = (PAREN_L)        # Port 1 Resistor Enable 
  template P1DS* = (PADS_L)          # Port 1 Resistor Drive Strenght 
  template P1SEL* = (PASEL_L)        # Port 1 Selection 
  template P1IES* = (PAIES_L)        # Port 1 Interrupt Edge Select 
  template P1IE* = (PAIE_L)          # Port 1 Interrupt Enable 
  template P1IFG* = (PAIFG_L)        # Port 1 Interrupt Flag 
  #Definitions for P1IV
  const 
    P1IV_NONE* = (0x00000000) # No Interrupt pending 
    P1IV_P1IFG0* = (0x00000002) # P1IV P1IFG.0 
    P1IV_P1IFG1* = (0x00000004) # P1IV P1IFG.1 
    P1IV_P1IFG2* = (0x00000006) # P1IV P1IFG.2 
    P1IV_P1IFG3* = (0x00000008) # P1IV P1IFG.3 
    P1IV_P1IFG4* = (0x0000000A) # P1IV P1IFG.4 
    P1IV_P1IFG5* = (0x0000000C) # P1IV P1IFG.5 
    P1IV_P1IFG6* = (0x0000000E) # P1IV P1IFG.6 
    P1IV_P1IFG7* = (0x00000010) # P1IV P1IFG.7 
  template P2IN* = (PAIN_H)          # Port 2 Input 
  template P2OUT* = (PAOUT_H)        # Port 2 Output 
  template P2DIR* = (PADIR_H)        # Port 2 Direction 
  template P2REN* = (PAREN_H)        # Port 2 Resistor Enable 
  template P2DS* = (PADS_H)          # Port 2 Resistor Drive Strenght 
  template P2SEL* = (PASEL_H)        # Port 2 Selection 
  template P2IES* = (PAIES_H)        # Port 2 Interrupt Edge Select 
  template P2IE* = (PAIE_H)          # Port 2 Interrupt Enable 
  template P2IFG* = (PAIFG_H)        # Port 2 Interrupt Flag 
  #Definitions for P2IV
  const 
    P2IV_NONE* = (0x00000000) # No Interrupt pending 
    P2IV_P2IFG0* = (0x00000002) # P2IV P2IFG.0 
    P2IV_P2IFG1* = (0x00000004) # P2IV P2IFG.1 
    P2IV_P2IFG2* = (0x00000006) # P2IV P2IFG.2 
    P2IV_P2IFG3* = (0x00000008) # P2IV P2IFG.3 
    P2IV_P2IFG4* = (0x0000000A) # P2IV P2IFG.4 
    P2IV_P2IFG5* = (0x0000000C) # P2IV P2IFG.5 
    P2IV_P2IFG6* = (0x0000000E) # P2IV P2IFG.6 
    P2IV_P2IFG7* = (0x00000010) # P2IV P2IFG.7 
  #***********************************************************
  # DIGITAL I/O Port3/4 Pull up / Pull down Resistors
  #**********************************************************
  const 
    MSP430_HAS_PORT3_R* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PORT3_R* = 0x00000220
    MSP430_HAS_PORT4_R* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PORT4_R* = 0x00000220
    MSP430_HAS_PORTB_R* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PORTB_R* = 0x00000220
    PBIN_ADDR* = 0x00000220
  const_sfrb(PBIN_L, PBIN_ADDR)
  const_sfrb(PBIN_H, PBIN_ADDR + 1)
  const_sfrw(PBIN, PBIN_ADDR)
  const 
    PBOUT_ADDR* = 0x00000222
  sfrb(PBOUT_L, PBOUT_ADDR)
  sfrb(PBOUT_H, PBOUT_ADDR + 1)
  sfrw(PBOUT, PBOUT_ADDR)
  const 
    PBDIR_ADDR* = 0x00000224
  sfrb(PBDIR_L, PBDIR_ADDR)
  sfrb(PBDIR_H, PBDIR_ADDR + 1)
  sfrw(PBDIR, PBDIR_ADDR)
  const 
    PBREN_ADDR* = 0x00000226
  sfrb(PBREN_L, PBREN_ADDR)
  sfrb(PBREN_H, PBREN_ADDR + 1)
  sfrw(PBREN, PBREN_ADDR)
  const 
    PBDS_ADDR* = 0x00000228
  sfrb(PBDS_L, PBDS_ADDR)
  sfrb(PBDS_H, PBDS_ADDR + 1)
  sfrw(PBDS, PBDS_ADDR)
  const 
    PBSEL_ADDR* = 0x0000022A
  sfrb(PBSEL_L, PBSEL_ADDR)
  sfrb(PBSEL_H, PBSEL_ADDR + 1)
  sfrw(PBSEL, PBSEL_ADDR)
  #const 
  template P3IN* = (PBIN_L)          # Port 3 Input 
  template P3OUT* = (PBOUT_L)        # Port 3 Output 
  template P3DIR* = (PBDIR_L)        # Port 3 Direction 
  template P3REN* = (PBREN_L)        # Port 3 Resistor Enable 
  template P3DS* = (PBDS_L)          # Port 3 Resistor Drive Strenght 
  template P3SEL* = (PBSEL_L)        # Port 3 Selection 
  template P4IN* = (PBIN_H)          # Port 4 Input 
  template P4OUT* = (PBOUT_H)        # Port 4 Output 
  template P4DIR* = (PBDIR_H)        # Port 4 Direction 
  template P4REN* = (PBREN_H)        # Port 4 Resistor Enable 
  template P4DS* = (PBDS_H)          # Port 4 Resistor Drive Strenght 
  template P4SEL* = (PBSEL_H)        # Port 4 Selection 
  #***********************************************************
  # DIGITAL I/O Port5/6 Pull up / Pull down Resistors
  #**********************************************************
  const 
    MSP430_HAS_PORT5_R* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PORT5_R* = 0x00000240
    MSP430_HAS_PORT6_R* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PORT6_R* = 0x00000240
    MSP430_HAS_PORTC_R* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PORTC_R* = 0x00000240
    PCIN_ADDR* = 0x00000240
  const_sfrb(PCIN_L, PCIN_ADDR)
  const_sfrb(PCIN_H, PCIN_ADDR + 1)
  const_sfrw(PCIN, PCIN_ADDR)
  const 
    PCOUT_ADDR* = 0x00000242
  sfrb(PCOUT_L, PCOUT_ADDR)
  sfrb(PCOUT_H, PCOUT_ADDR + 1)
  sfrw(PCOUT, PCOUT_ADDR)
  const 
    PCDIR_ADDR* = 0x00000244
  sfrb(PCDIR_L, PCDIR_ADDR)
  sfrb(PCDIR_H, PCDIR_ADDR + 1)
  sfrw(PCDIR, PCDIR_ADDR)
  const 
    PCREN_ADDR* = 0x00000246
  sfrb(PCREN_L, PCREN_ADDR)
  sfrb(PCREN_H, PCREN_ADDR + 1)
  sfrw(PCREN, PCREN_ADDR)
  const 
    PCDS_ADDR* = 0x00000248
  sfrb(PCDS_L, PCDS_ADDR)
  sfrb(PCDS_H, PCDS_ADDR + 1)
  sfrw(PCDS, PCDS_ADDR)
  const 
    PCSEL_ADDR* = 0x0000024A
  sfrb(PCSEL_L, PCSEL_ADDR)
  sfrb(PCSEL_H, PCSEL_ADDR + 1)
  sfrw(PCSEL, PCSEL_ADDR)
  #const 
  template P5IN* = (PCIN_L)          # Port 5 Input 
  template P5OUT* = (PCOUT_L)        # Port 5 Output 
  template P5DIR* = (PCDIR_L)        # Port 5 Direction 
  template P5REN* = (PCREN_L)        # Port 5 Resistor Enable 
  template P5DS* = (PCDS_L)          # Port 5 Resistor Drive Strenght 
  template P5SEL* = (PCSEL_L)        # Port 5 Selection 
  template P6IN* = (PCIN_H)          # Port 6 Input 
  template P6OUT* = (PCOUT_H)        # Port 6 Output 
  template P6DIR* = (PCDIR_H)        # Port 6 Direction 
  template P6REN* = (PCREN_H)        # Port 6 Resistor Enable 
  template P6DS* = (PCDS_H)          # Port 6 Resistor Drive Strenght 
  template P6SEL* = (PCSEL_H)        # Port 6 Selection 
  #***********************************************************
  # DIGITAL I/O PortJ Pull up / Pull down Resistors
  #**********************************************************
  const 
    MSP430_HAS_PORTJ_R* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PORTJ_R* = 0x00000320
    PJIN_ADDR* = 0x00000320
  const_sfrb(PJIN_L, PJIN_ADDR)
  const_sfrb(PJIN_H, PJIN_ADDR + 1)
  const_sfrw(PJIN, PJIN_ADDR)
  const 
    PJOUT_ADDR* = 0x00000322
  sfrb(PJOUT_L, PJOUT_ADDR)
  sfrb(PJOUT_H, PJOUT_ADDR + 1)
  sfrw(PJOUT, PJOUT_ADDR)
  const 
    PJDIR_ADDR* = 0x00000324
  sfrb(PJDIR_L, PJDIR_ADDR)
  sfrb(PJDIR_H, PJDIR_ADDR + 1)
  sfrw(PJDIR, PJDIR_ADDR)
  const 
    PJREN_ADDR* = 0x00000326
  sfrb(PJREN_L, PJREN_ADDR)
  sfrb(PJREN_H, PJREN_ADDR + 1)
  sfrw(PJREN, PJREN_ADDR)
  const 
    PJDS_ADDR* = 0x00000328
  sfrb(PJDS_L, PJDS_ADDR)
  sfrb(PJDS_H, PJDS_ADDR + 1)
  sfrw(PJDS, PJDS_ADDR)
  #***********************************************************
  # PORT MAPPING CONTROLLER
  #**********************************************************
  const 
    MSP430_HAS_PORT_MAPPING* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PORT_MAPPING* = 0x000001C0
    PMAPKEYID_ADDR* = 0x000001C0
  sfrb(PMAPKEYID_L, PMAPKEYID_ADDR)
  sfrb(PMAPKEYID_H, PMAPKEYID_ADDR + 1)
  sfrw(PMAPKEYID, PMAPKEYID_ADDR)
  const 
    PMAPCTL_ADDR* = 0x000001C2
  sfrb(PMAPCTL_L, PMAPCTL_ADDR)
  sfrb(PMAPCTL_H, PMAPCTL_ADDR + 1)
  sfrw(PMAPCTL, PMAPCTL_ADDR)
  const 
    PMAPKEY* = (0x00002D52)   # Port Mapping Key 
  template PMAPPWD* = PMAPKEYID
  # PMAPCTL Control Bits 
  const 
    PMAPLOCKED* = (0x00000001) # Port Mapping Lock bit. Read only 
    PMAPRECFG* = (0x00000002) # Port Mapping re-configuration control bit 
  # PMAPCTL Control Bits 
  const 
    PMAPLOCKED_L* = (0x00000001) # Port Mapping Lock bit. Read only 
    PMAPRECFG_L* = (0x00000002) # Port Mapping re-configuration control bit 
  # PMAPCTL Control Bits 
  #***********************************************************
  # PORT 4 MAPPING CONTROLLER
  #**********************************************************
  const 
    MSP430_HAS_PORT4_MAPPING* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PORT4_MAPPING* = 0x000001E0
    P4MAP01_ADDR* = 0x000001E0
  sfrb(P4MAP01_L, P4MAP01_ADDR)
  sfrb(P4MAP01_H, P4MAP01_ADDR + 1)
  sfrw(P4MAP01, P4MAP01_ADDR)
  const 
    P4MAP23_ADDR* = 0x000001E2
  sfrb(P4MAP23_L, P4MAP23_ADDR)
  sfrb(P4MAP23_H, P4MAP23_ADDR + 1)
  sfrw(P4MAP23, P4MAP23_ADDR)
  const 
    P4MAP45_ADDR* = 0x000001E4
  sfrb(P4MAP45_L, P4MAP45_ADDR)
  sfrb(P4MAP45_H, P4MAP45_ADDR + 1)
  sfrw(P4MAP45, P4MAP45_ADDR)
  const 
    P4MAP67_ADDR* = 0x000001E6
  sfrb(P4MAP67_L, P4MAP67_ADDR)
  sfrb(P4MAP67_H, P4MAP67_ADDR + 1)
  sfrw(P4MAP67, P4MAP67_ADDR)
  template P4MAP0* = P4MAP01_L
  template P4MAP1* = P4MAP01_H
  template P4MAP2* = P4MAP23_L
  template P4MAP3* = P4MAP23_H
  template P4MAP4* = P4MAP45_L
  template P4MAP5* = P4MAP45_H
  template P4MAP6* = P4MAP67_L
  template P4MAP7* = P4MAP67_H
  const 
    PM_NONE* = 0
    PM_CBOUT0* = 1
    PM_TB0CLK* = 1
    PM_ADC10CLK* = 2
    PM_DMAE0* = 2
    PM_SVMOUT* = 3
    PM_TB0OUTH* = 3
    PM_TB0CCR0A* = 4
    PM_TB0CCR1A* = 5
    PM_TB0CCR2A* = 6
    PM_TB0CCR3A* = 7
    PM_TB0CCR4A* = 8
    PM_TB0CCR5A* = 9
    PM_TB0CCR6A* = 10
    PM_UCA1RXD* = 11
    PM_UCA1SOMI* = 11
    PM_UCA1TXD* = 12
    PM_UCA1SIMO* = 12
    PM_UCA1CLK* = 13
    PM_UCB1STE* = 13
    PM_UCB1SOMI* = 14
    PM_UCB1SCL* = 14
    PM_UCB1SIMO* = 15
    PM_UCB1SDA* = 15
    PM_UCB1CLK* = 16
    PM_UCA1STE* = 16
    PM_CBOUT1* = 17
    PM_MCLK* = 18
    PM_RTCCLK* = 19
    PM_UCA0RXD* = 20
    PM_UCA0SOMI* = 20
    PM_UCA0TXD* = 21
    PM_UCA0SIMO* = 21
    PM_UCA0CLK* = 22
    PM_UCB0STE* = 22
    PM_UCB0SOMI* = 23
    PM_UCB0SCL* = 23
    PM_UCB0SIMO* = 24
    PM_UCB0SDA* = 24
    PM_UCB0CLK* = 25
    PM_UCA0STE* = 25
    PM_ANALOG* = 31
  #***********************************************************
  # PMM - Power Management System
  #**********************************************************
  const 
    MSP430_HAS_PMM* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_PMM* = 0x00000120
    PMMCTL0_ADDR* = 0x00000120
  sfrb(PMMCTL0_L, PMMCTL0_ADDR)
  sfrb(PMMCTL0_H, PMMCTL0_ADDR + 1)
  sfrw(PMMCTL0, PMMCTL0_ADDR)
  const 
    PMMCTL1_ADDR* = 0x00000122
  sfrb(PMMCTL1_L, PMMCTL1_ADDR)
  sfrb(PMMCTL1_H, PMMCTL1_ADDR + 1)
  sfrw(PMMCTL1, PMMCTL1_ADDR)
  const 
    SVSMHCTL_ADDR* = 0x00000124
  sfrb(SVSMHCTL_L, SVSMHCTL_ADDR)
  sfrb(SVSMHCTL_H, SVSMHCTL_ADDR + 1)
  sfrw(SVSMHCTL, SVSMHCTL_ADDR)
  const 
    SVSMLCTL_ADDR* = 0x00000126
  sfrb(SVSMLCTL_L, SVSMLCTL_ADDR)
  sfrb(SVSMLCTL_H, SVSMLCTL_ADDR + 1)
  sfrw(SVSMLCTL, SVSMLCTL_ADDR)
  const 
    SVSMIO_ADDR* = 0x00000128
  sfrb(SVSMIO_L, SVSMIO_ADDR)
  sfrb(SVSMIO_H, SVSMIO_ADDR + 1)
  sfrw(SVSMIO, SVSMIO_ADDR)
  const 
    PMMIFG_ADDR* = 0x0000012C
  sfrb(PMMIFG_L, PMMIFG_ADDR)
  sfrb(PMMIFG_H, PMMIFG_ADDR + 1)
  sfrw(PMMIFG, PMMIFG_ADDR)
  const 
    PMMRIE_ADDR* = 0x0000012E
  sfrb(PMMRIE_L, PMMRIE_ADDR)
  sfrb(PMMRIE_H, PMMRIE_ADDR + 1)
  sfrw(PMMRIE, PMMRIE_ADDR)
  const 
    PM5CTL0_ADDR* = 0x00000130
  sfrb(PM5CTL0_L, PM5CTL0_ADDR)
  sfrb(PM5CTL0_H, PM5CTL0_ADDR + 1)
  sfrw(PM5CTL0, PM5CTL0_ADDR)
  const 
    PMMPW* = (0x0000A500)     # PMM Register Write Password 
    PMMPW_H* = (0x000000A5)   # PMM Register Write Password for high word access 
  # PMMCTL0 Control Bits 
  const 
    PMMCOREV0* = (0x00000001) # PMM Core Voltage Bit: 0 
    PMMCOREV1* = (0x00000002) # PMM Core Voltage Bit: 1 
    PMMSWBOR* = (0x00000004)  # PMM Software BOR 
    PMMSWPOR* = (0x00000008)  # PMM Software POR 
    PMMREGOFF* = (0x00000010) # PMM Turn Regulator off 
    PMMHPMRE* = (0x00000080)  # PMM Global High Power Module Request Enable 
  # PMMCTL0 Control Bits 
  const 
    PMMCOREV0_L* = (0x00000001) # PMM Core Voltage Bit: 0 
    PMMCOREV1_L* = (0x00000002) # PMM Core Voltage Bit: 1 
    PMMSWBOR_L* = (0x00000004) # PMM Software BOR 
    PMMSWPOR_L* = (0x00000008) # PMM Software POR 
    PMMREGOFF_L* = (0x00000010) # PMM Turn Regulator off 
    PMMHPMRE_L* = (0x00000080) # PMM Global High Power Module Request Enable 
  # PMMCTL0 Control Bits 
  const 
    PMMCOREV_BIT0* = (0x00000000) # PMM Core Voltage 0 (1.35V) 
    PMMCOREV_BIT1* = (0x00000001) # PMM Core Voltage 1 (1.55V) 
    PMMCOREV_BIT2* = (0x00000002) # PMM Core Voltage 2 (1.75V) 
    PMMCOREV_BIT3* = (0x00000003) # PMM Core Voltage 3 (1.85V) 
  # PMMCTL1 Control Bits 
  const 
    PMMREFMD* = (0x00000001)  # PMM Reference Mode 
    PMMCMD0* = (0x00000010)   # PMM Voltage Regulator Current Mode Bit: 0 
    PMMCMD1* = (0x00000020)   # PMM Voltage Regulator Current Mode Bit: 1 
  # PMMCTL1 Control Bits 
  const 
    PMMREFMD_L* = (0x00000001) # PMM Reference Mode 
    PMMCMD0_L* = (0x00000010) # PMM Voltage Regulator Current Mode Bit: 0 
    PMMCMD1_L* = (0x00000020) # PMM Voltage Regulator Current Mode Bit: 1 
  # PMMCTL1 Control Bits 
  # SVSMHCTL Control Bits 
  const 
    SVSMHRRL0* = (0x00000001) # SVS and SVM high side Reset Release Voltage Level Bit: 0 
    SVSMHRRL1* = (0x00000002) # SVS and SVM high side Reset Release Voltage Level Bit: 1 
    SVSMHRRL2* = (0x00000004) # SVS and SVM high side Reset Release Voltage Level Bit: 2 
    SVSMHDLYST* = (0x00000008) # SVS and SVM high side delay status 
    SVSHMD* = (0x00000010)    # SVS high side mode 
    SVSMHEVM* = (0x00000040)  # SVS and SVM high side event mask 
    SVSMHACE* = (0x00000080)  # SVS and SVM high side auto control enable 
    SVSHRVL0* = (0x00000100)  # SVS high side reset voltage level Bit: 0 
    SVSHRVL1* = (0x00000200)  # SVS high side reset voltage level Bit: 1 
    SVSHE* = (0x00000400)     # SVS high side enable 
    SVSHFP* = (0x00000800)    # SVS high side full performace mode 
    SVMHOVPE* = (0x00001000)  # SVM high side over-voltage enable 
    SVMHE* = (0x00004000)     # SVM high side enable 
    SVMHFP* = (0x00008000)    # SVM high side full performace mode 
  # SVSMHCTL Control Bits 
  const 
    SVSMHRRL0_L* = (0x00000001) # SVS and SVM high side Reset Release Voltage Level Bit: 0 
    SVSMHRRL1_L* = (0x00000002) # SVS and SVM high side Reset Release Voltage Level Bit: 1 
    SVSMHRRL2_L* = (0x00000004) # SVS and SVM high side Reset Release Voltage Level Bit: 2 
    SVSMHDLYST_L* = (0x00000008) # SVS and SVM high side delay status 
    SVSHMD_L* = (0x00000010)  # SVS high side mode 
    SVSMHEVM_L* = (0x00000040) # SVS and SVM high side event mask 
    SVSMHACE_L* = (0x00000080) # SVS and SVM high side auto control enable 
  # SVSMHCTL Control Bits 
  const 
    SVSHRVL0_H* = (0x00000001) # SVS high side reset voltage level Bit: 0 
    SVSHRVL1_H* = (0x00000002) # SVS high side reset voltage level Bit: 1 
    SVSHE_H* = (0x00000004)   # SVS high side enable 
    SVSHFP_H* = (0x00000008)  # SVS high side full performace mode 
    SVMHOVPE_H* = (0x00000010) # SVM high side over-voltage enable 
    SVMHE_H* = (0x00000040)   # SVM high side enable 
    SVMHFP_H* = (0x00000080)  # SVM high side full performace mode 
    SVSMHRRL_BIT0* = (0x00000000) # SVS and SVM high side Reset Release Voltage Level 0 
    SVSMHRRL_BIT1* = (0x00000001) # SVS and SVM high side Reset Release Voltage Level 1 
    SVSMHRRL_BIT2* = (0x00000002) # SVS and SVM high side Reset Release Voltage Level 2 
    SVSMHRRL_BIT3* = (0x00000003) # SVS and SVM high side Reset Release Voltage Level 3 
    SVSMHRRL_BIT4* = (0x00000004) # SVS and SVM high side Reset Release Voltage Level 4 
    SVSMHRRL_BIT5* = (0x00000005) # SVS and SVM high side Reset Release Voltage Level 5 
    SVSMHRRL_BIT6* = (0x00000006) # SVS and SVM high side Reset Release Voltage Level 6 
    SVSMHRRL_BIT7* = (0x00000007) # SVS and SVM high side Reset Release Voltage Level 7 
    SVSHRVL_BIT0* = (0x00000000) # SVS high side Reset Release Voltage Level 0 
    SVSHRVL_BIT1* = (0x00000100) # SVS high side Reset Release Voltage Level 1 
    SVSHRVL_BIT2* = (0x00000200) # SVS high side Reset Release Voltage Level 2 
    SVSHRVL_BIT3* = (0x00000300) # SVS high side Reset Release Voltage Level 3 
  # SVSMLCTL Control Bits 
  const 
    SVSMLRRL0* = (0x00000001) # SVS and SVM low side Reset Release Voltage Level Bit: 0 
    SVSMLRRL1* = (0x00000002) # SVS and SVM low side Reset Release Voltage Level Bit: 1 
    SVSMLRRL2* = (0x00000004) # SVS and SVM low side Reset Release Voltage Level Bit: 2 
    SVSMLDLYST* = (0x00000008) # SVS and SVM low side delay status 
    SVSLMD* = (0x00000010)    # SVS low side mode 
    SVSMLEVM* = (0x00000040)  # SVS and SVM low side event mask 
    SVSMLACE* = (0x00000080)  # SVS and SVM low side auto control enable 
    SVSLRVL0* = (0x00000100)  # SVS low side reset voltage level Bit: 0 
    SVSLRVL1* = (0x00000200)  # SVS low side reset voltage level Bit: 1 
    SVSLE* = (0x00000400)     # SVS low side enable 
    SVSLFP* = (0x00000800)    # SVS low side full performace mode 
    SVMLOVPE* = (0x00001000)  # SVM low side over-voltage enable 
    SVMLE* = (0x00004000)     # SVM low side enable 
    SVMLFP* = (0x00008000)    # SVM low side full performace mode 
  # SVSMLCTL Control Bits 
  const 
    SVSMLRRL0_L* = (0x00000001) # SVS and SVM low side Reset Release Voltage Level Bit: 0 
    SVSMLRRL1_L* = (0x00000002) # SVS and SVM low side Reset Release Voltage Level Bit: 1 
    SVSMLRRL2_L* = (0x00000004) # SVS and SVM low side Reset Release Voltage Level Bit: 2 
    SVSMLDLYST_L* = (0x00000008) # SVS and SVM low side delay status 
    SVSLMD_L* = (0x00000010)  # SVS low side mode 
    SVSMLEVM_L* = (0x00000040) # SVS and SVM low side event mask 
    SVSMLACE_L* = (0x00000080) # SVS and SVM low side auto control enable 
  # SVSMLCTL Control Bits 
  const 
    SVSLRVL0_H* = (0x00000001) # SVS low side reset voltage level Bit: 0 
    SVSLRVL1_H* = (0x00000002) # SVS low side reset voltage level Bit: 1 
    SVSLE_H* = (0x00000004)   # SVS low side enable 
    SVSLFP_H* = (0x00000008)  # SVS low side full performace mode 
    SVMLOVPE_H* = (0x00000010) # SVM low side over-voltage enable 
    SVMLE_H* = (0x00000040)   # SVM low side enable 
    SVMLFP_H* = (0x00000080)  # SVM low side full performace mode 
    SVSMLRRL_BIT0* = (0x00000000) # SVS and SVM low side Reset Release Voltage Level 0 
    SVSMLRRL_BIT1* = (0x00000001) # SVS and SVM low side Reset Release Voltage Level 1 
    SVSMLRRL_BIT2* = (0x00000002) # SVS and SVM low side Reset Release Voltage Level 2 
    SVSMLRRL_BIT3* = (0x00000003) # SVS and SVM low side Reset Release Voltage Level 3 
    SVSMLRRL_BIT4* = (0x00000004) # SVS and SVM low side Reset Release Voltage Level 4 
    SVSMLRRL_BIT5* = (0x00000005) # SVS and SVM low side Reset Release Voltage Level 5 
    SVSMLRRL_BIT6* = (0x00000006) # SVS and SVM low side Reset Release Voltage Level 6 
    SVSMLRRL_BIT7* = (0x00000007) # SVS and SVM low side Reset Release Voltage Level 7 
    SVSLRVL_BIT0* = (0x00000000) # SVS low side Reset Release Voltage Level 0 
    SVSLRVL_BIT1* = (0x00000100) # SVS low side Reset Release Voltage Level 1 
    SVSLRVL_BIT2* = (0x00000200) # SVS low side Reset Release Voltage Level 2 
    SVSLRVL_BIT3* = (0x00000300) # SVS low side Reset Release Voltage Level 3 
  # SVSMIO Control Bits 
  const 
    SVMLOE* = (0x00000008)    # SVM low side output enable 
    SVMLVLROE* = (0x00000010) # SVM low side voltage level reached output enable 
    SVMOUTPOL* = (0x00000020) # SVMOUT pin polarity 
    SVMHOE* = (0x00000800)    # SVM high side output enable 
    SVMHVLROE* = (0x00001000) # SVM high side voltage level reached output enable 
  # SVSMIO Control Bits 
  const 
    SVMLOE_L* = (0x00000008)  # SVM low side output enable 
    SVMLVLROE_L* = (0x00000010) # SVM low side voltage level reached output enable 
    SVMOUTPOL_L* = (0x00000020) # SVMOUT pin polarity 
  # SVSMIO Control Bits 
  const 
    SVMHOE_H* = (0x00000008)  # SVM high side output enable 
    SVMHVLROE_H* = (0x00000010) # SVM high side voltage level reached output enable 
  # PMMIFG Control Bits 
  const 
    SVSMLDLYIFG* = (0x00000001) # SVS and SVM low side Delay expired interrupt flag 
    SVMLIFG* = (0x00000002)   # SVM low side interrupt flag 
    SVMLVLRIFG* = (0x00000004) # SVM low side Voltage Level Reached interrupt flag 
    SVSMHDLYIFG* = (0x00000010) # SVS and SVM high side Delay expired interrupt flag 
    SVMHIFG* = (0x00000020)   # SVM high side interrupt flag 
    SVMHVLRIFG* = (0x00000040) # SVM high side Voltage Level Reached interrupt flag 
    PMMBORIFG* = (0x00000100) # PMM Software BOR interrupt flag 
    PMMRSTIFG* = (0x00000200) # PMM RESET pin interrupt flag 
    PMMPORIFG* = (0x00000400) # PMM Software POR interrupt flag 
    SVSHIFG* = (0x00001000)   # SVS low side interrupt flag 
    SVSLIFG* = (0x00002000)   # SVS high side interrupt flag 
    PMMLPM5IFG* = (0x00008000) # LPM5 indication Flag 
  # PMMIFG Control Bits 
  const 
    SVSMLDLYIFG_L* = (0x00000001) # SVS and SVM low side Delay expired interrupt flag 
    SVMLIFG_L* = (0x00000002) # SVM low side interrupt flag 
    SVMLVLRIFG_L* = (0x00000004) # SVM low side Voltage Level Reached interrupt flag 
    SVSMHDLYIFG_L* = (0x00000010) # SVS and SVM high side Delay expired interrupt flag 
    SVMHIFG_L* = (0x00000020) # SVM high side interrupt flag 
    SVMHVLRIFG_L* = (0x00000040) # SVM high side Voltage Level Reached interrupt flag 
  # PMMIFG Control Bits 
  const 
    PMMBORIFG_H* = (0x00000001) # PMM Software BOR interrupt flag 
    PMMRSTIFG_H* = (0x00000002) # PMM RESET pin interrupt flag 
    PMMPORIFG_H* = (0x00000004) # PMM Software POR interrupt flag 
    SVSHIFG_H* = (0x00000010) # SVS low side interrupt flag 
    SVSLIFG_H* = (0x00000020) # SVS high side interrupt flag 
    PMMLPM5IFG_H* = (0x00000080) # LPM5 indication Flag 
  template PMMRSTLPM5IFG* = PMMLPM5IFG
  # PMMIE and RESET Control Bits 
  const 
    SVSMLDLYIE* = (0x00000001) # SVS and SVM low side Delay expired interrupt enable 
    SVMLIE* = (0x00000002)    # SVM low side interrupt enable 
    SVMLVLRIE* = (0x00000004) # SVM low side Voltage Level Reached interrupt enable 
    SVSMHDLYIE* = (0x00000010) # SVS and SVM high side Delay expired interrupt enable 
    SVMHIE* = (0x00000020)    # SVM high side interrupt enable 
    SVMHVLRIE* = (0x00000040) # SVM high side Voltage Level Reached interrupt enable 
    SVSLPE* = (0x00000100)    # SVS low side POR enable 
    SVMLVLRPE* = (0x00000200) # SVM low side Voltage Level reached POR enable 
    SVSHPE* = (0x00001000)    # SVS high side POR enable 
    SVMHVLRPE* = (0x00002000) # SVM high side Voltage Level reached POR enable 
  # PMMIE and RESET Control Bits 
  const 
    SVSMLDLYIE_L* = (0x00000001) # SVS and SVM low side Delay expired interrupt enable 
    SVMLIE_L* = (0x00000002)  # SVM low side interrupt enable 
    SVMLVLRIE_L* = (0x00000004) # SVM low side Voltage Level Reached interrupt enable 
    SVSMHDLYIE_L* = (0x00000010) # SVS and SVM high side Delay expired interrupt enable 
    SVMHIE_L* = (0x00000020)  # SVM high side interrupt enable 
    SVMHVLRIE_L* = (0x00000040) # SVM high side Voltage Level Reached interrupt enable 
  # PMMIE and RESET Control Bits 
  const 
    SVSLPE_H* = (0x00000001)  # SVS low side POR enable 
    SVMLVLRPE_H* = (0x00000002) # SVM low side Voltage Level reached POR enable 
    SVSHPE_H* = (0x00000010)  # SVS high side POR enable 
    SVMHVLRPE_H* = (0x00000020) # SVM high side Voltage Level reached POR enable 
  # PM5CTL0 Power Mode 5 Control Bits 
  const 
    LOCKLPM5* = (0x00000001)  # Lock I/O pin configuration upon entry/exit to/from LPM5 
  # PM5CTL0 Power Mode 5 Control Bits 
  const 
    LOCKLPM5_L* = (0x00000001) # Lock I/O pin configuration upon entry/exit to/from LPM5 
  # PM5CTL0 Power Mode 5 Control Bits 
  #const 
  template LOCKIO* = LOCKLPM5
  #************************************************************
  # RAM Control Module
  #***********************************************************
  const 
    MSP430_HAS_RC* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_RC* = 0x00000158
    RCCTL0_ADDR* = 0x00000158
  sfrb(RCCTL0_L, RCCTL0_ADDR)
  sfrb(RCCTL0_H, RCCTL0_ADDR + 1)
  sfrw(RCCTL0, RCCTL0_ADDR)
  # RCCTL0 Control Bits 
  const 
    RCRS0OFF* = (0x00000001)  # RAM Controller RAM Sector 0 Off 
    RCRS1OFF* = (0x00000002)  # RAM Controller RAM Sector 1 Off 
    RCRS2OFF* = (0x00000004)  # RAM Controller RAM Sector 2 Off 
    RCRS3OFF* = (0x00000008)  # RAM Controller RAM Sector 3 Off 
    RCRS7OFF* = (0x00000080)  # RAM Controller RAM Sector 7 (USB) Off 
  # RCCTL0 Control Bits 
  const 
    RCRS0OFF_L* = (0x00000001) # RAM Controller RAM Sector 0 Off 
    RCRS1OFF_L* = (0x00000002) # RAM Controller RAM Sector 1 Off 
    RCRS2OFF_L* = (0x00000004) # RAM Controller RAM Sector 2 Off 
    RCRS3OFF_L* = (0x00000008) # RAM Controller RAM Sector 3 Off 
    RCRS7OFF_L* = (0x00000080) # RAM Controller RAM Sector 7 (USB) Off 
  # RCCTL0 Control Bits 
  const 
    RCKEY* = (0x00005A00)
  #***********************************************************
  # Shared Reference
  #**********************************************************
  const 
    MSP430_HAS_REF* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_REF* = 0x000001B0
    REFCTL0_ADDR* = 0x000001B0
  sfrb(REFCTL0_L, REFCTL0_ADDR)
  sfrb(REFCTL0_H, REFCTL0_ADDR + 1)
  sfrw(REFCTL0, REFCTL0_ADDR)
  # REFCTL0 Control Bits 
  const 
    REFON* = (0x00000001)     # REF Reference On 
    REFOUT* = (0x00000002)    # REF Reference output Buffer On 
  ##define RESERVED            (0x0004)  /* Reserved */
  const 
    REFTCOFF* = (0x00000008)  # REF Temp.Sensor off 
    REFVSEL0* = (0x00000010)  # REF Reference Voltage Level Select Bit:0 
    REFVSEL1* = (0x00000020)  # REF Reference Voltage Level Select Bit:1 
  ##define RESERVED            (0x0040)  /* Reserved */
  const 
    REFMSTR* = (0x00000080)   # REF Master Control 
    REFGENACT* = (0x00000100) # REF Reference generator active 
    REFBGACT* = (0x00000200)  # REF Reference bandgap active 
    REFGENBUSY* = (0x00000400) # REF Reference generator busy 
    BGMODE* = (0x00000800)    # REF Bandgap mode 
  ##define RESERVED            (0x1000)  /* Reserved */
  ##define RESERVED            (0x2000)  /* Reserved */
  ##define RESERVED            (0x4000)  /* Reserved */
  ##define RESERVED            (0x8000)  /* Reserved */
  # REFCTL0 Control Bits 
  const 
    REFON_L* = (0x00000001)   # REF Reference On 
    REFOUT_L* = (0x00000002)  # REF Reference output Buffer On 
  ##define RESERVED            (0x0004)  /* Reserved */
  const 
    REFTCOFF_L* = (0x00000008) # REF Temp.Sensor off 
    REFVSEL0_L* = (0x00000010) # REF Reference Voltage Level Select Bit:0 
    REFVSEL1_L* = (0x00000020) # REF Reference Voltage Level Select Bit:1 
  ##define RESERVED            (0x0040)  /* Reserved */
  const 
    REFMSTR_L* = (0x00000080) # REF Master Control 
  ##define RESERVED            (0x1000)  /* Reserved */
  ##define RESERVED            (0x2000)  /* Reserved */
  ##define RESERVED            (0x4000)  /* Reserved */
  ##define RESERVED            (0x8000)  /* Reserved */
  # REFCTL0 Control Bits 
  ##define RESERVED            (0x0004)  /* Reserved */
  ##define RESERVED            (0x0040)  /* Reserved */
  const 
    REFGENACT_H* = (0x00000001) # REF Reference generator active 
    REFBGACT_H* = (0x00000002) # REF Reference bandgap active 
    REFGENBUSY_H* = (0x00000004) # REF Reference generator busy 
    BGMODE_H* = (0x00000008)  # REF Bandgap mode 
  ##define RESERVED            (0x1000)  /* Reserved */
  ##define RESERVED            (0x2000)  /* Reserved */
  ##define RESERVED            (0x4000)  /* Reserved */
  ##define RESERVED            (0x8000)  /* Reserved */
  const 
    REFVSEL_BIT0* = (0x00000000) # REF Reference Voltage Level Select 1.5V 
    REFVSEL_BIT1* = (0x00000010) # REF Reference Voltage Level Select 2.0V 
    REFVSEL_BIT2* = (0x00000020) # REF Reference Voltage Level Select 2.5V 
    REFVSEL_BIT3* = (0x00000030) # REF Reference Voltage Level Select 2.5V 
  #***********************************************************
  # Real Time Clock
  #**********************************************************
  const 
    MSP430_HAS_RTC* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_RTC* = 0x000004A0
    RTCCTL01_ADDR* = 0x000004A0
  sfrb(RTCCTL01_L, RTCCTL01_ADDR)
  sfrb(RTCCTL01_H, RTCCTL01_ADDR + 1)
  sfrw(RTCCTL01, RTCCTL01_ADDR)
  const 
    RTCCTL23_ADDR* = 0x000004A2
  sfrb(RTCCTL23_L, RTCCTL23_ADDR)
  sfrb(RTCCTL23_H, RTCCTL23_ADDR + 1)
  sfrw(RTCCTL23, RTCCTL23_ADDR)
  const 
    RTCPS0CTL_ADDR* = 0x000004A8
  sfrb(RTCPS0CTL_L, RTCPS0CTL_ADDR)
  sfrb(RTCPS0CTL_H, RTCPS0CTL_ADDR + 1)
  sfrw(RTCPS0CTL, RTCPS0CTL_ADDR)
  const 
    RTCPS1CTL_ADDR* = 0x000004AA
  sfrb(RTCPS1CTL_L, RTCPS1CTL_ADDR)
  sfrb(RTCPS1CTL_H, RTCPS1CTL_ADDR + 1)
  sfrw(RTCPS1CTL, RTCPS1CTL_ADDR)
  const 
    RTCPS_ADDR* = 0x000004AC
  sfrb(RTCPS_L, RTCPS_ADDR)
  sfrb(RTCPS_H, RTCPS_ADDR + 1)
  sfrw(RTCPS, RTCPS_ADDR)
  const 
    RTCIV_ADDR* = 0x000004AE
  sfrw(RTCIV, RTCIV_ADDR)
  const 
    RTCTIM0_ADDR* = 0x000004B0
  sfrb(RTCTIM0_L, RTCTIM0_ADDR)
  sfrb(RTCTIM0_H, RTCTIM0_ADDR + 1)
  sfrw(RTCTIM0, RTCTIM0_ADDR)
  const 
    RTCTIM1_ADDR* = 0x000004B2
  sfrb(RTCTIM1_L, RTCTIM1_ADDR)
  sfrb(RTCTIM1_H, RTCTIM1_ADDR + 1)
  sfrw(RTCTIM1, RTCTIM1_ADDR)
  const 
    RTCDATE_ADDR* = 0x000004B4
  sfrb(RTCDATE_L, RTCDATE_ADDR)
  sfrb(RTCDATE_H, RTCDATE_ADDR + 1)
  sfrw(RTCDATE, RTCDATE_ADDR)
  const 
    RTCYEAR_ADDR* = 0x000004B6
  sfrb(RTCYEAR_L, RTCYEAR_ADDR)
  sfrb(RTCYEAR_H, RTCYEAR_ADDR + 1)
  sfrw(RTCYEAR, RTCYEAR_ADDR)
  const 
    RTCAMINHR_ADDR* = 0x000004B8
  sfrb(RTCAMINHR_L, RTCAMINHR_ADDR)
  sfrb(RTCAMINHR_H, RTCAMINHR_ADDR + 1)
  sfrw(RTCAMINHR, RTCAMINHR_ADDR)
  const 
    RTCADOWDAY_ADDR* = 0x000004BA
  sfrb(RTCADOWDAY_L, RTCADOWDAY_ADDR)
  sfrb(RTCADOWDAY_H, RTCADOWDAY_ADDR + 1)
  sfrw(RTCADOWDAY, RTCADOWDAY_ADDR)
  #const 
  template RTCCTL0* = RTCCTL01_L
  template RTCCTL1* = RTCCTL01_H
  template RTCCTL2* = RTCCTL23_L
  template RTCCTL3* = RTCCTL23_H
  template RTCNT12* = RTCTIM0
  template RTCNT34* = RTCTIM1
  template RTCNT1* = RTCTIM0_L
  template RTCNT2* = RTCTIM0_H
  template RTCNT3* = RTCTIM1_L
  template RTCNT4* = RTCTIM1_H
  template RTCSEC* = RTCTIM0_L
  template RTCMIN* = RTCTIM0_H
  template RTCHOUR* = RTCTIM1_L
  template RTCDOW* = RTCTIM1_H
  template RTCDAY* = RTCDATE_L
  template RTCMON* = RTCDATE_H
    # RTCYEARL* = RTCYEAR_L
    # RTCYEARH* = RTCYEAR_H
  template RT0PS* = RTCPS_L
  template RT1PS* = RTCPS_H
  template RTCAMIN* = RTCAMINHR_L
  template RTCAHOUR* = RTCAMINHR_H
  template RTCADOW* = RTCADOWDAY_L
  template RTCADAY* = RTCADOWDAY_H
  # RTCCTL01 Control Bits 
  const 
    RTCBCD* = (0x00008000)    # RTC BCD  0:Binary / 1:BCD 
    RTCHOLD* = (0x00004000)   # RTC Hold 
    RTCMODE* = (0x00002000)   # RTC Mode 0:Counter / 1: Calendar 
    RTCRDY* = (0x00001000)    # RTC Ready 
    RTCSSEL1* = (0x00000800)  # RTC Source Select 1 
    RTCSSEL0* = (0x00000400)  # RTC Source Select 0 
    RTCTEV1* = (0x00000200)   # RTC Time Event 1 
    RTCTEV0* = (0x00000100)   # RTC Time Event 0 
  ##define Reserved          (0x0080)
  const 
    RTCTEVIE* = (0x00000040)  # RTC Time Event Interrupt Enable Flag 
    RTCAIE* = (0x00000020)    # RTC Alarm Interrupt Enable Flag 
    RTCRDYIE* = (0x00000010)  # RTC Ready Interrupt Enable Flag 
  ##define Reserved          (0x0008)
  const 
    RTCTEVIFG* = (0x00000004) # RTC Time Event Interrupt Flag 
    RTCAIFG* = (0x00000002)   # RTC Alarm Interrupt Flag 
    RTCRDYIFG* = (0x00000001) # RTC Ready Interrupt Flag 
  # RTCCTL01 Control Bits 
  ##define Reserved          (0x0080)
  const 
    RTCTEVIE_L* = (0x00000040) # RTC Time Event Interrupt Enable Flag 
    RTCAIE_L* = (0x00000020)  # RTC Alarm Interrupt Enable Flag 
    RTCRDYIE_L* = (0x00000010) # RTC Ready Interrupt Enable Flag 
  ##define Reserved          (0x0008)
  const 
    RTCTEVIFG_L* = (0x00000004) # RTC Time Event Interrupt Flag 
    RTCAIFG_L* = (0x00000002) # RTC Alarm Interrupt Flag 
    RTCRDYIFG_L* = (0x00000001) # RTC Ready Interrupt Flag 
  # RTCCTL01 Control Bits 
  const 
    RTCBCD_H* = (0x00000080)  # RTC BCD  0:Binary / 1:BCD 
    RTCHOLD_H* = (0x00000040) # RTC Hold 
    RTCMODE_H* = (0x00000020) # RTC Mode 0:Counter / 1: Calendar 
    RTCRDY_H* = (0x00000010)  # RTC Ready 
    RTCSSEL1_H* = (0x00000008) # RTC Source Select 1 
    RTCSSEL0_H* = (0x00000004) # RTC Source Select 0 
    RTCTEV1_H* = (0x00000002) # RTC Time Event 1 
    RTCTEV0_H* = (0x00000001) # RTC Time Event 0 
  ##define Reserved          (0x0080)
  ##define Reserved          (0x0008)
  const 
    RTCSSEL_BIT0* = (0x00000000) # RTC Source Select ACLK 
    RTCSSEL_BIT1* = (0x00000400) # RTC Source Select SMCLK 
    RTCSSEL_BIT2* = (0x00000800) # RTC Source Select RT1PS 
    RTCSSEL_BIT3* = (0x00000C00) # RTC Source Select RT1PS 
    RTCSSEL_ACLK* = (0x00000000) # RTC Source Select ACLK 
    RTCSSEL_SMCLK* = (0x00000400) # RTC Source Select SMCLK 
    RTCSSEL_RT1PS* = (0x00000800) # RTC Source Select RT1PS 
    RTCTEV_BIT0* = (0x00000000)  # RTC Time Event: 0 (Min. changed) 
    RTCTEV_BIT1* = (0x00000100)  # RTC Time Event: 1 (Hour changed) 
    RTCTEV_BIT2* = (0x00000200)  # RTC Time Event: 2 (12:00 changed) 
    RTCTEV_BIT3* = (0x00000300)  # RTC Time Event: 3 (00:00 changed) 
    RTCTEV_MIN* = (0x00000000) # RTC Time Event: 0 (Min. changed) 
    RTCTEV_HOUR* = (0x00000100) # RTC Time Event: 1 (Hour changed) 
    RTCTEV_VAL_0000* = (0x00000200) # RTC Time Event: 2 (00:00 changed) 
    RTCTEV_VAL_1200* = (0x00000300) # RTC Time Event: 3 (12:00 changed) 
  # RTCCTL23 Control Bits 
  const 
    RTCCALF1* = (0x00000200)  # RTC Calibration Frequency Bit 1 
    RTCCALF0* = (0x00000100)  # RTC Calibration Frequency Bit 0 
    RTCCALS* = (0x00000080)   # RTC Calibration Sign 
  ##define Reserved          (0x0040)
  const 
    RTCCAL5* = (0x00000020)   # RTC Calibration Bit 5 
    RTCCAL4* = (0x00000010)   # RTC Calibration Bit 4 
    RTCCAL3* = (0x00000008)   # RTC Calibration Bit 3 
    RTCCAL2* = (0x00000004)   # RTC Calibration Bit 2 
    RTCCAL1* = (0x00000002)   # RTC Calibration Bit 1 
    RTCCAL0* = (0x00000001)   # RTC Calibration Bit 0 
  # RTCCTL23 Control Bits 
  const 
    RTCCALS_L* = (0x00000080) # RTC Calibration Sign 
  ##define Reserved          (0x0040)
  const 
    RTCCAL5_L* = (0x00000020) # RTC Calibration Bit 5 
    RTCCAL4_L* = (0x00000010) # RTC Calibration Bit 4 
    RTCCAL3_L* = (0x00000008) # RTC Calibration Bit 3 
    RTCCAL2_L* = (0x00000004) # RTC Calibration Bit 2 
    RTCCAL1_L* = (0x00000002) # RTC Calibration Bit 1 
    RTCCAL0_L* = (0x00000001) # RTC Calibration Bit 0 
  # RTCCTL23 Control Bits 
  const 
    RTCCALF1_H* = (0x00000002) # RTC Calibration Frequency Bit 1 
    RTCCALF0_H* = (0x00000001) # RTC Calibration Frequency Bit 0 
  ##define Reserved          (0x0040)
  const 
    RTCCALF_BIT0* = (0x00000000) # RTC Calibration Frequency: No Output 
    RTCCALF_BIT1* = (0x00000100) # RTC Calibration Frequency: 512 Hz 
    RTCCALF_BIT2* = (0x00000200) # RTC Calibration Frequency: 256 Hz 
    RTCCALF_BIT3* = (0x00000300) # RTC Calibration Frequency: 1 Hz 
  # RTCPS0CTL Control Bits 
  ##define Reserved          (0x8000)
  const 
    RT0SSEL* = (0x00004000)   # RTC Prescale Timer 0 Source Select 0:ACLK / 1:SMCLK 
    RT0PSDIV2* = (0x00002000) # RTC Prescale Timer 0 Clock Divide Bit: 2 
    RT0PSDIV1* = (0x00001000) # RTC Prescale Timer 0 Clock Divide Bit: 1 
    RT0PSDIV0* = (0x00000800) # RTC Prescale Timer 0 Clock Divide Bit: 0 
  ##define Reserved          (0x0400)
  ##define Reserved          (0x0200)
  const 
    RT0PSHOLD* = (0x00000100) # RTC Prescale Timer 0 Hold 
  ##define Reserved          (0x0080)
  ##define Reserved          (0x0040)
  ##define Reserved          (0x0020)
  const 
    RT0IP2* = (0x00000010)    # RTC Prescale Timer 0 Interrupt Interval Bit: 2 
    RT0IP1* = (0x00000008)    # RTC Prescale Timer 0 Interrupt Interval Bit: 1 
    RT0IP0* = (0x00000004)    # RTC Prescale Timer 0 Interrupt Interval Bit: 0 
    RT0PSIE* = (0x00000002)   # RTC Prescale Timer 0 Interrupt Enable Flag 
    RT0PSIFG* = (0x00000001)  # RTC Prescale Timer 0 Interrupt Flag 
  # RTCPS0CTL Control Bits 
  ##define Reserved          (0x8000)
  ##define Reserved          (0x0400)
  ##define Reserved          (0x0200)
  ##define Reserved          (0x0080)
  ##define Reserved          (0x0040)
  ##define Reserved          (0x0020)
  const 
    RT0IP2_L* = (0x00000010)  # RTC Prescale Timer 0 Interrupt Interval Bit: 2 
    RT0IP1_L* = (0x00000008)  # RTC Prescale Timer 0 Interrupt Interval Bit: 1 
    RT0IP0_L* = (0x00000004)  # RTC Prescale Timer 0 Interrupt Interval Bit: 0 
    RT0PSIE_L* = (0x00000002) # RTC Prescale Timer 0 Interrupt Enable Flag 
    RT0PSIFG_L* = (0x00000001) # RTC Prescale Timer 0 Interrupt Flag 
  # RTCPS0CTL Control Bits 
  ##define Reserved          (0x8000)
  const 
    RT0SSEL_H* = (0x00000040) # RTC Prescale Timer 0 Source Select 0:ACLK / 1:SMCLK 
    RT0PSDIV2_H* = (0x00000020) # RTC Prescale Timer 0 Clock Divide Bit: 2 
    RT0PSDIV1_H* = (0x00000010) # RTC Prescale Timer 0 Clock Divide Bit: 1 
    RT0PSDIV0_H* = (0x00000008) # RTC Prescale Timer 0 Clock Divide Bit: 0 
  ##define Reserved          (0x0400)
  ##define Reserved          (0x0200)
  const 
    RT0PSHOLD_H* = (0x00000001) # RTC Prescale Timer 0 Hold 
  ##define Reserved          (0x0080)
  ##define Reserved          (0x0040)
  ##define Reserved          (0x0020)
  const 
    RT0IP_BIT0* = (0x00000000)   # RTC Prescale Timer 0 Interrupt Interval /2 
    RT0IP_BIT1* = (0x00000004)   # RTC Prescale Timer 0 Interrupt Interval /4 
    RT0IP_BIT2* = (0x00000008)   # RTC Prescale Timer 0 Interrupt Interval /8 
    RT0IP_BIT3* = (0x0000000C)   # RTC Prescale Timer 0 Interrupt Interval /16 
    RT0IP_BIT4* = (0x00000010)   # RTC Prescale Timer 0 Interrupt Interval /32 
    RT0IP_BIT5* = (0x00000014)   # RTC Prescale Timer 0 Interrupt Interval /64 
    RT0IP_BIT6* = (0x00000018)   # RTC Prescale Timer 0 Interrupt Interval /128 
    RT0IP_BIT7* = (0x0000001C)   # RTC Prescale Timer 0 Interrupt Interval /256 
    RT0PSDIV_BIT0* = (0x00000000) # RTC Prescale Timer 0 Clock Divide /2 
    RT0PSDIV_BIT1* = (0x00000800) # RTC Prescale Timer 0 Clock Divide /4 
    RT0PSDIV_BIT2* = (0x00001000) # RTC Prescale Timer 0 Clock Divide /8 
    RT0PSDIV_BIT3* = (0x00001800) # RTC Prescale Timer 0 Clock Divide /16 
    RT0PSDIV_BIT4* = (0x00002000) # RTC Prescale Timer 0 Clock Divide /32 
    RT0PSDIV_BIT5* = (0x00002800) # RTC Prescale Timer 0 Clock Divide /64 
    RT0PSDIV_BIT6* = (0x00003000) # RTC Prescale Timer 0 Clock Divide /128 
    RT0PSDIV_BIT7* = (0x00003800) # RTC Prescale Timer 0 Clock Divide /256 
  # RTCPS1CTL Control Bits 
  const 
    RT1SSEL1* = (0x00008000)  # RTC Prescale Timer 1 Source Select Bit 1 
    RT1SSEL0* = (0x00004000)  # RTC Prescale Timer 1 Source Select Bit 0 
    RT1PSDIV2* = (0x00002000) # RTC Prescale Timer 1 Clock Divide Bit: 2 
    RT1PSDIV1* = (0x00001000) # RTC Prescale Timer 1 Clock Divide Bit: 1 
    RT1PSDIV0* = (0x00000800) # RTC Prescale Timer 1 Clock Divide Bit: 0 
  ##define Reserved          (0x0400)
  ##define Reserved          (0x0200)
  const 
    RT1PSHOLD* = (0x00000100) # RTC Prescale Timer 1 Hold 
  ##define Reserved          (0x0080)
  ##define Reserved          (0x0040)
  ##define Reserved          (0x0020)
  const 
    RT1IP2* = (0x00000010)    # RTC Prescale Timer 1 Interrupt Interval Bit: 2 
    RT1IP1* = (0x00000008)    # RTC Prescale Timer 1 Interrupt Interval Bit: 1 
    RT1IP0* = (0x00000004)    # RTC Prescale Timer 1 Interrupt Interval Bit: 0 
    RT1PSIE* = (0x00000002)   # RTC Prescale Timer 1 Interrupt Enable Flag 
    RT1PSIFG* = (0x00000001)  # RTC Prescale Timer 1 Interrupt Flag 
  # RTCPS1CTL Control Bits 
  ##define Reserved          (0x0400)
  ##define Reserved          (0x0200)
  ##define Reserved          (0x0080)
  ##define Reserved          (0x0040)
  ##define Reserved          (0x0020)
  const 
    RT1IP2_L* = (0x00000010)  # RTC Prescale Timer 1 Interrupt Interval Bit: 2 
    RT1IP1_L* = (0x00000008)  # RTC Prescale Timer 1 Interrupt Interval Bit: 1 
    RT1IP0_L* = (0x00000004)  # RTC Prescale Timer 1 Interrupt Interval Bit: 0 
    RT1PSIE_L* = (0x00000002) # RTC Prescale Timer 1 Interrupt Enable Flag 
    RT1PSIFG_L* = (0x00000001) # RTC Prescale Timer 1 Interrupt Flag 
  # RTCPS1CTL Control Bits 
  const 
    RT1SSEL1_H* = (0x00000080) # RTC Prescale Timer 1 Source Select Bit 1 
    RT1SSEL0_H* = (0x00000040) # RTC Prescale Timer 1 Source Select Bit 0 
    RT1PSDIV2_H* = (0x00000020) # RTC Prescale Timer 1 Clock Divide Bit: 2 
    RT1PSDIV1_H* = (0x00000010) # RTC Prescale Timer 1 Clock Divide Bit: 1 
    RT1PSDIV0_H* = (0x00000008) # RTC Prescale Timer 1 Clock Divide Bit: 0 
  ##define Reserved          (0x0400)
  ##define Reserved          (0x0200)
  const 
    RT1PSHOLD_H* = (0x00000001) # RTC Prescale Timer 1 Hold 
  ##define Reserved          (0x0080)
  ##define Reserved          (0x0040)
  ##define Reserved          (0x0020)
  const 
    RT1IP_BIT0* = (0x00000000)   # RTC Prescale Timer 1 Interrupt Interval /2 
    RT1IP_BIT1* = (0x00000004)   # RTC Prescale Timer 1 Interrupt Interval /4 
    RT1IP_BIT2* = (0x00000008)   # RTC Prescale Timer 1 Interrupt Interval /8 
    RT1IP_BIT3* = (0x0000000C)   # RTC Prescale Timer 1 Interrupt Interval /16 
    RT1IP_BIT4* = (0x00000010)   # RTC Prescale Timer 1 Interrupt Interval /32 
    RT1IP_BIT5* = (0x00000014)   # RTC Prescale Timer 1 Interrupt Interval /64 
    RT1IP_BIT6* = (0x00000018)   # RTC Prescale Timer 1 Interrupt Interval /128 
    RT1IP_BIT7* = (0x0000001C)   # RTC Prescale Timer 1 Interrupt Interval /256 
    RT1PSDIV_BIT0* = (0x00000000) # RTC Prescale Timer 1 Clock Divide /2 
    RT1PSDIV_BIT1* = (0x00000800) # RTC Prescale Timer 1 Clock Divide /4 
    RT1PSDIV_BIT2* = (0x00001000) # RTC Prescale Timer 1 Clock Divide /8 
    RT1PSDIV_BIT3* = (0x00001800) # RTC Prescale Timer 1 Clock Divide /16 
    RT1PSDIV_BIT4* = (0x00002000) # RTC Prescale Timer 1 Clock Divide /32 
    RT1PSDIV_BIT5* = (0x00002800) # RTC Prescale Timer 1 Clock Divide /64 
    RT1PSDIV_BIT6* = (0x00003000) # RTC Prescale Timer 1 Clock Divide /128 
    RT1PSDIV_BIT7* = (0x00003800) # RTC Prescale Timer 1 Clock Divide /256 
    RT1SSEL_BIT0* = (0x00000000) # RTC Prescale Timer Source Select ACLK 
    RT1SSEL_BIT1* = (0x00004000) # RTC Prescale Timer Source Select SMCLK 
    RT1SSEL_BIT2* = (0x00008000) # RTC Prescale Timer Source Select RT0PS 
    RT1SSEL_BIT3* = (0x0000C000) # RTC Prescale Timer Source Select RT0PS 
  # RTC Definitions 
  const 
    RTCIV_NONE* = (0x00000000) # No Interrupt pending 
    RTCIV_RTCRDYIFG* = (0x00000002) # RTC ready: RTCRDYIFG 
    RTCIV_RTCTEVIFG* = (0x00000004) # RTC interval timer: RTCTEVIFG 
    RTCIV_RTCAIFG* = (0x00000006) # RTC user alarm: RTCAIFG 
    RTCIV_RT0PSIFG* = (0x00000008) # RTC prescaler 0: RT0PSIFG 
    RTCIV_RT1PSIFG* = (0x0000000A) # RTC prescaler 1: RT1PSIFG 
  # Legacy Definitions 
  const 
    RTC_NONE* = (0x00000000)  # No Interrupt pending 
    RTC_RTCRDYIFG* = (0x00000002) # RTC ready: RTCRDYIFG 
    RTC_RTCTEVIFG* = (0x00000004) # RTC interval timer: RTCTEVIFG 
    RTC_RTCAIFG* = (0x00000006) # RTC user alarm: RTCAIFG 
    RTC_RT0PSIFG* = (0x00000008) # RTC prescaler 0: RT0PSIFG 
    RTC_RT1PSIFG* = (0x0000000A) # RTC prescaler 1: RT1PSIFG 
  #***********************************************************
  # SFR - Special Function Register Module
  #**********************************************************
  const 
    MSP430_HAS_SFR* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_SFR* = 0x00000100
    SFRIE1_ADDR* = 0x00000100
  sfrb(SFRIE1_L, SFRIE1_ADDR)
  sfrb(SFRIE1_H, SFRIE1_ADDR + 1)
  sfrw(SFRIE1, SFRIE1_ADDR)
  # SFRIE1 Control Bits 
  const 
    WDTIE* = (0x00000001)     # WDT Interrupt Enable 
    OFIE* = (0x00000002)      # Osc Fault Enable 
  ##define Reserved          (0x0004)
  const 
    VMAIE* = (0x00000008)     # Vacant Memory Interrupt Enable 
    NMIIE* = (0x00000010)     # NMI Interrupt Enable 
    ACCVIE* = (0x00000020)    # Flash Access Violation Interrupt Enable 
    JMBINIE* = (0x00000040)   # JTAG Mail Box input Interrupt Enable 
    JMBOUTIE* = (0x00000080)  # JTAG Mail Box output Interrupt Enable 
    WDTIE_L* = (0x00000001)   # WDT Interrupt Enable 
    OFIE_L* = (0x00000002)    # Osc Fault Enable 
  ##define Reserved          (0x0004)
  const 
    VMAIE_L* = (0x00000008)   # Vacant Memory Interrupt Enable 
    NMIIE_L* = (0x00000010)   # NMI Interrupt Enable 
    ACCVIE_L* = (0x00000020)  # Flash Access Violation Interrupt Enable 
    JMBINIE_L* = (0x00000040) # JTAG Mail Box input Interrupt Enable 
    JMBOUTIE_L* = (0x00000080) # JTAG Mail Box output Interrupt Enable 
  ##define Reserved          (0x0004)
  const 
    SFRIFG1_ADDR* = 0x00000102
  sfrb(SFRIFG1_L, SFRIFG1_ADDR)
  sfrb(SFRIFG1_H, SFRIFG1_ADDR + 1)
  sfrw(SFRIFG1, SFRIFG1_ADDR)
  # SFRIFG1 Control Bits 
  const 
    WDTIFG* = (0x00000001)    # WDT Interrupt Flag 
    OFIFG* = (0x00000002)     # Osc Fault Flag 
  ##define Reserved          (0x0004)
  const 
    VMAIFG* = (0x00000008)    # Vacant Memory Interrupt Flag 
    NMIIFG* = (0x00000010)    # NMI Interrupt Flag 
  ##define Reserved          (0x0020)
  const 
    JMBINIFG* = (0x00000040)  # JTAG Mail Box input Interrupt Flag 
    JMBOUTIFG* = (0x00000080) # JTAG Mail Box output Interrupt Flag 
    WDTIFG_L* = (0x00000001)  # WDT Interrupt Flag 
    OFIFG_L* = (0x00000002)   # Osc Fault Flag 
  ##define Reserved          (0x0004)
  const 
    VMAIFG_L* = (0x00000008)  # Vacant Memory Interrupt Flag 
    NMIIFG_L* = (0x00000010)  # NMI Interrupt Flag 
  ##define Reserved          (0x0020)
  const 
    JMBINIFG_L* = (0x00000040) # JTAG Mail Box input Interrupt Flag 
    JMBOUTIFG_L* = (0x00000080) # JTAG Mail Box output Interrupt Flag 
  ##define Reserved          (0x0004)
  ##define Reserved          (0x0020)
  const 
    SFRRPCR_ADDR* = 0x00000104
  sfrb(SFRRPCR_L, SFRRPCR_ADDR)
  sfrb(SFRRPCR_H, SFRRPCR_ADDR + 1)
  sfrw(SFRRPCR, SFRRPCR_ADDR)
  # SFRRPCR Control Bits 
  const 
    SYSNMI* = (0x00000001)    # NMI select 
    SYSNMIIES* = (0x00000002) # NMI edge select 
    SYSRSTUP* = (0x00000004)  # RESET Pin pull down/up select 
    SYSRSTRE* = (0x00000008)  # RESET Pin Resistor enable 
    SYSNMI_L* = (0x00000001)  # NMI select 
    SYSNMIIES_L* = (0x00000002) # NMI edge select 
    SYSRSTUP_L* = (0x00000004) # RESET Pin pull down/up select 
    SYSRSTRE_L* = (0x00000008) # RESET Pin Resistor enable 
  #***********************************************************
  # SYS - System Module
  #**********************************************************
  const 
    MSP430_HAS_SYS* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_SYS* = 0x00000180
    SYSCTL_ADDR* = 0x00000180
  sfrb(SYSCTL_L, SYSCTL_ADDR)
  sfrb(SYSCTL_H, SYSCTL_ADDR + 1)
  sfrw(SYSCTL, SYSCTL_ADDR)
  const 
    SYSBSLC_ADDR* = 0x00000182
  sfrb(SYSBSLC_L, SYSBSLC_ADDR)
  sfrb(SYSBSLC_H, SYSBSLC_ADDR + 1)
  sfrw(SYSBSLC, SYSBSLC_ADDR)
  const 
    SYSJMBC_ADDR* = 0x00000186
  sfrb(SYSJMBC_L, SYSJMBC_ADDR)
  sfrb(SYSJMBC_H, SYSJMBC_ADDR + 1)
  sfrw(SYSJMBC, SYSJMBC_ADDR)
  const 
    SYSJMBI0_ADDR* = 0x00000188
  sfrb(SYSJMBI0_L, SYSJMBI0_ADDR)
  sfrb(SYSJMBI0_H, SYSJMBI0_ADDR + 1)
  sfrw(SYSJMBI0, SYSJMBI0_ADDR)
  const 
    SYSJMBI1_ADDR* = 0x0000018A
  sfrb(SYSJMBI1_L, SYSJMBI1_ADDR)
  sfrb(SYSJMBI1_H, SYSJMBI1_ADDR + 1)
  sfrw(SYSJMBI1, SYSJMBI1_ADDR)
  const 
    SYSJMBO0_ADDR* = 0x0000018C
  sfrb(SYSJMBO0_L, SYSJMBO0_ADDR)
  sfrb(SYSJMBO0_H, SYSJMBO0_ADDR + 1)
  sfrw(SYSJMBO0, SYSJMBO0_ADDR)
  const 
    SYSJMBO1_ADDR* = 0x0000018E
  sfrb(SYSJMBO1_L, SYSJMBO1_ADDR)
  sfrb(SYSJMBO1_H, SYSJMBO1_ADDR + 1)
  sfrw(SYSJMBO1, SYSJMBO1_ADDR)
  const 
    SYSBERRIV_ADDR* = 0x00000198
  sfrb(SYSBERRIV_L, SYSBERRIV_ADDR)
  sfrb(SYSBERRIV_H, SYSBERRIV_ADDR + 1)
  sfrw(SYSBERRIV, SYSBERRIV_ADDR)
  const 
    SYSUNIV_ADDR* = 0x0000019A
  sfrb(SYSUNIV_L, SYSUNIV_ADDR)
  sfrb(SYSUNIV_H, SYSUNIV_ADDR + 1)
  sfrw(SYSUNIV, SYSUNIV_ADDR)
  const 
    SYSSNIV_ADDR* = 0x0000019C
  sfrb(SYSSNIV_L, SYSSNIV_ADDR)
  sfrb(SYSSNIV_H, SYSSNIV_ADDR + 1)
  sfrw(SYSSNIV, SYSSNIV_ADDR)
  const 
    SYSRSTIV_ADDR* = 0x0000019E
  sfrb(SYSRSTIV_L, SYSRSTIV_ADDR)
  sfrb(SYSRSTIV_H, SYSRSTIV_ADDR + 1)
  sfrw(SYSRSTIV, SYSRSTIV_ADDR)
  # SYSCTL Control Bits 
  const 
    SYSRIVECT* = (0x00000001) # SYS - RAM based interrupt vectors 
  ##define RESERVED            (0x0002)  /* SYS - Reserved */
  const 
    SYSPMMPE* = (0x00000004)  # SYS - PMM access protect 
  ##define RESERVED            (0x0008)  /* SYS - Reserved */
  const 
    SYSBSLIND* = (0x00000010) # SYS - TCK/RST indication detected 
    SYSJTAGPIN* = (0x00000020) # SYS - Dedicated JTAG pins enabled 
  ##define RESERVED            (0x0040)  /* SYS - Reserved */
  ##define RESERVED            (0x0080)  /* SYS - Reserved */
  ##define RESERVED            (0x0100)  /* SYS - Reserved */
  ##define RESERVED            (0x0200)  /* SYS - Reserved */
  ##define RESERVED            (0x0400)  /* SYS - Reserved */
  ##define RESERVED            (0x0800)  /* SYS - Reserved */
  ##define RESERVED            (0x1000)  /* SYS - Reserved */
  ##define RESERVED            (0x2000)  /* SYS - Reserved */
  ##define RESERVED            (0x4000)  /* SYS - Reserved */
  ##define RESERVED            (0x8000)  /* SYS - Reserved */
  # SYSCTL Control Bits 
  const 
    SYSRIVECT_L* = (0x00000001) # SYS - RAM based interrupt vectors 
  ##define RESERVED            (0x0002)  /* SYS - Reserved */
  const 
    SYSPMMPE_L* = (0x00000004) # SYS - PMM access protect 
  ##define RESERVED            (0x0008)  /* SYS - Reserved */
  const 
    SYSBSLIND_L* = (0x00000010) # SYS - TCK/RST indication detected 
    SYSJTAGPIN_L* = (0x00000020) # SYS - Dedicated JTAG pins enabled 
  ##define RESERVED            (0x0040)  /* SYS - Reserved */
  ##define RESERVED            (0x0080)  /* SYS - Reserved */
  ##define RESERVED            (0x0100)  /* SYS - Reserved */
  ##define RESERVED            (0x0200)  /* SYS - Reserved */
  ##define RESERVED            (0x0400)  /* SYS - Reserved */
  ##define RESERVED            (0x0800)  /* SYS - Reserved */
  ##define RESERVED            (0x1000)  /* SYS - Reserved */
  ##define RESERVED            (0x2000)  /* SYS - Reserved */
  ##define RESERVED            (0x4000)  /* SYS - Reserved */
  ##define RESERVED            (0x8000)  /* SYS - Reserved */
  # SYSCTL Control Bits 
  ##define RESERVED            (0x0002)  /* SYS - Reserved */
  ##define RESERVED            (0x0008)  /* SYS - Reserved */
  ##define RESERVED            (0x0040)  /* SYS - Reserved */
  ##define RESERVED            (0x0080)  /* SYS - Reserved */
  ##define RESERVED            (0x0100)  /* SYS - Reserved */
  ##define RESERVED            (0x0200)  /* SYS - Reserved */
  ##define RESERVED            (0x0400)  /* SYS - Reserved */
  ##define RESERVED            (0x0800)  /* SYS - Reserved */
  ##define RESERVED            (0x1000)  /* SYS - Reserved */
  ##define RESERVED            (0x2000)  /* SYS - Reserved */
  ##define RESERVED            (0x4000)  /* SYS - Reserved */
  ##define RESERVED            (0x8000)  /* SYS - Reserved */
  # SYSBSLC Control Bits 
  const 
    SYSBSLSIZE0* = (0x00000001) # SYS - BSL Protection Size 0 
    SYSBSLSIZE1* = (0x00000002) # SYS - BSL Protection Size 1 
    SYSBSLR* = (0x00000004)   # SYS - RAM assigned to BSL 
  ##define RESERVED            (0x0008)  /* SYS - Reserved */
  ##define RESERVED            (0x0010)  /* SYS - Reserved */
  ##define RESERVED            (0x0020)  /* SYS - Reserved */
  ##define RESERVED            (0x0040)  /* SYS - Reserved */
  ##define RESERVED            (0x0080)  /* SYS - Reserved */
  ##define RESERVED            (0x0100)  /* SYS - Reserved */
  ##define RESERVED            (0x0200)  /* SYS - Reserved */
  ##define RESERVED            (0x0400)  /* SYS - Reserved */
  ##define RESERVED            (0x0800)  /* SYS - Reserved */
  ##define RESERVED            (0x1000)  /* SYS - Reserved */
  ##define RESERVED            (0x2000)  /* SYS - Reserved */
  const 
    SYSBSLOFF* = (0x00004000) # SYS - BSL Memeory disabled 
    SYSBSLPE* = (0x00008000)  # SYS - BSL Memory protection enabled 
  # SYSBSLC Control Bits 
  const 
    SYSBSLSIZE0_L* = (0x00000001) # SYS - BSL Protection Size 0 
    SYSBSLSIZE1_L* = (0x00000002) # SYS - BSL Protection Size 1 
    SYSBSLR_L* = (0x00000004) # SYS - RAM assigned to BSL 
  ##define RESERVED            (0x0008)  /* SYS - Reserved */
  ##define RESERVED            (0x0010)  /* SYS - Reserved */
  ##define RESERVED            (0x0020)  /* SYS - Reserved */
  ##define RESERVED            (0x0040)  /* SYS - Reserved */
  ##define RESERVED            (0x0080)  /* SYS - Reserved */
  ##define RESERVED            (0x0100)  /* SYS - Reserved */
  ##define RESERVED            (0x0200)  /* SYS - Reserved */
  ##define RESERVED            (0x0400)  /* SYS - Reserved */
  ##define RESERVED            (0x0800)  /* SYS - Reserved */
  ##define RESERVED            (0x1000)  /* SYS - Reserved */
  ##define RESERVED            (0x2000)  /* SYS - Reserved */
  # SYSBSLC Control Bits 
  ##define RESERVED            (0x0008)  /* SYS - Reserved */
  ##define RESERVED            (0x0010)  /* SYS - Reserved */
  ##define RESERVED            (0x0020)  /* SYS - Reserved */
  ##define RESERVED            (0x0040)  /* SYS - Reserved */
  ##define RESERVED            (0x0080)  /* SYS - Reserved */
  ##define RESERVED            (0x0100)  /* SYS - Reserved */
  ##define RESERVED            (0x0200)  /* SYS - Reserved */
  ##define RESERVED            (0x0400)  /* SYS - Reserved */
  ##define RESERVED            (0x0800)  /* SYS - Reserved */
  ##define RESERVED            (0x1000)  /* SYS - Reserved */
  ##define RESERVED            (0x2000)  /* SYS - Reserved */
  const 
    SYSBSLOFF_H* = (0x00000040) # SYS - BSL Memeory disabled 
    SYSBSLPE_H* = (0x00000080) # SYS - BSL Memory protection enabled 
  # SYSJMBC Control Bits 
  const 
    JMBIN0FG* = (0x00000001)  # SYS - Incoming JTAG Mailbox 0 Flag 
    JMBIN1FG* = (0x00000002)  # SYS - Incoming JTAG Mailbox 1 Flag 
    JMBOUT0FG* = (0x00000004) # SYS - Outgoing JTAG Mailbox 0 Flag 
    JMBOUT1FG* = (0x00000008) # SYS - Outgoing JTAG Mailbox 1 Flag 
    JMBMODE* = (0x00000010)   # SYS - JMB 16/32 Bit Mode 
  ##define RESERVED            (0x0020)  /* SYS - Reserved */
  const 
    JMBCLR0OFF* = (0x00000040) # SYS - Incoming JTAG Mailbox 0 Flag auto-clear disalbe 
    JMBCLR1OFF* = (0x00000080) # SYS - Incoming JTAG Mailbox 1 Flag auto-clear disalbe 
  ##define RESERVED            (0x0100)  /* SYS - Reserved */
  ##define RESERVED            (0x0200)  /* SYS - Reserved */
  ##define RESERVED            (0x0400)  /* SYS - Reserved */
  ##define RESERVED            (0x0800)  /* SYS - Reserved */
  ##define RESERVED            (0x1000)  /* SYS - Reserved */
  ##define RESERVED            (0x2000)  /* SYS - Reserved */
  ##define RESERVED            (0x4000)  /* SYS - Reserved */
  ##define RESERVED            (0x8000)  /* SYS - Reserved */
  # SYSJMBC Control Bits 
  const 
    JMBIN0FG_L* = (0x00000001) # SYS - Incoming JTAG Mailbox 0 Flag 
    JMBIN1FG_L* = (0x00000002) # SYS - Incoming JTAG Mailbox 1 Flag 
    JMBOUT0FG_L* = (0x00000004) # SYS - Outgoing JTAG Mailbox 0 Flag 
    JMBOUT1FG_L* = (0x00000008) # SYS - Outgoing JTAG Mailbox 1 Flag 
    JMBMODE_L* = (0x00000010) # SYS - JMB 16/32 Bit Mode 
  ##define RESERVED            (0x0020)  /* SYS - Reserved */
  const 
    JMBCLR0OFF_L* = (0x00000040) # SYS - Incoming JTAG Mailbox 0 Flag auto-clear disalbe 
    JMBCLR1OFF_L* = (0x00000080) # SYS - Incoming JTAG Mailbox 1 Flag auto-clear disalbe 
  ##define RESERVED            (0x0100)  /* SYS - Reserved */
  ##define RESERVED            (0x0200)  /* SYS - Reserved */
  ##define RESERVED            (0x0400)  /* SYS - Reserved */
  ##define RESERVED            (0x0800)  /* SYS - Reserved */
  ##define RESERVED            (0x1000)  /* SYS - Reserved */
  ##define RESERVED            (0x2000)  /* SYS - Reserved */
  ##define RESERVED            (0x4000)  /* SYS - Reserved */
  ##define RESERVED            (0x8000)  /* SYS - Reserved */
  # SYSJMBC Control Bits 
  ##define RESERVED            (0x0020)  /* SYS - Reserved */
  ##define RESERVED            (0x0100)  /* SYS - Reserved */
  ##define RESERVED            (0x0200)  /* SYS - Reserved */
  ##define RESERVED            (0x0400)  /* SYS - Reserved */
  ##define RESERVED            (0x0800)  /* SYS - Reserved */
  ##define RESERVED            (0x1000)  /* SYS - Reserved */
  ##define RESERVED            (0x2000)  /* SYS - Reserved */
  ##define RESERVED            (0x4000)  /* SYS - Reserved */
  ##define RESERVED            (0x8000)  /* SYS - Reserved */
  # SYSUNIV Definitions 
  const 
    SYSUNIV_NONE* = (0x00000000) # No Interrupt pending 
    SYSUNIV_NMIIFG* = (0x00000002) # SYSUNIV : NMIIFG 
    SYSUNIV_OFIFG* = (0x00000004) # SYSUNIV : Osc. Fail - OFIFG 
    SYSUNIV_ACCVIFG* = (0x00000006) # SYSUNIV : Access Violation - ACCVIFG 
    SYSUNIV_BUSIFG* = (0x00000008) # SYSUNIV : Bus Error 
    SYSUNIV_SYSBUSIV* = (0x00000008) # SYSUNIV : Bus Error - SYSBERRIFG (legacy) 
  # SYSSNIV Definitions 
  const 
    SYSSNIV_NONE* = (0x00000000) # No Interrupt pending 
    SYSSNIV_SVMLIFG* = (0x00000002) # SYSSNIV : SVMLIFG 
    SYSSNIV_SVMHIFG* = (0x00000004) # SYSSNIV : SVMHIFG 
    SYSSNIV_DLYLIFG* = (0x00000006) # SYSSNIV : DLYLIFG 
    SYSSNIV_DLYHIFG* = (0x00000008) # SYSSNIV : DLYHIFG 
    SYSSNIV_VMAIFG* = (0x0000000A) # SYSSNIV : VMAIFG 
    SYSSNIV_JMBINIFG* = (0x0000000C) # SYSSNIV : JMBINIFG 
    SYSSNIV_JMBOUTIFG* = (0x0000000E) # SYSSNIV : JMBOUTIFG 
    SYSSNIV_VLRLIFG* = (0x00000010) # SYSSNIV : VLRLIFG 
    SYSSNIV_VLRHIFG* = (0x00000012) # SYSSNIV : VLRHIFG 
  # SYSRSTIV Definitions 
  const 
    SYSRSTIV_NONE* = (0x00000000) # No Interrupt pending 
    SYSRSTIV_BOR* = (0x00000002) # SYSRSTIV : BOR 
    SYSRSTIV_RSTNMI* = (0x00000004) # SYSRSTIV : RST/NMI 
    SYSRSTIV_DOBOR* = (0x00000006) # SYSRSTIV : Do BOR 
    SYSRSTIV_LPM5WU* = (0x00000008) # SYSRSTIV : Port LPM5 Wake Up 
    SYSRSTIV_SECYV* = (0x0000000A) # SYSRSTIV : Security violation 
    SYSRSTIV_SVSL* = (0x0000000C) # SYSRSTIV : SVSL 
    SYSRSTIV_SVSH* = (0x0000000E) # SYSRSTIV : SVSH 
    SYSRSTIV_SVML_OVP* = (0x00000010) # SYSRSTIV : SVML_OVP 
    SYSRSTIV_SVMH_OVP* = (0x00000012) # SYSRSTIV : SVMH_OVP 
    SYSRSTIV_DOPOR* = (0x00000014) # SYSRSTIV : Do POR 
    SYSRSTIV_WDTTO* = (0x00000016) # SYSRSTIV : WDT Time out 
    SYSRSTIV_WDTKEY* = (0x00000018) # SYSRSTIV : WDTKEY violation 
    SYSRSTIV_KEYV* = (0x0000001A) # SYSRSTIV : Flash Key violation 
    SYSRSTIV_FLLUL* = (0x0000001C) # SYSRSTIV : FLL unlock 
    SYSRSTIV_PERF* = (0x0000001E) # SYSRSTIV : peripheral/config area fetch 
    SYSRSTIV_PMMKEY* = (0x00000020) # SYSRSTIV : PMMKEY violation 
  #***********************************************************
  # Timer0_A5
  #**********************************************************
  const 
    MSP430_HAS_T0A5* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_T0A5* = 0x00000340
    TA0CTL_ADDR* = 0x00000340
  sfrw(TA0CTL, TA0CTL_ADDR)
  const 
    TA0CCTL0_ADDR* = 0x00000342
  sfrw(TA0CCTL0, TA0CCTL0_ADDR)
  const 
    TA0CCTL1_ADDR* = 0x00000344
  sfrw(TA0CCTL1, TA0CCTL1_ADDR)
  const 
    TA0CCTL2_ADDR* = 0x00000346
  sfrw(TA0CCTL2, TA0CCTL2_ADDR)
  const 
    TA0CCTL3_ADDR* = 0x00000348
  sfrw(TA0CCTL3, TA0CCTL3_ADDR)
  const 
    TA0CCTL4_ADDR* = 0x0000034A
  sfrw(TA0CCTL4, TA0CCTL4_ADDR)
  const 
    TA0R_ADDR* = 0x00000350
  sfrw(TA0R, TA0R_ADDR)
  const 
    TA0CCR0_ADDR* = 0x00000352
  sfrw(TA0CCR0, TA0CCR0_ADDR)
  const 
    TA0CCR1_ADDR* = 0x00000354
  sfrw(TA0CCR1, TA0CCR1_ADDR)
  const 
    TA0CCR2_ADDR* = 0x00000356
  sfrw(TA0CCR2, TA0CCR2_ADDR)
  const 
    TA0CCR3_ADDR* = 0x00000358
  sfrw(TA0CCR3, TA0CCR3_ADDR)
  const 
    TA0CCR4_ADDR* = 0x0000035A
  sfrw(TA0CCR4, TA0CCR4_ADDR)
  const 
    TA0IV_ADDR* = 0x0000036E
  sfrw(TA0IV, TA0IV_ADDR)
  const 
    TA0EX0_ADDR* = 0x00000360
  sfrw(TA0EX0, TA0EX0_ADDR)
  # TAxCTL Control Bits 
  const 
    TASSEL1* = (0x00000200)   # Timer A clock source select 1 
    TASSEL0* = (0x00000100)   # Timer A clock source select 0 
    ID1* = (0x00000080)       # Timer A clock input divider 1 
    ID0* = (0x00000040)       # Timer A clock input divider 0 
    MC1* = (0x00000020)       # Timer A mode control 1 
    MC0* = (0x00000010)       # Timer A mode control 0 
    TACLR* = (0x00000004)     # Timer A counter clear 
    TAIE* = (0x00000002)      # Timer A counter interrupt enable 
    TAIFG* = (0x00000001)     # Timer A counter interrupt flag 
    MC_BIT0* = (0x00000000)      # Timer A mode control: 0 - Stop 
    MC_BIT1* = (0x00000010)      # Timer A mode control: 1 - Up to CCR0 
    MC_BIT2* = (0x00000020)      # Timer A mode control: 2 - Continuous up 
    MC_BIT3* = (0x00000030)      # Timer A mode control: 3 - Up/Down 
    ID_BIT0* = (0x00000000)      # Timer A input divider: 0 - /1 
    ID_BIT1* = (0x00000040)      # Timer A input divider: 1 - /2 
    ID_BIT2* = (0x00000080)      # Timer A input divider: 2 - /4 
    ID_BIT3* = (0x000000C0)      # Timer A input divider: 3 - /8 
    TASSEL_BIT0* = (0x00000000)  # Timer A clock source select: 0 - TACLK 
    TASSEL_BIT1* = (0x00000100)  # Timer A clock source select: 1 - ACLK  
    TASSEL_BIT2* = (0x00000200)  # Timer A clock source select: 2 - SMCLK 
    TASSEL_BIT3* = (0x00000300)  # Timer A clock source select: 3 - INCLK 
    MC_STOP* = (0x00000000)  # Timer A mode control: 0 - Stop 
    MC_UP* = (0x00000010)    # Timer A mode control: 1 - Up to CCR0 
    MC_CONTINUOUS* = (0x00000020) # Timer A mode control: 2 - Continuous up 
    MC_CONTINOUS* = (0x00000020) # Legacy define 
    MC_UPDOWN* = (0x00000030) # Timer A mode control: 3 - Up/Down 
    ID_VAL_1* = (0x00000000)     # Timer A input divider: 0 - /1 
    ID_VAL_2* = (0x00000040)     # Timer A input divider: 1 - /2 
    ID_VAL_4* = (0x00000080)     # Timer A input divider: 2 - /4 
    ID_VAL_8* = (0x000000C0)     # Timer A input divider: 3 - /8 
    TASSEL_TACLK* = (0x00000000) # Timer A clock source select: 0 - TACLK 
    TASSEL_ACLK* = (0x00000100) # Timer A clock source select: 1 - ACLK  
    TASSEL_SMCLK* = (0x00000200) # Timer A clock source select: 2 - SMCLK 
    TASSEL_INCLK* = (0x00000300) # Timer A clock source select: 3 - INCLK 
  # TAxCCTLx Control Bits 
  const 
    CM1* = (0x00008000)       # Capture mode 1 
    CM0* = (0x00004000)       # Capture mode 0 
    CCIS1* = (0x00002000)     # Capture input select 1 
    CCIS0* = (0x00001000)     # Capture input select 0 
    SCS* = (0x00000800)       # Capture sychronize 
    SCCI* = (0x00000400)      # Latched capture signal (read) 
    CAP* = (0x00000100)       # Capture mode: 1 /Compare mode : 0 
    OUTMOD2* = (0x00000080)   # Output mode 2 
    OUTMOD1* = (0x00000040)   # Output mode 1 
    OUTMOD0* = (0x00000020)   # Output mode 0 
    CCIE* = (0x00000010)      # Capture/compare interrupt enable 
    CCI* = (0x00000008)       # Capture input signal (read) 
    OUT* = (0x00000004)       # PWM Output signal if output mode 0 
    COV* = (0x00000002)       # Capture/compare overflow flag 
    CCIFG* = (0x00000001)     # Capture/compare interrupt flag 
    OUTMOD_BIT0* = (0x00000000)  # PWM output mode: 0 - output only 
    OUTMOD_BIT1* = (0x00000020)  # PWM output mode: 1 - set 
    OUTMOD_BIT2* = (0x00000040)  # PWM output mode: 2 - PWM toggle/reset 
    OUTMOD_BIT3* = (0x00000060)  # PWM output mode: 3 - PWM set/reset 
    OUTMOD_BIT4* = (0x00000080)  # PWM output mode: 4 - toggle 
    OUTMOD_BIT5* = (0x000000A0)  # PWM output mode: 5 - Reset 
    OUTMOD_BIT6* = (0x000000C0)  # PWM output mode: 6 - PWM toggle/set 
    OUTMOD_BIT7* = (0x000000E0)  # PWM output mode: 7 - PWM reset/set 
    CCIS_BIT0* = (0x00000000)    # Capture input select: 0 - CCIxA 
    CCIS_BIT1* = (0x00001000)    # Capture input select: 1 - CCIxB 
    CCIS_BIT2* = (0x00002000)    # Capture input select: 2 - GND 
    CCIS_BIT3* = (0x00003000)    # Capture input select: 3 - Vcc 
    CM_BIT0* = (0x00000000)      # Capture mode: 0 - disabled 
    CM_BIT1* = (0x00004000)      # Capture mode: 1 - pos. edge 
    CM_BIT2* = (0x00008000)      # Capture mode: 1 - neg. edge 
    CM_BIT3* = (0x0000C000)      # Capture mode: 1 - both edges 
  # TAxEX0 Control Bits 
  const 
    TAIDEX0* = (0x00000001)   # Timer A Input divider expansion Bit: 0 
    TAIDEX1* = (0x00000002)   # Timer A Input divider expansion Bit: 1 
    TAIDEX2* = (0x00000004)   # Timer A Input divider expansion Bit: 2 
    TAIDEX_BIT0* = (0x00000000)  # Timer A Input divider expansion : /1 
    TAIDEX_BIT1* = (0x00000001)  # Timer A Input divider expansion : /2 
    TAIDEX_BIT2* = (0x00000002)  # Timer A Input divider expansion : /3 
    TAIDEX_BIT3* = (0x00000003)  # Timer A Input divider expansion : /4 
    TAIDEX_BIT4* = (0x00000004)  # Timer A Input divider expansion : /5 
    TAIDEX_BIT5* = (0x00000005)  # Timer A Input divider expansion : /6 
    TAIDEX_BIT6* = (0x00000006)  # Timer A Input divider expansion : /7 
    TAIDEX_BIT7* = (0x00000007)  # Timer A Input divider expansion : /8 
  # T0A5IV Definitions 
  const 
    TA0IV_NONE* = (0x00000000) # No Interrupt pending 
    TA0IV_TA0CCR1* = (0x00000002) # TA0CCR1_CCIFG 
    TA0IV_TA0CCR2* = (0x00000004) # TA0CCR2_CCIFG 
    TA0IV_TA0CCR3* = (0x00000006) # TA0CCR3_CCIFG 
    TA0IV_TA0CCR4* = (0x00000008) # TA0CCR4_CCIFG 
    TA0IV_BIT5* = (0x0000000A)   # Reserved 
    TA0IV_BIT6* = (0x0000000C)   # Reserved 
    TA0IV_TA0IFG* = (0x0000000E) # TA0IFG 
  #***********************************************************
  # Timer1_A3
  #**********************************************************
  const 
    MSP430_HAS_T1A3* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_T1A3* = 0x00000380
    TA1CTL_ADDR* = 0x00000380
  sfrw(TA1CTL, TA1CTL_ADDR)
  const 
    TA1CCTL0_ADDR* = 0x00000382
  sfrw(TA1CCTL0, TA1CCTL0_ADDR)
  const 
    TA1CCTL1_ADDR* = 0x00000384
  sfrw(TA1CCTL1, TA1CCTL1_ADDR)
  const 
    TA1CCTL2_ADDR* = 0x00000386
  sfrw(TA1CCTL2, TA1CCTL2_ADDR)
  const 
    TA1R_ADDR* = 0x00000390
  sfrw(TA1R, TA1R_ADDR)
  const 
    TA1CCR0_ADDR* = 0x00000392
  sfrw(TA1CCR0, TA1CCR0_ADDR)
  const 
    TA1CCR1_ADDR* = 0x00000394
  sfrw(TA1CCR1, TA1CCR1_ADDR)
  const 
    TA1CCR2_ADDR* = 0x00000396
  sfrw(TA1CCR2, TA1CCR2_ADDR)
  const 
    TA1IV_ADDR* = 0x000003AE
  sfrw(TA1IV, TA1IV_ADDR)
  const 
    TA1EX0_ADDR* = 0x000003A0
  sfrw(TA1EX0, TA1EX0_ADDR)
  # Bits are already defined within the Timer0_Ax 
  # TA1IV Definitions 
  const 
    TA1IV_NONE* = (0x00000000) # No Interrupt pending 
    TA1IV_TA1CCR1* = (0x00000002) # TA1CCR1_CCIFG 
    TA1IV_TA1CCR2* = (0x00000004) # TA1CCR2_CCIFG 
    TA1IV_BIT3* = (0x00000006)   # Reserved 
    TA1IV_BIT4* = (0x00000008)   # Reserved 
    TA1IV_BIT5* = (0x0000000A)   # Reserved 
    TA1IV_BIT6* = (0x0000000C)   # Reserved 
    TA1IV_TA1IFG* = (0x0000000E) # TA1IFG 
  #***********************************************************
  # Timer2_A3
  #**********************************************************
  const 
    MSP430_HAS_T2A3* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_T2A3* = 0x00000400
    TA2CTL_ADDR* = 0x00000400
  sfrw(TA2CTL, TA2CTL_ADDR)
  const 
    TA2CCTL0_ADDR* = 0x00000402
  sfrw(TA2CCTL0, TA2CCTL0_ADDR)
  const 
    TA2CCTL1_ADDR* = 0x00000404
  sfrw(TA2CCTL1, TA2CCTL1_ADDR)
  const 
    TA2CCTL2_ADDR* = 0x00000406
  sfrw(TA2CCTL2, TA2CCTL2_ADDR)
  const 
    TA2R_ADDR* = 0x00000410
  sfrw(TA2R, TA2R_ADDR)
  const 
    TA2CCR0_ADDR* = 0x00000412
  sfrw(TA2CCR0, TA2CCR0_ADDR)
  const 
    TA2CCR1_ADDR* = 0x00000414
  sfrw(TA2CCR1, TA2CCR1_ADDR)
  const 
    TA2CCR2_ADDR* = 0x00000416
  sfrw(TA2CCR2, TA2CCR2_ADDR)
  const 
    TA2IV_ADDR* = 0x0000042E
  sfrw(TA2IV, TA2IV_ADDR)
  const 
    TA2EX0_ADDR* = 0x00000420
  sfrw(TA2EX0, TA2EX0_ADDR)
  # Bits are already defined within the Timer0_Ax 
  # TA2IV Definitions 
  const 
    TA2IV_NONE* = (0x00000000) # No Interrupt pending 
    TA2IV_TA1CCR1* = (0x00000002) # TA2CCR1_CCIFG 
    TA2IV_TA1CCR2* = (0x00000004) # TA2CCR2_CCIFG 
    TA2IV_BIT3* = (0x00000006)   # Reserved 
    TA2IV_BIT4* = (0x00000008)   # Reserved 
    TA2IV_BIT5* = (0x0000000A)   # Reserved 
    TA2IV_BIT6* = (0x0000000C)   # Reserved 
    TA2IV_TA2IFG* = (0x0000000E) # TA2IFG 
  #***********************************************************
  # Timer0_B7
  #**********************************************************
  const 
    MSP430_HAS_T0B7* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_T0B7* = 0x000003C0
    TB0CTL_ADDR* = 0x000003C0
  sfrw(TB0CTL, TB0CTL_ADDR)
  const 
    TB0CCTL0_ADDR* = 0x000003C2
  sfrw(TB0CCTL0, TB0CCTL0_ADDR)
  const 
    TB0CCTL1_ADDR* = 0x000003C4
  sfrw(TB0CCTL1, TB0CCTL1_ADDR)
  const 
    TB0CCTL2_ADDR* = 0x000003C6
  sfrw(TB0CCTL2, TB0CCTL2_ADDR)
  const 
    TB0CCTL3_ADDR* = 0x000003C8
  sfrw(TB0CCTL3, TB0CCTL3_ADDR)
  const 
    TB0CCTL4_ADDR* = 0x000003CA
  sfrw(TB0CCTL4, TB0CCTL4_ADDR)
  const 
    TB0CCTL5_ADDR* = 0x000003CC
  sfrw(TB0CCTL5, TB0CCTL5_ADDR)
  const 
    TB0CCTL6_ADDR* = 0x000003CE
  sfrw(TB0CCTL6, TB0CCTL6_ADDR)
  const 
    TB0R_ADDR* = 0x000003D0
  sfrw(TB0R, TB0R_ADDR)
  const 
    TB0CCR0_ADDR* = 0x000003D2
  sfrw(TB0CCR0, TB0CCR0_ADDR)
  const 
    TB0CCR1_ADDR* = 0x000003D4
  sfrw(TB0CCR1, TB0CCR1_ADDR)
  const 
    TB0CCR2_ADDR* = 0x000003D6
  sfrw(TB0CCR2, TB0CCR2_ADDR)
  const 
    TB0CCR3_ADDR* = 0x000003D8
  sfrw(TB0CCR3, TB0CCR3_ADDR)
  const 
    TB0CCR4_ADDR* = 0x000003DA
  sfrw(TB0CCR4, TB0CCR4_ADDR)
  const 
    TB0CCR5_ADDR* = 0x000003DC
  sfrw(TB0CCR5, TB0CCR5_ADDR)
  const 
    TB0CCR6_ADDR* = 0x000003DE
  sfrw(TB0CCR6, TB0CCR6_ADDR)
  const 
    TB0EX0_ADDR* = 0x000003E0
  sfrw(TB0EX0, TB0EX0_ADDR)
  const 
    TB0IV_ADDR* = 0x000003EE
  sfrw(TB0IV, TB0IV_ADDR)
  # Legacy Type Definitions for TimerB 
  #const 
  template TBCTL* = TB0CTL
  template TBCCTL0* = TB0CCTL0
  template TBCCTL1* = TB0CCTL1
  template TBCCTL2* = TB0CCTL2
  template TBCCTL3* = TB0CCTL3
  template TBCCTL4* = TB0CCTL4
  template TBCCTL5* = TB0CCTL5
  template TBCCTL6* = TB0CCTL6
  template TBR* = TB0R
  template TBCCR0* = TB0CCR0
  template TBCCR1* = TB0CCR1
  template TBCCR2* = TB0CCR2
  template TBCCR3* = TB0CCR3
  template TBCCR4* = TB0CCR4
  template TBCCR5* = TB0CCR5
  template TBCCR6* = TB0CCR6
  template TBEX0* = TB0EX0
  template TBIV* = TB0IV
  template TIMERB1_VECTOR* = TIMER0_B1_VECTOR
  template TIMERB0_VECTOR* = TIMER0_B0_VECTOR
  # TBxCTL Control Bits 
  const 
    TBCLGRP1* = (0x00004000)  # Timer0_B7 Compare latch load group 1 
    TBCLGRP0* = (0x00002000)  # Timer0_B7 Compare latch load group 0 
    CNTL1* = (0x00001000)     # Counter lenght 1 
    CNTL0* = (0x00000800)     # Counter lenght 0 
    TBSSEL1* = (0x00000200)   # Clock source 1 
    TBSSEL0* = (0x00000100)   # Clock source 0 
    TBCLR* = (0x00000004)     # Timer0_B7 counter clear 
    TBIE* = (0x00000002)      # Timer0_B7 interrupt enable 
    TBIFG* = (0x00000001)     # Timer0_B7 interrupt flag 
    SHR1* = (0x00004000)      # Timer0_B7 Compare latch load group 1 
    SHR0* = (0x00002000)      # Timer0_B7 Compare latch load group 0 
    TBSSEL_BIT0* = (0x00000000)  # Clock Source: TBCLK 
    TBSSEL_BIT1* = (0x00000100)  # Clock Source: ACLK  
    TBSSEL_BIT2* = (0x00000200)  # Clock Source: SMCLK 
    TBSSEL_BIT3* = (0x00000300)  # Clock Source: INCLK 
    CNTL_BIT0* = (0x00000000)    # Counter lenght: 16 bit 
    CNTL_BIT1* = (0x00000800)    # Counter lenght: 12 bit 
    CNTL_BIT2* = (0x00001000)    # Counter lenght: 10 bit 
    CNTL_BIT3* = (0x00001800)    # Counter lenght:  8 bit 
    SHR_BIT0* = (0x00000000)     # Timer0_B7 Group: 0 - individually 
    SHR_BIT1* = (0x00002000)     # Timer0_B7 Group: 1 - 3 groups (1-2, 3-4, 5-6) 
    SHR_BIT2* = (0x00004000)     # Timer0_B7 Group: 2 - 2 groups (1-3, 4-6)
    SHR_BIT3* = (0x00006000)     # Timer0_B7 Group: 3 - 1 group (all) 
    TBCLGRP_BIT0* = (0x00000000) # Timer0_B7 Group: 0 - individually 
    TBCLGRP_BIT1* = (0x00002000) # Timer0_B7 Group: 1 - 3 groups (1-2, 3-4, 5-6) 
    TBCLGRP_BIT2* = (0x00004000) # Timer0_B7 Group: 2 - 2 groups (1-3, 4-6)
    TBCLGRP_BIT3* = (0x00006000) # Timer0_B7 Group: 3 - 1 group (all) 
    TBSSEL_TACLK* = (0x00000000) # Timer0_B7 clock source select: 0 - TACLK 
    TBSSEL_ACLK* = (0x00000100) # Timer0_B7 clock source select: 1 - ACLK  
    TBSSEL_SMCLK* = (0x00000200) # Timer0_B7 clock source select: 2 - SMCLK 
    TBSSEL_INCLK* = (0x00000300) # Timer0_B7 clock source select: 3 - INCLK 
    CNTL_VAL_16* = (0x00000000)  # Counter lenght: 16 bit 
    CNTL_VAL_12* = (0x00000800)  # Counter lenght: 12 bit 
    CNTL_VAL_10* = (0x00001000)  # Counter lenght: 10 bit 
    CNTL_VAL_8* = (0x00001800)   # Counter lenght:  8 bit 
  # Additional Timer B Control Register bits are defined in Timer A 
  # TBxCCTLx Control Bits 
  const 
    CLLD1* = (0x00000400)     # Compare latch load source 1 
    CLLD0* = (0x00000200)     # Compare latch load source 0 
    SLSHR1* = (0x00000400)    # Compare latch load source 1 
    SLSHR0* = (0x00000200)    # Compare latch load source 0 
    SLSHR_BIT0* = (0x00000000)   # Compare latch load sourec : 0 - immediate 
    SLSHR_BIT1* = (0x00000200)   # Compare latch load sourec : 1 - TBR counts to 0 
    SLSHR_BIT2* = (0x00000400)   # Compare latch load sourec : 2 - up/down 
    SLSHR_BIT3* = (0x00000600)   # Compare latch load sourec : 3 - TBR counts to TBCTL0 
    CLLD_BIT0* = (0x00000000)    # Compare latch load sourec : 0 - immediate 
    CLLD_BIT1* = (0x00000200)    # Compare latch load sourec : 1 - TBR counts to 0 
    CLLD_BIT2* = (0x00000400)    # Compare latch load sourec : 2 - up/down 
    CLLD_BIT3* = (0x00000600)    # Compare latch load sourec : 3 - TBR counts to TBCTL0 
  # TBxEX0 Control Bits 
  const 
    TBIDEX0* = (0x00000001)   # Timer0_B7 Input divider expansion Bit: 0 
    TBIDEX1* = (0x00000002)   # Timer0_B7 Input divider expansion Bit: 1 
    TBIDEX2* = (0x00000004)   # Timer0_B7 Input divider expansion Bit: 2 
    TBIDEX_BIT0* = (0x00000000)  # Timer0_B7 Input divider expansion : /1 
    TBIDEX_BIT1* = (0x00000001)  # Timer0_B7 Input divider expansion : /2 
    TBIDEX_BIT2* = (0x00000002)  # Timer0_B7 Input divider expansion : /3 
    TBIDEX_BIT3* = (0x00000003)  # Timer0_B7 Input divider expansion : /4 
    TBIDEX_BIT4* = (0x00000004)  # Timer0_B7 Input divider expansion : /5 
    TBIDEX_BIT5* = (0x00000005)  # Timer0_B7 Input divider expansion : /6 
    TBIDEX_BIT6* = (0x00000006)  # Timer0_B7 Input divider expansion : /7 
    TBIDEX_BIT7* = (0x00000007)  # Timer0_B7 Input divider expansion : /8 
    TBIDEX_VAL_1* = (0x00000000) # Timer0_B7 Input divider expansion : /1 
    TBIDEX_VAL_2* = (0x00000001) # Timer0_B7 Input divider expansion : /2 
    TBIDEX_VAL_3* = (0x00000002) # Timer0_B7 Input divider expansion : /3 
    TBIDEX_VAL_4* = (0x00000003) # Timer0_B7 Input divider expansion : /4 
    TBIDEX_VAL_5* = (0x00000004) # Timer0_B7 Input divider expansion : /5 
    TBIDEX_VAL_6* = (0x00000005) # Timer0_B7 Input divider expansion : /6 
    TBIDEX_VAL_7* = (0x00000006) # Timer0_B7 Input divider expansion : /7 
    TBIDEX_VAL_8* = (0x00000007) # Timer0_B7 Input divider expansion : /8 
  # TB0IV Definitions 
  const 
    TB0IV_NONE* = (0x00000000) # No Interrupt pending 
    TB0IV_TB1CCR1* = (0x00000002) # TBCCR1_CCIFG 
    TB0IV_TB1CCR2* = (0x00000004) # TBCCR2_CCIFG 
    TB0IV_BIT3* = (0x00000006)   # Reserved 
    TB0IV_BIT4* = (0x00000008)   # Reserved 
    TB0IV_BIT5* = (0x0000000A)   # Reserved 
    TB0IV_BIT6* = (0x0000000C)   # Reserved 
    TB0IV_TB0IFG* = (0x0000000E) # TBIFG 
  #***********************************************************
  # USB
  #**********************************************************
  const 
    MSP430_HAS_USB* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_USB* = 0x00000900
  # ========================================================================= 
  # USB Configuration Registers 
  # ========================================================================= 
  const 
    USBKEYID_ADDR* = 0x00000900
  sfrb(USBKEYID_L, USBKEYID_ADDR)
  sfrb(USBKEYID_H, USBKEYID_ADDR + 1)
  sfrw(USBKEYID, USBKEYID_ADDR)
  const 
    USBCNF_ADDR* = 0x00000902
  sfrb(USBCNF_L, USBCNF_ADDR)
  sfrb(USBCNF_H, USBCNF_ADDR + 1)
  sfrw(USBCNF, USBCNF_ADDR)
  const 
    USBPHYCTL_ADDR* = 0x00000904
  sfrb(USBPHYCTL_L, USBPHYCTL_ADDR)
  sfrb(USBPHYCTL_H, USBPHYCTL_ADDR + 1)
  sfrw(USBPHYCTL, USBPHYCTL_ADDR)
  const 
    USBPWRCTL_ADDR* = 0x00000908
  sfrb(USBPWRCTL_L, USBPWRCTL_ADDR)
  sfrb(USBPWRCTL_H, USBPWRCTL_ADDR + 1)
  sfrw(USBPWRCTL, USBPWRCTL_ADDR)
  const 
    USBPLLCTL_ADDR* = 0x00000910
  sfrb(USBPLLCTL_L, USBPLLCTL_ADDR)
  sfrb(USBPLLCTL_H, USBPLLCTL_ADDR + 1)
  sfrw(USBPLLCTL, USBPLLCTL_ADDR)
  const 
    USBPLLDIVB_ADDR* = 0x00000912
  sfrb(USBPLLDIVB_L, USBPLLDIVB_ADDR)
  sfrb(USBPLLDIVB_H, USBPLLDIVB_ADDR + 1)
  sfrw(USBPLLDIVB, USBPLLDIVB_ADDR)
  const 
    USBPLLIR_ADDR* = 0x00000914
  sfrb(USBPLLIR_L, USBPLLIR_ADDR)
  sfrb(USBPLLIR_H, USBPLLIR_ADDR + 1)
  sfrw(USBPLLIR, USBPLLIR_ADDR)
  template USBKEYPID* = USBKEYID
  const 
    USBKEY* = (0x00009628)    # USB Control Register key 
  # USBCNF Control Bits 
  const 
    USB_EN* = (0x00000001)    # USB - Module enable 
    PUR_EN* = (0x00000002)    # USB - PUR pin enable 
    PUR_IN* = (0x00000004)    # USB - PUR pin input value 
    BLKRDY* = (0x00000008)    # USB - Block ready signal for DMA 
    FNTEN* = (0x00000010)     # USB - Frame Number receive Trigger enable for DMA 
  ##define RESERVED            (0x0020)  /* USB -  */
  ##define RESERVED            (0x0040)  /* USB -  */
  ##define RESERVED            (0x0080)  /* USB -  */
  ##define RESERVED            (0x0100)  /* USB -  */
  ##define RESERVED            (0x0200)  /* USB -  */
  ##define RESERVED            (0x0400)  /* USB -  */
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x1000)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBCNF Control Bits 
  const 
    USB_EN_L* = (0x00000001)  # USB - Module enable 
    PUR_EN_L* = (0x00000002)  # USB - PUR pin enable 
    PUR_IN_L* = (0x00000004)  # USB - PUR pin input value 
    BLKRDY_L* = (0x00000008)  # USB - Block ready signal for DMA 
    FNTEN_L* = (0x00000010)   # USB - Frame Number receive Trigger enable for DMA 
  ##define RESERVED            (0x0020)  /* USB -  */
  ##define RESERVED            (0x0040)  /* USB -  */
  ##define RESERVED            (0x0080)  /* USB -  */
  ##define RESERVED            (0x0100)  /* USB -  */
  ##define RESERVED            (0x0200)  /* USB -  */
  ##define RESERVED            (0x0400)  /* USB -  */
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x1000)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBCNF Control Bits 
  ##define RESERVED            (0x0020)  /* USB -  */
  ##define RESERVED            (0x0040)  /* USB -  */
  ##define RESERVED            (0x0080)  /* USB -  */
  ##define RESERVED            (0x0100)  /* USB -  */
  ##define RESERVED            (0x0200)  /* USB -  */
  ##define RESERVED            (0x0400)  /* USB -  */
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x1000)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBPHYCTL Control Bits 
  const 
    PUOUT0* = (0x00000001)    # USB - USB Port Output Signal Bit 0 
    PUOUT1* = (0x00000002)    # USB - USB Port Output Signal Bit 1 
    PUIN0* = (0x00000004)     # USB - PU0/DP Input Data 
    PUIN1* = (0x00000008)     # USB - PU1/DM Input Data 
  ##define RESERVED            (0x0010)  /* USB -  */
  const 
    PUOPE* = (0x00000020)     # USB - USB Port Output Enable 
  ##define RESERVED            (0x0040)  /* USB -  */
  const 
    PUSEL* = (0x00000080)     # USB - USB Port Function Select 
    PUIPE* = (0x00000100)     # USB - PHY Single Ended Input enable 
  ##define RESERVED            (0x0200)  /* USB -  */
  ##define RESERVED            (0x0100)  /* USB -  */
  ##define RESERVED            (0x0200)  /* USB -  */
  ##define RESERVED            (0x0400)  /* USB -  */
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x1000)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBPHYCTL Control Bits 
  const 
    PUOUT0_L* = (0x00000001)  # USB - USB Port Output Signal Bit 0 
    PUOUT1_L* = (0x00000002)  # USB - USB Port Output Signal Bit 1 
    PUIN0_L* = (0x00000004)   # USB - PU0/DP Input Data 
    PUIN1_L* = (0x00000008)   # USB - PU1/DM Input Data 
  ##define RESERVED            (0x0010)  /* USB -  */
  const 
    PUOPE_L* = (0x00000020)   # USB - USB Port Output Enable 
  ##define RESERVED            (0x0040)  /* USB -  */
  const 
    PUSEL_L* = (0x00000080)   # USB - USB Port Function Select 
  ##define RESERVED            (0x0200)  /* USB -  */
  ##define RESERVED            (0x0100)  /* USB -  */
  ##define RESERVED            (0x0200)  /* USB -  */
  ##define RESERVED            (0x0400)  /* USB -  */
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x1000)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBPHYCTL Control Bits 
  ##define RESERVED            (0x0010)  /* USB -  */
  ##define RESERVED            (0x0040)  /* USB -  */
  const 
    PUIPE_H* = (0x00000001)   # USB - PHY Single Ended Input enable 
  ##define RESERVED            (0x0200)  /* USB -  */
  ##define RESERVED            (0x0100)  /* USB -  */
  ##define RESERVED            (0x0200)  /* USB -  */
  ##define RESERVED            (0x0400)  /* USB -  */
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x1000)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  const 
    PUDIR* = (0x00000020)     # USB - Legacy Definition: USB Port Output Enable 
    PSEIEN* = (0x00000100)    # USB - Legacy Definition: PHY Single Ended Input enable 
  # USBPWRCTL Control Bits 
  const 
    VUOVLIFG* = (0x00000001)  # USB - VUSB Overload Interrupt Flag 
    VBONIFG* = (0x00000002)   # USB - VBUS "Coming ON" Interrupt Flag 
    VBOFFIFG* = (0x00000004)  # USB - VBUS "Going OFF" Interrupt Flag 
    USBBGVBV* = (0x00000008)  # USB - USB Bandgap and VBUS valid 
    USBDETEN* = (0x00000010)  # USB - VBUS on/off events enable 
    OVLAOFF* = (0x00000020)   # USB - LDO overload auto off enable 
    SLDOAON* = (0x00000040)   # USB - Secondary LDO auto on enable 
  ##define RESERVED            (0x0080)  /* USB -  */
  const 
    VUOVLIE* = (0x00000100)   # USB - Overload indication Interrupt Enable 
    VBONIE* = (0x00000200)    # USB - VBUS "Coming ON" Interrupt Enable 
    VBOFFIE* = (0x00000400)   # USB - VBUS "Going OFF" Interrupt Enable 
    VUSBEN* = (0x00000800)    # USB - LDO Enable (3.3V) 
    SLDOEN* = (0x00001000)    # USB - Secondary LDO Enable (1.8V) 
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBPWRCTL Control Bits 
  const 
    VUOVLIFG_L* = (0x00000001) # USB - VUSB Overload Interrupt Flag 
    VBONIFG_L* = (0x00000002) # USB - VBUS "Coming ON" Interrupt Flag 
    VBOFFIFG_L* = (0x00000004) # USB - VBUS "Going OFF" Interrupt Flag 
    USBBGVBV_L* = (0x00000008) # USB - USB Bandgap and VBUS valid 
    USBDETEN_L* = (0x00000010) # USB - VBUS on/off events enable 
    OVLAOFF_L* = (0x00000020) # USB - LDO overload auto off enable 
    SLDOAON_L* = (0x00000040) # USB - Secondary LDO auto on enable 
  ##define RESERVED            (0x0080)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBPWRCTL Control Bits 
  ##define RESERVED            (0x0080)  /* USB -  */
  const 
    VUOVLIE_H* = (0x00000001) # USB - Overload indication Interrupt Enable 
    VBONIE_H* = (0x00000002)  # USB - VBUS "Coming ON" Interrupt Enable 
    VBOFFIE_H* = (0x00000004) # USB - VBUS "Going OFF" Interrupt Enable 
    VUSBEN_H* = (0x00000008)  # USB - LDO Enable (3.3V) 
    SLDOEN_H* = (0x00000010)  # USB - Secondary LDO Enable (1.8V) 
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBPLLCTL Control Bits 
  ##define RESERVED            (0x0001)  /* USB -  */
  ##define RESERVED            (0x0002)  /* USB -  */
  ##define RESERVED            (0x0004)  /* USB -  */
  ##define RESERVED            (0x0008)  /* USB -  */
  ##define RESERVED            (0x0010)  /* USB -  */
  ##define RESERVED            (0x0020)  /* USB -  */
  const 
    UCLKSEL0* = (0x00000040)  # USB - Module Clock Select Bit 0 
    UCLKSEL1* = (0x00000080)  # USB - Module Clock Select Bit 1 
    UPLLEN* = (0x00000100)    # USB - PLL enable 
    UPFDEN* = (0x00000200)    # USB - Phase Freq. Discriminator enable 
  ##define RESERVED            (0x0400)  /* USB -  */
  ##define RESERVED            (0x0800)  /* USB -  */
  const 
    UPCS0* = (0x00001000)     # USB - PLL Clock Select Bit 0 
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBPLLCTL Control Bits 
  ##define RESERVED            (0x0001)  /* USB -  */
  ##define RESERVED            (0x0002)  /* USB -  */
  ##define RESERVED            (0x0004)  /* USB -  */
  ##define RESERVED            (0x0008)  /* USB -  */
  ##define RESERVED            (0x0010)  /* USB -  */
  ##define RESERVED            (0x0020)  /* USB -  */
  const 
    UCLKSEL0_L* = (0x00000040) # USB - Module Clock Select Bit 0 
    UCLKSEL1_L* = (0x00000080) # USB - Module Clock Select Bit 1 
  ##define RESERVED            (0x0400)  /* USB -  */
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBPLLCTL Control Bits 
  ##define RESERVED            (0x0001)  /* USB -  */
  ##define RESERVED            (0x0002)  /* USB -  */
  ##define RESERVED            (0x0004)  /* USB -  */
  ##define RESERVED            (0x0008)  /* USB -  */
  ##define RESERVED            (0x0010)  /* USB -  */
  ##define RESERVED            (0x0020)  /* USB -  */
  const 
    UPLLEN_H* = (0x00000001)  # USB - PLL enable 
    UPFDEN_H* = (0x00000002)  # USB - Phase Freq. Discriminator enable 
  ##define RESERVED            (0x0400)  /* USB -  */
  ##define RESERVED            (0x0800)  /* USB -  */
  const 
    UPCS0_H* = (0x00000010)   # USB - PLL Clock Select Bit 0 
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  const 
    UCLKSEL_BIT0* = (0x00000000) # USB - Module Clock Select: 0 
    UCLKSEL_BIT1* = (0x00000040) # USB - Module Clock Select: 1 
    UCLKSEL_BIT2* = (0x00000080) # USB - Module Clock Select: 2 
    UCLKSEL_BIT3* = (0x000000C0) # USB - Module Clock Select: 3 (Reserved) 
    UCLKSEL_PLLCLK* = (0x00000000) # USB - Module Clock Select: PLLCLK 
    UCLKSEL_XT1CLK* = (0x00000040) # USB - Module Clock Select: XT1CLK 
    UCLKSEL_XT2CLK* = (0x00000080) # USB - Module Clock Select: XT2CLK 
  # USBPLLDIVB Control Bits 
  const 
    UPMB0* = (0x00000001)     # USB - PLL feedback divider buffer Bit 0 
    UPMB1* = (0x00000002)     # USB - PLL feedback divider buffer Bit 1 
    UPMB2* = (0x00000004)     # USB - PLL feedback divider buffer Bit 2 
    UPMB3* = (0x00000008)     # USB - PLL feedback divider buffer Bit 3 
    UPMB4* = (0x00000010)     # USB - PLL feedback divider buffer Bit 4 
    UPMB5* = (0x00000020)     # USB - PLL feedback divider buffer Bit 5 
  ##define RESERVED            (0x0040)  /* USB -  */
  ##define RESERVED            (0x0080)  /* USB -  */
  const 
    UPQB0* = (0x00000100)     # USB - PLL prescale divider buffer Bit 0 
    UPQB1* = (0x00000200)     # USB - PLL prescale divider buffer Bit 1 
    UPQB2* = (0x00000400)     # USB - PLL prescale divider buffer Bit 2 
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x1000)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBPLLDIVB Control Bits 
  const 
    UPMB0_L* = (0x00000001)   # USB - PLL feedback divider buffer Bit 0 
    UPMB1_L* = (0x00000002)   # USB - PLL feedback divider buffer Bit 1 
    UPMB2_L* = (0x00000004)   # USB - PLL feedback divider buffer Bit 2 
    UPMB3_L* = (0x00000008)   # USB - PLL feedback divider buffer Bit 3 
    UPMB4_L* = (0x00000010)   # USB - PLL feedback divider buffer Bit 4 
    UPMB5_L* = (0x00000020)   # USB - PLL feedback divider buffer Bit 5 
  ##define RESERVED            (0x0040)  /* USB -  */
  ##define RESERVED            (0x0080)  /* USB -  */
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x1000)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBPLLDIVB Control Bits 
  ##define RESERVED            (0x0040)  /* USB -  */
  ##define RESERVED            (0x0080)  /* USB -  */
  const 
    UPQB0_H* = (0x00000001)   # USB - PLL prescale divider buffer Bit 0 
    UPQB1_H* = (0x00000002)   # USB - PLL prescale divider buffer Bit 1 
    UPQB2_H* = (0x00000004)   # USB - PLL prescale divider buffer Bit 2 
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x1000)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  const 
    USBPLL_SETCLK_1_BIT5* = (UPMB0 * 31 or UPQB0 * 0) # USB - PLL Set for 1.5 MHz input clock 
    USBPLL_SETCLK_1_BIT6* = (UPMB0 * 29 or UPQB0 * 0) # USB - PLL Set for 1.6 MHz input clock 
    USBPLL_SETCLK_1_BIT7778* = (UPMB0 * 26 or UPQB0 * 0) # USB - PLL Set for 1.7778 MHz input clock 
    USBPLL_SETCLK_1_BIT8432* = (UPMB0 * 25 or UPQB0 * 0) # USB - PLL Set for 1.8432 MHz input clock 
    USBPLL_SETCLK_1_BIT8461* = (UPMB0 * 25 or UPQB0 * 0) # USB - PLL Set for 1.8461 MHz input clock 
    USBPLL_SETCLK_1_BIT92* = (UPMB0 * 24 or UPQB0 * 0) # USB - PLL Set for 1.92 MHz input clock 
    USBPLL_SETCLK_2_BIT0* = (UPMB0 * 23 or UPQB0 * 0) # USB - PLL Set for 2.0 MHz input clock 
    USBPLL_SETCLK_2_BIT4* = (UPMB0 * 19 or UPQB0 * 0) # USB - PLL Set for 2.4 MHz input clock 
    USBPLL_SETCLK_2_BIT6667* = (UPMB0 * 17 or UPQB0 * 0) # USB - PLL Set for 2.6667 MHz input clock 
    USBPLL_SETCLK_3_BIT0* = (UPMB0 * 15 or UPQB0 * 0) # USB - PLL Set for 3.0 MHz input clock 
    USBPLL_SETCLK_3_BIT2* = (UPMB0 * 29 or UPQB0 * 1) # USB - PLL Set for 3.2 MHz input clock 
    USBPLL_SETCLK_3_BIT5556* = (UPMB0 * 26 or UPQB0 * 1) # USB - PLL Set for 3.5556 MHz input clock 
    USBPLL_SETCLK_3_BIT579545* = (UPMB0 * 26 or UPQB0 * 1) # USB - PLL Set for 3.579546 MHz input clock 
    USBPLL_SETCLK_3_BIT84* = (UPMB0 * 24 or UPQB0 * 1) # USB - PLL Set for 3.84 MHz input clock 
    USBPLL_SETCLK_4_BIT0* = (UPMB0 * 23 or UPQB0 * 1) # USB - PLL Set for 4.0 MHz input clock 
    USBPLL_SETCLK_4_BIT1739* = (UPMB0 * 22 or UPQB0 * 1) # USB - PLL Set for 4.1739 MHz input clock 
    USBPLL_SETCLK_4_BIT1943* = (UPMB0 * 22 or UPQB0 * 1) # USB - PLL Set for 4.1943 MHz input clock 
    USBPLL_SETCLK_4_BIT332* = (UPMB0 * 21 or UPQB0 * 1) # USB - PLL Set for 4.332 MHz input clock 
    USBPLL_SETCLK_4_BIT3636* = (UPMB0 * 21 or UPQB0 * 1) # USB - PLL Set for 4.3636 MHz input clock 
    USBPLL_SETCLK_4_BIT5* = (UPMB0 * 31 or UPQB0 * 2) # USB - PLL Set for 4.5 MHz input clock 
    USBPLL_SETCLK_4_BIT8* = (UPMB0 * 19 or UPQB0 * 1) # USB - PLL Set for 4.8 MHz input clock 
    USBPLL_SETCLK_5_BIT33* = (UPMB0 * 17 or UPQB0 * 1) # USB - PLL Set for 5.33 MHz input clock 
    USBPLL_SETCLK_5_BIT76* = (UPMB0 * 24 or UPQB0 * 2) # USB - PLL Set for 5.76 MHz input clock 
    USBPLL_SETCLK_6_BIT0* = (UPMB0 * 23 or UPQB0 * 2) # USB - PLL Set for 6.0 MHz input clock 
    USBPLL_SETCLK_6_BIT4* = (UPMB0 * 29 or UPQB0 * 3) # USB - PLL Set for 6.4 MHz input clock 
    USBPLL_SETCLK_7_BIT2* = (UPMB0 * 19 or UPQB0 * 2) # USB - PLL Set for 7.2 MHz input clock 
    USBPLL_SETCLK_7_BIT68* = (UPMB0 * 24 or UPQB0 * 3) # USB - PLL Set for 7.68 MHz input clock 
    USBPLL_SETCLK_8_BIT0* = (UPMB0 * 17 or UPQB0 * 2) # USB - PLL Set for 8.0 MHz input clock 
    USBPLL_SETCLK_9_BIT0* = (UPMB0 * 15 or UPQB0 * 2) # USB - PLL Set for 9.0 MHz input clock 
    USBPLL_SETCLK_9_BIT6* = (UPMB0 * 19 or UPQB0 * 3) # USB - PLL Set for 9.6 MHz input clock 
    USBPLL_SETCLK_10_BIT66* = (UPMB0 * 17 or UPQB0 * 3) # USB - PLL Set for 10.66 MHz input clock 
    USBPLL_SETCLK_12_BIT0* = (UPMB0 * 15 or UPQB0 * 3) # USB - PLL Set for 12.0 MHz input clock 
    USBPLL_SETCLK_12_BIT8* = (UPMB0 * 29 or UPQB0 * 5) # USB - PLL Set for 12.8 MHz input clock 
    USBPLL_SETCLK_14_BIT4* = (UPMB0 * 19 or UPQB0 * 4) # USB - PLL Set for 14.4 MHz input clock 
    USBPLL_SETCLK_16_BIT0* = (UPMB0 * 17 or UPQB0 * 4) # USB - PLL Set for 16.0 MHz input clock 
    USBPLL_SETCLK_16_BIT9344* = (UPMB0 * 16 or UPQB0 * 4) # USB - PLL Set for 16.9344 MHz input clock 
    USBPLL_SETCLK_16_BIT94118* = (UPMB0 * 16 or UPQB0 * 4) # USB - PLL Set for 16.94118 MHz input clock 
    USBPLL_SETCLK_18_BIT0* = (UPMB0 * 15 or UPQB0 * 4) # USB - PLL Set for 18.0 MHz input clock 
    USBPLL_SETCLK_19_BIT2* = (UPMB0 * 19 or UPQB0 * 5) # USB - PLL Set for 19.2 MHz input clock 
    USBPLL_SETCLK_24_BIT0* = (UPMB0 * 15 or UPQB0 * 5) # USB - PLL Set for 24.0 MHz input clock 
    USBPLL_SETCLK_25_BIT6* = (UPMB0 * 29 or UPQB0 * 7) # USB - PLL Set for 25.6 MHz input clock 
    USBPLL_SETCLK_26_BIT0* = (UPMB0 * 23 or UPQB0 * 6) # USB - PLL Set for 26.0 MHz input clock 
    USBPLL_SETCLK_32_BIT0* = (UPMB0 * 23 or UPQB0 * 7) # USB - PLL Set for 32.0 MHz input clock 
  # USBPLLIR Control Bits 
  const 
    USBOOLIFG* = (0x00000001) # USB - PLL out of lock Interrupt Flag 
    USBLOSIFG* = (0x00000002) # USB - PLL loss of signal Interrupt Flag 
    USBOORIFG* = (0x00000004) # USB - PLL out of range Interrupt Flag 
  ##define RESERVED            (0x0008)  /* USB -  */
  ##define RESERVED            (0x0010)  /* USB -  */
  ##define RESERVED            (0x0020)  /* USB -  */
  ##define RESERVED            (0x0040)  /* USB -  */
  ##define RESERVED            (0x0080)  /* USB -  */
  const 
    USBOOLIE* = (0x00000100)  # USB - PLL out of lock Interrupt enable 
    USBLOSIE* = (0x00000200)  # USB - PLL loss of signal Interrupt enable 
    USBOORIE* = (0x00000400)  # USB - PLL out of range Interrupt enable 
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x1000)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBPLLIR Control Bits 
  const 
    USBOOLIFG_L* = (0x00000001) # USB - PLL out of lock Interrupt Flag 
    USBLOSIFG_L* = (0x00000002) # USB - PLL loss of signal Interrupt Flag 
    USBOORIFG_L* = (0x00000004) # USB - PLL out of range Interrupt Flag 
  ##define RESERVED            (0x0008)  /* USB -  */
  ##define RESERVED            (0x0010)  /* USB -  */
  ##define RESERVED            (0x0020)  /* USB -  */
  ##define RESERVED            (0x0040)  /* USB -  */
  ##define RESERVED            (0x0080)  /* USB -  */
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x1000)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # USBPLLIR Control Bits 
  ##define RESERVED            (0x0008)  /* USB -  */
  ##define RESERVED            (0x0010)  /* USB -  */
  ##define RESERVED            (0x0020)  /* USB -  */
  ##define RESERVED            (0x0040)  /* USB -  */
  ##define RESERVED            (0x0080)  /* USB -  */
  const 
    USBOOLIE_H* = (0x00000001) # USB - PLL out of lock Interrupt enable 
    USBLOSIE_H* = (0x00000002) # USB - PLL loss of signal Interrupt enable 
    USBOORIE_H* = (0x00000004) # USB - PLL out of range Interrupt enable 
  ##define RESERVED            (0x0800)  /* USB -  */
  ##define RESERVED            (0x1000)  /* USB -  */
  ##define RESERVED            (0x2000)  /* USB -  */
  ##define RESERVED            (0x4000)  /* USB -  */
  ##define RESERVED            (0x8000)  /* USB -  */
  # ========================================================================= 
  # USB Control Registers 
  # ========================================================================= 
  const 
    USBIEPCNF_0_ADDR* = 0x00000920
  sfrb(USBIEPCNF_BIT0, USBIEPCNF_0_ADDR)
  const 
    USBIEPCNT_0_ADDR* = 0x00000921
  sfrb(USBIEPCNT_BIT0, USBIEPCNT_0_ADDR)
  const 
    USBOEPCNF_0_ADDR* = 0x00000922
  sfrb(USBOEPCNF_BIT0, USBOEPCNF_0_ADDR)
  const 
    USBOEPCNT_0_ADDR* = 0x00000923
  sfrb(USBOEPCNT_BIT0, USBOEPCNT_0_ADDR)
  const 
    USBIEPIE_ADDR* = 0x0000092E
  sfrb(USBIEPIE, USBIEPIE_ADDR)
  const 
    USBOEPIE_ADDR* = 0x0000092F
  sfrb(USBOEPIE, USBOEPIE_ADDR)
  const 
    USBIEPIFG_ADDR* = 0x00000930
  sfrb(USBIEPIFG, USBIEPIFG_ADDR)
  const 
    USBOEPIFG_ADDR* = 0x00000931
  sfrb(USBOEPIFG, USBOEPIFG_ADDR)
  const 
    USBVECINT_ADDR* = 0x00000932
  sfrb(USBVECINT_L, USBVECINT_ADDR)
  sfrb(USBVECINT_H, USBVECINT_ADDR + 1)
  sfrw(USBVECINT, USBVECINT_ADDR)
  const 
    USBMAINT_ADDR* = 0x00000936
  sfrb(USBMAINT_L, USBMAINT_ADDR)
  sfrb(USBMAINT_H, USBMAINT_ADDR + 1)
  sfrw(USBMAINT, USBMAINT_ADDR)
  const 
    USBTSREG_ADDR* = 0x00000938
  sfrb(USBTSREG_L, USBTSREG_ADDR)
  sfrb(USBTSREG_H, USBTSREG_ADDR + 1)
  sfrw(USBTSREG, USBTSREG_ADDR)
  const 
    USBFN_ADDR* = 0x0000093A
  sfrb(USBFN_L, USBFN_ADDR)
  sfrb(USBFN_H, USBFN_ADDR + 1)
  sfrw(USBFN, USBFN_ADDR)
  const 
    USBCTL_ADDR* = 0x0000093C
  sfrb(USBCTL, USBCTL_ADDR)
  const 
    USBIE_ADDR* = 0x0000093D
  sfrb(USBIE, USBIE_ADDR)
  const 
    USBIFG_ADDR* = 0x0000093E
  sfrb(USBIFG, USBIFG_ADDR)
  const 
    USBFUNADR_ADDR* = 0x0000093F
  sfrb(USBFUNADR, USBFUNADR_ADDR)
  #const 
  template USBIV* = USBVECINT
  # USBIEPCNF_BIT0 Control Bits 
  # USBOEPCNF_BIT0 Control Bits 
  ##define RESERVED       (0x0001)  /* USB -  */
  ##define RESERVED       (0x0001)  /* USB -  */
  const 
    USBIIE* = (0x00000004)    # USB - Transaction Interrupt indication enable 
    STALL* = (0x00000008)     # USB - Stall Condition 
  ##define RESERVED       (0x0010)  /* USB -  */
  const 
    TOGGLE* = (0x00000020)    # USB - Toggle Bit 
  ##define RESERVED       (0x0040)  /* USB -  */
  const 
    UBME* = (0x00000080)      # USB - UBM In-Endpoint Enable 
  # USBIEPBCNT_BIT0 Control Bits 
  # USBOEPBCNT_BIT0 Control Bits 
  const 
    CNT0* = (0x00000001)      # USB - Byte Count Bit 0 
    CNT1* = (0x00000001)      # USB - Byte Count Bit 1 
    CNT2* = (0x00000004)      # USB - Byte Count Bit 2 
    CNT3* = (0x00000008)      # USB - Byte Count Bit 3 
  ##define RESERVED       (0x0010)  /* USB -  */
  ##define RESERVED       (0x0020)  /* USB -  */
  ##define RESERVED       (0x0040)  /* USB -  */
  const 
    NAK* = (0x00000080)       # USB - No Acknowledge Status Bit 
  # USBMAINT Control Bits 
  const 
    UTIFG* = (0x00000001)     # USB - Timer Interrupt Flag 
    UTIE* = (0x00000002)      # USB - Timer Interrupt Enable 
  ##define RESERVED       (0x0004)  /* USB -  */
  ##define RESERVED       (0x0008)  /* USB -  */
  ##define RESERVED       (0x0010)  /* USB -  */
  ##define RESERVED       (0x0020)  /* USB -  */
  ##define RESERVED       (0x0040)  /* USB -  */
  ##define RESERVED       (0x0080)  /* USB -  */
  const 
    TSGEN* = (0x00000100)     # USB - Time Stamp Generator Enable 
    TSESEL0* = (0x00000200)   # USB - Time Stamp Event Select Bit 0 
    TSESEL1* = (0x00000400)   # USB - Time Stamp Event Select Bit 1 
    TSE3* = (0x00000800)      # USB - Time Stamp Event #3 Bit 
  ##define RESERVED       (0x1000)  /* USB -  */
  const 
    UTSEL0* = (0x00002000)    # USB - Timer Select Bit 0 
    UTSEL1* = (0x00004000)    # USB - Timer Select Bit 1 
    UTSEL2* = (0x00008000)    # USB - Timer Select Bit 2 
  # USBMAINT Control Bits 
  const 
    UTIFG_L* = (0x00000001)   # USB - Timer Interrupt Flag 
    UTIE_L* = (0x00000002)    # USB - Timer Interrupt Enable 
  ##define RESERVED       (0x0004)  /* USB -  */
  ##define RESERVED       (0x0008)  /* USB -  */
  ##define RESERVED       (0x0010)  /* USB -  */
  ##define RESERVED       (0x0020)  /* USB -  */
  ##define RESERVED       (0x0040)  /* USB -  */
  ##define RESERVED       (0x0080)  /* USB -  */
  ##define RESERVED       (0x1000)  /* USB -  */
  # USBMAINT Control Bits 
  ##define RESERVED       (0x0004)  /* USB -  */
  ##define RESERVED       (0x0008)  /* USB -  */
  ##define RESERVED       (0x0010)  /* USB -  */
  ##define RESERVED       (0x0020)  /* USB -  */
  ##define RESERVED       (0x0040)  /* USB -  */
  ##define RESERVED       (0x0080)  /* USB -  */
  const 
    TSGEN_H* = (0x00000001)   # USB - Time Stamp Generator Enable 
    TSESEL0_H* = (0x00000002) # USB - Time Stamp Event Select Bit 0 
    TSESEL1_H* = (0x00000004) # USB - Time Stamp Event Select Bit 1 
    TSE3_H* = (0x00000008)    # USB - Time Stamp Event #3 Bit 
  ##define RESERVED       (0x1000)  /* USB -  */
  const 
    UTSEL0_H* = (0x00000020)  # USB - Timer Select Bit 0 
    UTSEL1_H* = (0x00000040)  # USB - Timer Select Bit 1 
    UTSEL2_H* = (0x00000080)  # USB - Timer Select Bit 2 
    TSESEL_BIT0* = (0x00000000)  # USB - Time Stamp Event Select: 0 
    TSESEL_BIT1* = (0x00000200)  # USB - Time Stamp Event Select: 1 
    TSESEL_BIT2* = (0x00000400)  # USB - Time Stamp Event Select: 2 
    TSESEL_BIT3* = (0x00000600)  # USB - Time Stamp Event Select: 3 
    UTSEL_BIT0* = (0x00000000)   # USB - Timer Select: 0 
    UTSEL_BIT1* = (0x00002000)   # USB - Timer Select: 1 
    UTSEL_BIT2* = (0x00004000)   # USB - Timer Select: 2 
    UTSEL_BIT3* = (0x00006000)   # USB - Timer Select: 3 
    UTSEL_BIT4* = (0x00008000)   # USB - Timer Select: 4 
    UTSEL_BIT5* = (0x0000A000)   # USB - Timer Select: 5 
    UTSEL_BIT6* = (0x0000C000)   # USB - Timer Select: 6 
    UTSEL_BIT7* = (0x0000E000)   # USB - Timer Select: 7 
  # USBCTL Control Bits 
  const 
    DIR* = (0x00000001)       # USB - Data Response Bit 
  ##define RESERVED       (0x0002)  /* USB -  */
  ##define RESERVED       (0x0004)  /* USB -  */
  ##define RESERVED       (0x0008)  /* USB -  */
  const 
    FRSTE* = (0x00000010)     # USB - Function Reset Connection Enable 
    RWUP* = (0x00000020)      # USB - Device Remote Wakeup Request 
    FEN* = (0x00000040)       # USB - Function Enable Bit 
  ##define RESERVED       (0x0080)  /* USB -  */
  # USBIE Control Bits 
  const 
    STPOWIE* = (0x00000001)   # USB - Setup Overwrite Interrupt Enable 
  ##define RESERVED       (0x0002)  /* USB -  */
  const 
    SETUPIE* = (0x00000004)   # USB - Setup Interrupt Enable 
  ##define RESERVED       (0x0008)  /* USB -  */
  ##define RESERVED       (0x0010)  /* USB -  */
  const 
    RESRIE* = (0x00000020)    # USB - Function Resume Request Interrupt Enable 
    SUSRIE* = (0x00000040)    # USB - Function Suspend Request Interrupt Enable 
    RSTRIE* = (0x00000080)    # USB - Function Reset Request Interrupt Enable 
  # USBIFG Control Bits 
  const 
    STPOWIFG* = (0x00000001)  # USB - Setup Overwrite Interrupt Flag 
  ##define RESERVED       (0x0002)  /* USB -  */
  const 
    SETUPIFG* = (0x00000004)  # USB - Setup Interrupt Flag 
  ##define RESERVED       (0x0008)  /* USB -  */
  ##define RESERVED       (0x0010)  /* USB -  */
  const 
    RESRIFG* = (0x00000020)   # USB - Function Resume Request Interrupt Flag 
    SUSRIFG* = (0x00000040)   # USB - Function Suspend Request Interrupt Flag 
    RSTRIFG* = (0x00000080)   # USB - Function Reset Request Interrupt Flag 
  #values of USBVECINT when USB-interrupt occured
  const 
    USBVECINT_NONE* = 0x00000000
    USBVECINT_PWR_DROP* = 0x00000002
    USBVECINT_PLL_LOCK* = 0x00000004
    USBVECINT_PLL_SIGNAL* = 0x00000006
    USBVECINT_PLL_RANGE* = 0x00000008
    USBVECINT_PWR_VBUSOn* = 0x0000000A
    USBVECINT_PWR_VBUSOff* = 0x0000000C
    USBVECINT_USB_TIMESTAMP* = 0x00000010
    USBVECINT_INPUT_ENDPOINT0* = 0x00000012
    USBVECINT_OUTPUT_ENDPOINT0* = 0x00000014
    USBVECINT_RSTR* = 0x00000016
    USBVECINT_SUSR* = 0x00000018
    USBVECINT_RESR* = 0x0000001A
    USBVECINT_SETUP_PACKET_RECEIVED* = 0x00000020
    USBVECINT_STPOW_PACKET_RECEIVED* = 0x00000022
    USBVECINT_INPUT_ENDPOINT1* = 0x00000024
    USBVECINT_INPUT_ENDPOINT2* = 0x00000026
    USBVECINT_INPUT_ENDPOINT3* = 0x00000028
    USBVECINT_INPUT_ENDPOINT4* = 0x0000002A
    USBVECINT_INPUT_ENDPOINT5* = 0x0000002C
    USBVECINT_INPUT_ENDPOINT6* = 0x0000002E
    USBVECINT_INPUT_ENDPOINT7* = 0x00000030
    USBVECINT_OUTPUT_ENDPOINT1* = 0x00000032
    USBVECINT_OUTPUT_ENDPOINT2* = 0x00000034
    USBVECINT_OUTPUT_ENDPOINT3* = 0x00000036
    USBVECINT_OUTPUT_ENDPOINT4* = 0x00000038
    USBVECINT_OUTPUT_ENDPOINT5* = 0x0000003A
    USBVECINT_OUTPUT_ENDPOINT6* = 0x0000003C
    USBVECINT_OUTPUT_ENDPOINT7* = 0x0000003E
  # ========================================================================= 
  # USB Operation Registers 
  # ========================================================================= 
  const 
    USBIEPSIZXY_7_ADDR* = 0x000023FF
  sfrb(USBIEPSIZXY_BIT7, USBIEPSIZXY_7_ADDR)
  const 
    USBIEPBCTY_7_ADDR* = 0x000023FE
  sfrb(USBIEPBCTY_BIT7, USBIEPBCTY_7_ADDR)
  const 
    USBIEPBBAY_7_ADDR* = 0x000023FD
  sfrb(USBIEPBBAY_BIT7, USBIEPBBAY_7_ADDR)
  #sfrb    Spare    (0x23FC)   /* Not used  */
  #sfrb    Spare    (0x23FB)   /* Not used  */
  const 
    USBIEPBCTX_7_ADDR* = 0x000023FA
  sfrb(USBIEPBCTX_BIT7, USBIEPBCTX_7_ADDR)
  const 
    USBIEPBBAX_7_ADDR* = 0x000023F9
  sfrb(USBIEPBBAX_BIT7, USBIEPBBAX_7_ADDR)
  const 
    USBIEPCNF_7_ADDR* = 0x000023F8
  sfrb(USBIEPCNF_BIT7, USBIEPCNF_7_ADDR)
  const 
    USBIEPSIZXY_6_ADDR* = 0x000023F7
  sfrb(USBIEPSIZXY_BIT6, USBIEPSIZXY_6_ADDR)
  const 
    USBIEPBCTY_6_ADDR* = 0x000023F6
  sfrb(USBIEPBCTY_BIT6, USBIEPBCTY_6_ADDR)
  const 
    USBIEPBBAY_6_ADDR* = 0x000023F5
  sfrb(USBIEPBBAY_BIT6, USBIEPBBAY_6_ADDR)
  #sfrb    Spare    (0x23F4)   /* Not used  */
  #sfrb    Spare    (0x23F3)   /* Not used  */
  const 
    USBIEPBCTX_6_ADDR* = 0x000023F2
  sfrb(USBIEPBCTX_BIT6, USBIEPBCTX_6_ADDR)
  const 
    USBIEPBBAX_6_ADDR* = 0x000023F1
  sfrb(USBIEPBBAX_BIT6, USBIEPBBAX_6_ADDR)
  const 
    USBIEPCNF_6_ADDR* = 0x000023F0
  sfrb(USBIEPCNF_BIT6, USBIEPCNF_6_ADDR)
  const 
    USBIEPSIZXY_5_ADDR* = 0x000023EF
  sfrb(USBIEPSIZXY_BIT5, USBIEPSIZXY_5_ADDR)
  const 
    USBIEPBCTY_5_ADDR* = 0x000023EE
  sfrb(USBIEPBCTY_BIT5, USBIEPBCTY_5_ADDR)
  const 
    USBIEPBBAY_5_ADDR* = 0x000023ED
  sfrb(USBIEPBBAY_BIT5, USBIEPBBAY_5_ADDR)
  #sfrb    Spare    (0x23EC)   /* Not used */
  #sfrb    Spare    (0x23EB)   /* Not used */
  const 
    USBIEPBCTX_5_ADDR* = 0x000023EA
  sfrb(USBIEPBCTX_BIT5, USBIEPBCTX_5_ADDR)
  const 
    USBIEPBBAX_5_ADDR* = 0x000023E9
  sfrb(USBIEPBBAX_BIT5, USBIEPBBAX_5_ADDR)
  const 
    USBIEPCNF_5_ADDR* = 0x000023E8
  sfrb(USBIEPCNF_BIT5, USBIEPCNF_5_ADDR)
  const 
    USBIEPSIZXY_4_ADDR* = 0x000023E7
  sfrb(USBIEPSIZXY_BIT4, USBIEPSIZXY_4_ADDR)
  const 
    USBIEPBCTY_4_ADDR* = 0x000023E6
  sfrb(USBIEPBCTY_BIT4, USBIEPBCTY_4_ADDR)
  const 
    USBIEPBBAY_4_ADDR* = 0x000023E5
  sfrb(USBIEPBBAY_BIT4, USBIEPBBAY_4_ADDR)
  #sfrb    Spare    (0x23E4)   /* Not used */
  #sfrb    Spare    (0x23E3)   /* Not used */
  const 
    USBIEPBCTX_4_ADDR* = 0x000023E2
  sfrb(USBIEPBCTX_BIT4, USBIEPBCTX_4_ADDR)
  const 
    USBIEPBBAX_4_ADDR* = 0x000023E1
  sfrb(USBIEPBBAX_BIT4, USBIEPBBAX_4_ADDR)
  const 
    USBIEPCNF_4_ADDR* = 0x000023E0
  sfrb(USBIEPCNF_BIT4, USBIEPCNF_4_ADDR)
  const 
    USBIEPSIZXY_3_ADDR* = 0x000023DF
  sfrb(USBIEPSIZXY_BIT3, USBIEPSIZXY_3_ADDR)
  const 
    USBIEPBCTY_3_ADDR* = 0x000023DE
  sfrb(USBIEPBCTY_BIT3, USBIEPBCTY_3_ADDR)
  const 
    USBIEPBBAY_3_ADDR* = 0x000023DD
  sfrb(USBIEPBBAY_BIT3, USBIEPBBAY_3_ADDR)
  #sfrb    Spare    (0x23DC)   /* Not used */
  #sfrb    Spare    (0x23DB)   /* Not used */
  const 
    USBIEPBCTX_3_ADDR* = 0x000023DA
  sfrb(USBIEPBCTX_BIT3, USBIEPBCTX_3_ADDR)
  const 
    USBIEPBBAX_3_ADDR* = 0x000023D9
  sfrb(USBIEPBBAX_BIT3, USBIEPBBAX_3_ADDR)
  const 
    USBIEPCNF_3_ADDR* = 0x000023D8
  sfrb(USBIEPCNF_BIT3, USBIEPCNF_3_ADDR)
  const 
    USBIEPSIZXY_2_ADDR* = 0x000023D7
  sfrb(USBIEPSIZXY_BIT2, USBIEPSIZXY_2_ADDR)
  const 
    USBIEPBCTY_2_ADDR* = 0x000023D6
  sfrb(USBIEPBCTY_BIT2, USBIEPBCTY_2_ADDR)
  const 
    USBIEPBBAY_2_ADDR* = 0x000023D5
  sfrb(USBIEPBBAY_BIT2, USBIEPBBAY_2_ADDR)
  #sfrb    Spare    (0x23D4)   /* Not used */
  #sfrb    Spare    (0x23D3)   /* Not used */
  const 
    USBIEPBCTX_2_ADDR* = 0x000023D2
  sfrb(USBIEPBCTX_BIT2, USBIEPBCTX_2_ADDR)
  const 
    USBIEPBBAX_2_ADDR* = 0x000023D1
  sfrb(USBIEPBBAX_BIT2, USBIEPBBAX_2_ADDR)
  const 
    USBIEPCNF_2_ADDR* = 0x000023D0
  sfrb(USBIEPCNF_BIT2, USBIEPCNF_2_ADDR)
  const 
    USBIEPSIZXY_1_ADDR* = 0x000023CF
  sfrb(USBIEPSIZXY_BIT1, USBIEPSIZXY_1_ADDR)
  const 
    USBIEPBCTY_1_ADDR* = 0x000023CE
  sfrb(USBIEPBCTY_BIT1, USBIEPBCTY_1_ADDR)
  const 
    USBIEPBBAY_1_ADDR* = 0x000023CD
  sfrb(USBIEPBBAY_BIT1, USBIEPBBAY_1_ADDR)
  #sfrb    Spare    (0x23CC)   /* Not used */
  #sfrb    Spare    (0x23CB)   /* Not used */
  const 
    USBIEPBCTX_1_ADDR* = 0x000023CA
  sfrb(USBIEPBCTX_BIT1, USBIEPBCTX_1_ADDR)
  const 
    USBIEPBBAX_1_ADDR* = 0x000023C9
  sfrb(USBIEPBBAX_BIT1, USBIEPBBAX_1_ADDR)
  const 
    USBIEPCNF_1_ADDR* = 0x000023C8
  sfrb(USBIEPCNF_BIT1, USBIEPCNF_1_ADDR)
  #sfrb       (0x23C7)   0x0000 */
  #sfrb     RESERVED      (0x1C00)    /* */
  #sfrb       (0x23C0)   0x0000 */
  const 
    USBOEPSIZXY_7_ADDR* = 0x000023BF
  sfrb(USBOEPSIZXY_BIT7, USBOEPSIZXY_7_ADDR)
  const 
    USBOEPBCTY_7_ADDR* = 0x000023BE
  sfrb(USBOEPBCTY_BIT7, USBOEPBCTY_7_ADDR)
  const 
    USBOEPBBAY_7_ADDR* = 0x000023BD
  sfrb(USBOEPBBAY_BIT7, USBOEPBBAY_7_ADDR)
  #sfrb    Spare    (0x23BC)   /* Not used */
  #sfrb    Spare    (0x23BB)   /* Not used */
  const 
    USBOEPBCTX_7_ADDR* = 0x000023BA
  sfrb(USBOEPBCTX_BIT7, USBOEPBCTX_7_ADDR)
  const 
    USBOEPBBAX_7_ADDR* = 0x000023B9
  sfrb(USBOEPBBAX_BIT7, USBOEPBBAX_7_ADDR)
  const 
    USBOEPCNF_7_ADDR* = 0x000023B8
  sfrb(USBOEPCNF_BIT7, USBOEPCNF_7_ADDR)
  const 
    USBOEPSIZXY_6_ADDR* = 0x000023B7
  sfrb(USBOEPSIZXY_BIT6, USBOEPSIZXY_6_ADDR)
  const 
    USBOEPBCTY_6_ADDR* = 0x000023B6
  sfrb(USBOEPBCTY_BIT6, USBOEPBCTY_6_ADDR)
  const 
    USBOEPBBAY_6_ADDR* = 0x000023B5
  sfrb(USBOEPBBAY_BIT6, USBOEPBBAY_6_ADDR)
  #sfrb    Spare    (0x23B4)   /* Not used */
  #sfrb    Spare    (0x23B3)   /* Not used */
  const 
    USBOEPBCTX_6_ADDR* = 0x000023B2
  sfrb(USBOEPBCTX_BIT6, USBOEPBCTX_6_ADDR)
  const 
    USBOEPBBAX_6_ADDR* = 0x000023B1
  sfrb(USBOEPBBAX_BIT6, USBOEPBBAX_6_ADDR)
  const 
    USBOEPCNF_6_ADDR* = 0x000023B0
  sfrb(USBOEPCNF_BIT6, USBOEPCNF_6_ADDR)
  const 
    USBOEPSIZXY_5_ADDR* = 0x000023AF
  sfrb(USBOEPSIZXY_BIT5, USBOEPSIZXY_5_ADDR)
  const 
    USBOEPBCTY_5_ADDR* = 0x000023AE
  sfrb(USBOEPBCTY_BIT5, USBOEPBCTY_5_ADDR)
  const 
    USBOEPBBAY_5_ADDR* = 0x000023AD
  sfrb(USBOEPBBAY_BIT5, USBOEPBBAY_5_ADDR)
  #sfrb    Spare    (0x23AC)   /* Not used */
  #sfrb    Spare    (0x23AB)   /* Not used */
  const 
    USBOEPBCTX_5_ADDR* = 0x000023AA
  sfrb(USBOEPBCTX_BIT5, USBOEPBCTX_5_ADDR)
  const 
    USBOEPBBAX_5_ADDR* = 0x000023A9
  sfrb(USBOEPBBAX_BIT5, USBOEPBBAX_5_ADDR)
  const 
    USBOEPCNF_5_ADDR* = 0x000023A8
  sfrb(USBOEPCNF_BIT5, USBOEPCNF_5_ADDR)
  const 
    USBOEPSIZXY_4_ADDR* = 0x000023A7
  sfrb(USBOEPSIZXY_BIT4, USBOEPSIZXY_4_ADDR)
  const 
    USBOEPBCTY_4_ADDR* = 0x000023A6
  sfrb(USBOEPBCTY_BIT4, USBOEPBCTY_4_ADDR)
  const 
    USBOEPBBAY_4_ADDR* = 0x000023A5
  sfrb(USBOEPBBAY_BIT4, USBOEPBBAY_4_ADDR)
  #sfrb    Spare    (0x23A4)   /* Not used */
  #sfrb    Spare    (0x23A3)   /* Not used */
  const 
    USBOEPBCTX_4_ADDR* = 0x000023A2
  sfrb(USBOEPBCTX_BIT4, USBOEPBCTX_4_ADDR)
  const 
    USBOEPBBAX_4_ADDR* = 0x000023A1
  sfrb(USBOEPBBAX_BIT4, USBOEPBBAX_4_ADDR)
  const 
    USBOEPCNF_4_ADDR* = 0x000023A0
  sfrb(USBOEPCNF_BIT4, USBOEPCNF_4_ADDR)
  const 
    USBOEPSIZXY_3_ADDR* = 0x0000239F
  sfrb(USBOEPSIZXY_BIT3, USBOEPSIZXY_3_ADDR)
  const 
    USBOEPBCTY_3_ADDR* = 0x0000239E
  sfrb(USBOEPBCTY_BIT3, USBOEPBCTY_3_ADDR)
  const 
    USBOEPBBAY_3_ADDR* = 0x0000239D
  sfrb(USBOEPBBAY_BIT3, USBOEPBBAY_3_ADDR)
  #sfrb    Spare    (0x239C)   /* Not used */
  #sfrb    Spare    (0x239B)   /* Not used */
  const 
    USBOEPBCTX_3_ADDR* = 0x0000239A
  sfrb(USBOEPBCTX_BIT3, USBOEPBCTX_3_ADDR)
  const 
    USBOEPBBAX_3_ADDR* = 0x00002399
  sfrb(USBOEPBBAX_BIT3, USBOEPBBAX_3_ADDR)
  const 
    USBOEPCNF_3_ADDR* = 0x00002398
  sfrb(USBOEPCNF_BIT3, USBOEPCNF_3_ADDR)
  const 
    USBOEPSIZXY_2_ADDR* = 0x00002397
  sfrb(USBOEPSIZXY_BIT2, USBOEPSIZXY_2_ADDR)
  const 
    USBOEPBCTY_2_ADDR* = 0x00002396
  sfrb(USBOEPBCTY_BIT2, USBOEPBCTY_2_ADDR)
  const 
    USBOEPBBAY_2_ADDR* = 0x00002395
  sfrb(USBOEPBBAY_BIT2, USBOEPBBAY_2_ADDR)
  #sfrb    Spare    (0x2394)   /* Not used */
  #sfrb    Spare    (0x2393)   /* Not used */
  const 
    USBOEPBCTX_2_ADDR* = 0x00002392
  sfrb(USBOEPBCTX_BIT2, USBOEPBCTX_2_ADDR)
  const 
    USBOEPBBAX_2_ADDR* = 0x00002391
  sfrb(USBOEPBBAX_BIT2, USBOEPBBAX_2_ADDR)
  const 
    USBOEPCNF_2_ADDR* = 0x00002390
  sfrb(USBOEPCNF_BIT2, USBOEPCNF_2_ADDR)
  const 
    USBOEPSIZXY_1_ADDR* = 0x0000238F
  sfrb(USBOEPSIZXY_BIT1, USBOEPSIZXY_1_ADDR)
  const 
    USBOEPBCTY_1_ADDR* = 0x0000238E
  sfrb(USBOEPBCTY_BIT1, USBOEPBCTY_1_ADDR)
  const 
    USBOEPBBAY_1_ADDR* = 0x0000238D
  sfrb(USBOEPBBAY_BIT1, USBOEPBBAY_1_ADDR)
  #sfrb    Spare    (0x238C)   /* Not used */
  #sfrb    Spare    (0x238B)   /* Not used */
  const 
    USBOEPBCTX_1_ADDR* = 0x0000238A
  sfrb(USBOEPBCTX_BIT1, USBOEPBCTX_1_ADDR)
  const 
    USBOEPBBAX_1_ADDR* = 0x00002389
  sfrb(USBOEPBBAX_BIT1, USBOEPBBAX_1_ADDR)
  const 
    USBOEPCNF_1_ADDR* = 0x00002388
  sfrb(USBOEPCNF_BIT1, USBOEPCNF_1_ADDR)
  const 
    USBSUBLK_ADDR* = 0x00002380
  sfrb(USBSUBLK, USBSUBLK_ADDR)
  const 
    USBIEP0BUF_ADDR* = 0x00002378
  sfrb(USBIEP0BUF, USBIEP0BUF_ADDR)
  const 
    USBOEP0BUF_ADDR* = 0x00002370
  sfrb(USBOEP0BUF, USBOEP0BUF_ADDR)
  const 
    USBTOPBUFF_ADDR* = 0x0000236F
  sfrb(USBTOPBUFF, USBTOPBUFF_ADDR)
  #         (1904 Bytes)               /* Buffer space */
  const 
    USBSTABUFF_ADDR* = 0x00001C00
  sfrb(USBSTABUFF, USBSTABUFF_ADDR)
  # USBIEPCNF_n Control Bits 
  # USBOEPCNF_n Control Bits 
  ##define RESERVED       (0x0001)  /* USB -  */
  ##define RESERVED       (0x0001)  /* USB -  */
  const 
    DBUF* = (0x00000010)      # USB - Double Buffer Enable 
  ##define RESERVED       (0x0040)  /* USB -  */
  # USBIEPBCNT_n Control Bits 
  # USBOEPBCNT_n Control Bits 
  const 
    CNT4* = (0x00000010)      # USB - Byte Count Bit 3 
    CNT5* = (0x00000020)      # USB - Byte Count Bit 3 
    CNT6* = (0x00000040)      # USB - Byte Count Bit 3 
  #***********************************************************
  # UNIFIED CLOCK SYSTEM
  #**********************************************************
  const 
    MSP430_HAS_UCS* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_UCS* = 0x00000160
    UCSCTL0_ADDR* = 0x00000160
  sfrb(UCSCTL0_L, UCSCTL0_ADDR)
  sfrb(UCSCTL0_H, UCSCTL0_ADDR + 1)
  sfrw(UCSCTL0, UCSCTL0_ADDR)
  const 
    UCSCTL1_ADDR* = 0x00000162
  sfrb(UCSCTL1_L, UCSCTL1_ADDR)
  sfrb(UCSCTL1_H, UCSCTL1_ADDR + 1)
  sfrw(UCSCTL1, UCSCTL1_ADDR)
  const 
    UCSCTL2_ADDR* = 0x00000164
  sfrb(UCSCTL2_L, UCSCTL2_ADDR)
  sfrb(UCSCTL2_H, UCSCTL2_ADDR + 1)
  sfrw(UCSCTL2, UCSCTL2_ADDR)
  const 
    UCSCTL3_ADDR* = 0x00000166
  sfrb(UCSCTL3_L, UCSCTL3_ADDR)
  sfrb(UCSCTL3_H, UCSCTL3_ADDR + 1)
  sfrw(UCSCTL3, UCSCTL3_ADDR)
  const 
    UCSCTL4_ADDR* = 0x00000168
  sfrb(UCSCTL4_L, UCSCTL4_ADDR)
  sfrb(UCSCTL4_H, UCSCTL4_ADDR + 1)
  sfrw(UCSCTL4, UCSCTL4_ADDR)
  const 
    UCSCTL5_ADDR* = 0x0000016A
  sfrb(UCSCTL5_L, UCSCTL5_ADDR)
  sfrb(UCSCTL5_H, UCSCTL5_ADDR + 1)
  sfrw(UCSCTL5, UCSCTL5_ADDR)
  const 
    UCSCTL6_ADDR* = 0x0000016C
  sfrb(UCSCTL6_L, UCSCTL6_ADDR)
  sfrb(UCSCTL6_H, UCSCTL6_ADDR + 1)
  sfrw(UCSCTL6, UCSCTL6_ADDR)
  const 
    UCSCTL7_ADDR* = 0x0000016E
  sfrb(UCSCTL7_L, UCSCTL7_ADDR)
  sfrb(UCSCTL7_H, UCSCTL7_ADDR + 1)
  sfrw(UCSCTL7, UCSCTL7_ADDR)
  const 
    UCSCTL8_ADDR* = 0x00000170
  sfrb(UCSCTL8_L, UCSCTL8_ADDR)
  sfrb(UCSCTL8_H, UCSCTL8_ADDR + 1)
  sfrw(UCSCTL8, UCSCTL8_ADDR)
  # UCSCTL0 Control Bits 
  ##define RESERVED            (0x0001)    /* RESERVED */
  ##define RESERVED            (0x0002)    /* RESERVED */
  ##define RESERVED            (0x0004)    /* RESERVED */
  const 
    MOD0* = (0x00000008)      # Modulation Bit Counter Bit : 0 
    MOD1* = (0x00000010)      # Modulation Bit Counter Bit : 1 
    MOD2* = (0x00000020)      # Modulation Bit Counter Bit : 2 
    MOD3* = (0x00000040)      # Modulation Bit Counter Bit : 3 
    MOD4* = (0x00000080)      # Modulation Bit Counter Bit : 4 
    DCO0* = (0x00000100)      # DCO TAP Bit : 0 
    DCO1* = (0x00000200)      # DCO TAP Bit : 1 
    DCO2* = (0x00000400)      # DCO TAP Bit : 2 
    DCO3* = (0x00000800)      # DCO TAP Bit : 3 
    DCO4* = (0x00001000)      # DCO TAP Bit : 4 
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL0 Control Bits 
  ##define RESERVED            (0x0001)    /* RESERVED */
  ##define RESERVED            (0x0002)    /* RESERVED */
  ##define RESERVED            (0x0004)    /* RESERVED */
  const 
    MOD0_L* = (0x00000008)    # Modulation Bit Counter Bit : 0 
    MOD1_L* = (0x00000010)    # Modulation Bit Counter Bit : 1 
    MOD2_L* = (0x00000020)    # Modulation Bit Counter Bit : 2 
    MOD3_L* = (0x00000040)    # Modulation Bit Counter Bit : 3 
    MOD4_L* = (0x00000080)    # Modulation Bit Counter Bit : 4 
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL0 Control Bits 
  ##define RESERVED            (0x0001)    /* RESERVED */
  ##define RESERVED            (0x0002)    /* RESERVED */
  ##define RESERVED            (0x0004)    /* RESERVED */
  const 
    DCO0_H* = (0x00000001)    # DCO TAP Bit : 0 
    DCO1_H* = (0x00000002)    # DCO TAP Bit : 1 
    DCO2_H* = (0x00000004)    # DCO TAP Bit : 2 
    DCO3_H* = (0x00000008)    # DCO TAP Bit : 3 
    DCO4_H* = (0x00000010)    # DCO TAP Bit : 4 
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL1 Control Bits 
  const 
    DISMOD* = (0x00000001)    # Disable Modulation 
  ##define RESERVED            (0x0002)    /* RESERVED */
  ##define RESERVED            (0x0004)    /* RESERVED */
  ##define RESERVED            (0x0008)    /* RESERVED */
  const 
    DCORSEL0* = (0x00000010)  # DCO Freq. Range Select Bit : 0 
    DCORSEL1* = (0x00000020)  # DCO Freq. Range Select Bit : 1 
    DCORSEL2* = (0x00000040)  # DCO Freq. Range Select Bit : 2 
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0100)    /* RESERVED */
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL1 Control Bits 
  const 
    DISMOD_L* = (0x00000001)  # Disable Modulation 
  ##define RESERVED            (0x0002)    /* RESERVED */
  ##define RESERVED            (0x0004)    /* RESERVED */
  ##define RESERVED            (0x0008)    /* RESERVED */
  const 
    DCORSEL0_L* = (0x00000010) # DCO Freq. Range Select Bit : 0 
    DCORSEL1_L* = (0x00000020) # DCO Freq. Range Select Bit : 1 
    DCORSEL2_L* = (0x00000040) # DCO Freq. Range Select Bit : 2 
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0100)    /* RESERVED */
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL1 Control Bits 
  ##define RESERVED            (0x0002)    /* RESERVED */
  ##define RESERVED            (0x0004)    /* RESERVED */
  ##define RESERVED            (0x0008)    /* RESERVED */
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0100)    /* RESERVED */
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  const 
    DCORSEL_BIT0* = (0x00000000) # DCO RSEL 0 
    DCORSEL_BIT1* = (0x00000010) # DCO RSEL 1 
    DCORSEL_BIT2* = (0x00000020) # DCO RSEL 2 
    DCORSEL_BIT3* = (0x00000030) # DCO RSEL 3 
    DCORSEL_BIT4* = (0x00000040) # DCO RSEL 4 
    DCORSEL_BIT5* = (0x00000050) # DCO RSEL 5 
    DCORSEL_BIT6* = (0x00000060) # DCO RSEL 6 
    DCORSEL_BIT7* = (0x00000070) # DCO RSEL 7 
  # UCSCTL2 Control Bits 
  const 
    FLLN0* = (0x00000001)     # FLL Multipier Bit : 0 
    FLLN1* = (0x00000002)     # FLL Multipier Bit : 1 
    FLLN2* = (0x00000004)     # FLL Multipier Bit : 2 
    FLLN3* = (0x00000008)     # FLL Multipier Bit : 3 
    FLLN4* = (0x00000010)     # FLL Multipier Bit : 4 
    FLLN5* = (0x00000020)     # FLL Multipier Bit : 5 
    FLLN6* = (0x00000040)     # FLL Multipier Bit : 6 
    FLLN7* = (0x00000080)     # FLL Multipier Bit : 7 
    FLLN8* = (0x00000100)     # FLL Multipier Bit : 8 
    FLLN9* = (0x00000200)     # FLL Multipier Bit : 9 
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  const 
    FLLD0* = (0x00001000)     # Loop Divider Bit : 0 
    FLLD1* = (0x00002000)     # Loop Divider Bit : 1 
    FLLD2* = (0x00004000)     # Loop Divider Bit : 1 
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL2 Control Bits 
  const 
    FLLN0_L* = (0x00000001)   # FLL Multipier Bit : 0 
    FLLN1_L* = (0x00000002)   # FLL Multipier Bit : 1 
    FLLN2_L* = (0x00000004)   # FLL Multipier Bit : 2 
    FLLN3_L* = (0x00000008)   # FLL Multipier Bit : 3 
    FLLN4_L* = (0x00000010)   # FLL Multipier Bit : 4 
    FLLN5_L* = (0x00000020)   # FLL Multipier Bit : 5 
    FLLN6_L* = (0x00000040)   # FLL Multipier Bit : 6 
    FLLN7_L* = (0x00000080)   # FLL Multipier Bit : 7 
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL2 Control Bits 
  const 
    FLLN8_H* = (0x00000001)   # FLL Multipier Bit : 8 
    FLLN9_H* = (0x00000002)   # FLL Multipier Bit : 9 
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  const 
    FLLD0_H* = (0x00000010)   # Loop Divider Bit : 0 
    FLLD1_H* = (0x00000020)   # Loop Divider Bit : 1 
    FLLD2_H* = (0x00000040)   # Loop Divider Bit : 1 
  ##define RESERVED            (0x8000)    /* RESERVED */
  const 
    FLLD_BIT0* = (0x00000000)    # Multiply Selected Loop Freq. 1 
    FLLD_BIT1* = (0x00001000)    # Multiply Selected Loop Freq. 2 
    FLLD_BIT2* = (0x00002000)    # Multiply Selected Loop Freq. 4 
    FLLD_BIT3* = (0x00003000)    # Multiply Selected Loop Freq. 8 
    FLLD_BIT4* = (0x00004000)    # Multiply Selected Loop Freq. 16 
    FLLD_BIT5* = (0x00005000)    # Multiply Selected Loop Freq. 32 
    FLLD_BIT6* = (0x00006000)    # Multiply Selected Loop Freq. 32 
    FLLD_BIT7* = (0x00007000)    # Multiply Selected Loop Freq. 32 
    FLLD_VAL_1* = (0x00000000)   # Multiply Selected Loop Freq. By 1 
    FLLD_VAL_2* = (0x00001000)   # Multiply Selected Loop Freq. By 2 
    FLLD_VAL_4* = (0x00002000)   # Multiply Selected Loop Freq. By 4 
    FLLD_VAL_8* = (0x00003000)   # Multiply Selected Loop Freq. By 8 
    FLLD_VAL_16* = (0x00004000)  # Multiply Selected Loop Freq. By 16 
    FLLD_VAL_32* = (0x00005000)  # Multiply Selected Loop Freq. By 32 
  # UCSCTL3 Control Bits 
  const 
    FLLREFDIV0* = (0x00000001) # Reference Divider Bit : 0 
    FLLREFDIV1* = (0x00000002) # Reference Divider Bit : 1 
    FLLREFDIV2* = (0x00000004) # Reference Divider Bit : 2 
  ##define RESERVED            (0x0008)    /* RESERVED */
  const 
    SELREF0* = (0x00000010)   # FLL Reference Clock Select Bit : 0 
    SELREF1* = (0x00000020)   # FLL Reference Clock Select Bit : 1 
    SELREF2* = (0x00000040)   # FLL Reference Clock Select Bit : 2 
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0100)    /* RESERVED */
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL3 Control Bits 
  const 
    FLLREFDIV0_L* = (0x00000001) # Reference Divider Bit : 0 
    FLLREFDIV1_L* = (0x00000002) # Reference Divider Bit : 1 
    FLLREFDIV2_L* = (0x00000004) # Reference Divider Bit : 2 
  ##define RESERVED            (0x0008)    /* RESERVED */
  const 
    SELREF0_L* = (0x00000010) # FLL Reference Clock Select Bit : 0 
    SELREF1_L* = (0x00000020) # FLL Reference Clock Select Bit : 1 
    SELREF2_L* = (0x00000040) # FLL Reference Clock Select Bit : 2 
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0100)    /* RESERVED */
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL3 Control Bits 
  ##define RESERVED            (0x0008)    /* RESERVED */
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0100)    /* RESERVED */
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  const 
    FLLREFDIV_BIT0* = (0x00000000) # Reference Divider: f(LFCLK)/1 
    FLLREFDIV_BIT1* = (0x00000001) # Reference Divider: f(LFCLK)/2 
    FLLREFDIV_BIT2* = (0x00000002) # Reference Divider: f(LFCLK)/4 
    FLLREFDIV_BIT3* = (0x00000003) # Reference Divider: f(LFCLK)/8 
    FLLREFDIV_BIT4* = (0x00000004) # Reference Divider: f(LFCLK)/12 
    FLLREFDIV_BIT5* = (0x00000005) # Reference Divider: f(LFCLK)/16 
    FLLREFDIV_BIT6* = (0x00000006) # Reference Divider: f(LFCLK)/16 
    FLLREFDIV_BIT7* = (0x00000007) # Reference Divider: f(LFCLK)/16 
    FLLREFDIV_VAL_1* = (0x00000000) # Reference Divider: f(LFCLK)/1 
    FLLREFDIV_VAL_2* = (0x00000001) # Reference Divider: f(LFCLK)/2 
    FLLREFDIV_VAL_4* = (0x00000002) # Reference Divider: f(LFCLK)/4 
    FLLREFDIV_VAL_8* = (0x00000003) # Reference Divider: f(LFCLK)/8 
    FLLREFDIV_VAL_12* = (0x00000004) # Reference Divider: f(LFCLK)/12 
    FLLREFDIV_VAL_16* = (0x00000005) # Reference Divider: f(LFCLK)/16 
    SELREF_BIT0* = (0x00000000)  # FLL Reference Clock Select 0 
    SELREF_BIT1* = (0x00000010)  # FLL Reference Clock Select 1 
    SELREF_BIT2* = (0x00000020)  # FLL Reference Clock Select 2 
    SELREF_BIT3* = (0x00000030)  # FLL Reference Clock Select 3 
    SELREF_BIT4* = (0x00000040)  # FLL Reference Clock Select 4 
    SELREF_BIT5* = (0x00000050)  # FLL Reference Clock Select 5 
    SELREF_BIT6* = (0x00000060)  # FLL Reference Clock Select 6 
    SELREF_BIT7* = (0x00000070)  # FLL Reference Clock Select 7 
    SELREF_XT1CLK* = (0x00000000) # Multiply Selected Loop Freq. By XT1CLK 
    SELREF_REFOCLK* = (0x00000020) # Multiply Selected Loop Freq. By REFOCLK 
    SELREF_XT2CLK* = (0x00000050) # Multiply Selected Loop Freq. By XT2CLK 
  # UCSCTL4 Control Bits 
  const 
    SELM0* = (0x00000001)     # MCLK Source Select Bit: 0 
    SELM1* = (0x00000002)     # MCLK Source Select Bit: 1 
    SELM2* = (0x00000004)     # MCLK Source Select Bit: 2 
  ##define RESERVED            (0x0008)    /* RESERVED */
  const 
    SELS0* = (0x00000010)     # SMCLK Source Select Bit: 0 
    SELS1* = (0x00000020)     # SMCLK Source Select Bit: 1 
    SELS2* = (0x00000040)     # SMCLK Source Select Bit: 2 
  ##define RESERVED            (0x0080)    /* RESERVED */
  const 
    SELA0* = (0x00000100)     # ACLK Source Select Bit: 0 
    SELA1* = (0x00000200)     # ACLK Source Select Bit: 1 
    SELA2* = (0x00000400)     # ACLK Source Select Bit: 2 
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL4 Control Bits 
  const 
    SELM0_L* = (0x00000001)   # MCLK Source Select Bit: 0 
    SELM1_L* = (0x00000002)   # MCLK Source Select Bit: 1 
    SELM2_L* = (0x00000004)   # MCLK Source Select Bit: 2 
  ##define RESERVED            (0x0008)    /* RESERVED */
  const 
    SELS0_L* = (0x00000010)   # SMCLK Source Select Bit: 0 
    SELS1_L* = (0x00000020)   # SMCLK Source Select Bit: 1 
    SELS2_L* = (0x00000040)   # SMCLK Source Select Bit: 2 
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL4 Control Bits 
  ##define RESERVED            (0x0008)    /* RESERVED */
  ##define RESERVED            (0x0080)    /* RESERVED */
  const 
    SELA0_H* = (0x00000001)   # ACLK Source Select Bit: 0 
    SELA1_H* = (0x00000002)   # ACLK Source Select Bit: 1 
    SELA2_H* = (0x00000004)   # ACLK Source Select Bit: 2 
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  const 
    SELM_BIT0* = (0x00000000)    # MCLK Source Select 0 
    SELM_BIT1* = (0x00000001)    # MCLK Source Select 1 
    SELM_BIT2* = (0x00000002)    # MCLK Source Select 2 
    SELM_BIT3* = (0x00000003)    # MCLK Source Select 3 
    SELM_BIT4* = (0x00000004)    # MCLK Source Select 4 
    SELM_BIT5* = (0x00000005)    # MCLK Source Select 5 
    SELM_BIT6* = (0x00000006)    # MCLK Source Select 6 
    SELM_BIT7* = (0x00000007)    # MCLK Source Select 7 
    SELM_XT1CLK* = (0x00000000) # MCLK Source Select XT1CLK 
    SELM_VLOCLK* = (0x00000001) # MCLK Source Select VLOCLK 
    SELM_REFOCLK* = (0x00000002) # MCLK Source Select REFOCLK 
    SELM_DCOCLK* = (0x00000003) # MCLK Source Select DCOCLK 
    SELM_DCOCLKDIV* = (0x00000004) # MCLK Source Select DCOCLKDIV 
    SELM_XT2CLK* = (0x00000005) # MCLK Source Select XT2CLK 
    SELS_BIT0* = (0x00000000)    # SMCLK Source Select 0 
    SELS_BIT1* = (0x00000010)    # SMCLK Source Select 1 
    SELS_BIT2* = (0x00000020)    # SMCLK Source Select 2 
    SELS_BIT3* = (0x00000030)    # SMCLK Source Select 3 
    SELS_BIT4* = (0x00000040)    # SMCLK Source Select 4 
    SELS_BIT5* = (0x00000050)    # SMCLK Source Select 5 
    SELS_BIT6* = (0x00000060)    # SMCLK Source Select 6 
    SELS_BIT7* = (0x00000070)    # SMCLK Source Select 7 
    SELS_XT1CLK* = (0x00000000) # SMCLK Source Select XT1CLK 
    SELS_VLOCLK* = (0x00000010) # SMCLK Source Select VLOCLK 
    SELS_REFOCLK* = (0x00000020) # SMCLK Source Select REFOCLK 
    SELS_DCOCLK* = (0x00000030) # SMCLK Source Select DCOCLK 
    SELS_DCOCLKDIV* = (0x00000040) # SMCLK Source Select DCOCLKDIV 
    SELS_XT2CLK* = (0x00000050) # SMCLK Source Select XT2CLK 
    SELA_BIT0* = (0x00000000)    # ACLK Source Select 0 
    SELA_BIT1* = (0x00000100)    # ACLK Source Select 1 
    SELA_BIT2* = (0x00000200)    # ACLK Source Select 2 
    SELA_BIT3* = (0x00000300)    # ACLK Source Select 3 
    SELA_BIT4* = (0x00000400)    # ACLK Source Select 4 
    SELA_BIT5* = (0x00000500)    # ACLK Source Select 5 
    SELA_BIT6* = (0x00000600)    # ACLK Source Select 6 
    SELA_BIT7* = (0x00000700)    # ACLK Source Select 7 
    SELA_XT1CLK* = (0x00000000) # ACLK Source Select XT1CLK 
    SELA_VLOCLK* = (0x00000100) # ACLK Source Select VLOCLK 
    SELA_REFOCLK* = (0x00000200) # ACLK Source Select REFOCLK 
    SELA_DCOCLK* = (0x00000300) # ACLK Source Select DCOCLK 
    SELA_DCOCLKDIV* = (0x00000400) # ACLK Source Select DCOCLKDIV 
    SELA_XT2CLK* = (0x00000500) # ACLK Source Select XT2CLK 
  # UCSCTL5 Control Bits 
  const 
    DIVM0* = (0x00000001)     # MCLK Divider Bit: 0 
    DIVM1* = (0x00000002)     # MCLK Divider Bit: 1 
    DIVM2* = (0x00000004)     # MCLK Divider Bit: 2 
  ##define RESERVED            (0x0008)    /* RESERVED */
  const 
    DIVS0* = (0x00000010)     # SMCLK Divider Bit: 0 
    DIVS1* = (0x00000020)     # SMCLK Divider Bit: 1 
    DIVS2* = (0x00000040)     # SMCLK Divider Bit: 2 
  ##define RESERVED            (0x0080)    /* RESERVED */
  const 
    DIVA0* = (0x00000100)     # ACLK Divider Bit: 0 
    DIVA1* = (0x00000200)     # ACLK Divider Bit: 1 
    DIVA2* = (0x00000400)     # ACLK Divider Bit: 2 
  ##define RESERVED            (0x0800)    /* RESERVED */
  const 
    DIVPA0* = (0x00001000)    # ACLK from Pin Divider Bit: 0 
    DIVPA1* = (0x00002000)    # ACLK from Pin Divider Bit: 1 
    DIVPA2* = (0x00004000)    # ACLK from Pin Divider Bit: 2 
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL5 Control Bits 
  const 
    DIVM0_L* = (0x00000001)   # MCLK Divider Bit: 0 
    DIVM1_L* = (0x00000002)   # MCLK Divider Bit: 1 
    DIVM2_L* = (0x00000004)   # MCLK Divider Bit: 2 
  ##define RESERVED            (0x0008)    /* RESERVED */
  const 
    DIVS0_L* = (0x00000010)   # SMCLK Divider Bit: 0 
    DIVS1_L* = (0x00000020)   # SMCLK Divider Bit: 1 
    DIVS2_L* = (0x00000040)   # SMCLK Divider Bit: 2 
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL5 Control Bits 
  ##define RESERVED            (0x0008)    /* RESERVED */
  ##define RESERVED            (0x0080)    /* RESERVED */
  const 
    DIVA0_H* = (0x00000001)   # ACLK Divider Bit: 0 
    DIVA1_H* = (0x00000002)   # ACLK Divider Bit: 1 
    DIVA2_H* = (0x00000004)   # ACLK Divider Bit: 2 
  ##define RESERVED            (0x0800)    /* RESERVED */
  const 
    DIVPA0_H* = (0x00000010)  # ACLK from Pin Divider Bit: 0 
    DIVPA1_H* = (0x00000020)  # ACLK from Pin Divider Bit: 1 
    DIVPA2_H* = (0x00000040)  # ACLK from Pin Divider Bit: 2 
  ##define RESERVED            (0x8000)    /* RESERVED */
  const 
    DIVM_BIT0* = (0x00000000)    # MCLK Source Divider 0 
    DIVM_BIT1* = (0x00000001)    # MCLK Source Divider 1 
    DIVM_BIT2* = (0x00000002)    # MCLK Source Divider 2 
    DIVM_BIT3* = (0x00000003)    # MCLK Source Divider 3 
    DIVM_BIT4* = (0x00000004)    # MCLK Source Divider 4 
    DIVM_BIT5* = (0x00000005)    # MCLK Source Divider 5 
    DIVM_BIT6* = (0x00000006)    # MCLK Source Divider 6 
    DIVM_BIT7* = (0x00000007)    # MCLK Source Divider 7 
    DIVM_VAL_1* = (0x00000000)   # MCLK Source Divider f(MCLK)/1 
    DIVM_VAL_2* = (0x00000001)   # MCLK Source Divider f(MCLK)/2 
    DIVM_VAL_4* = (0x00000002)   # MCLK Source Divider f(MCLK)/4 
    DIVM_VAL_8* = (0x00000003)   # MCLK Source Divider f(MCLK)/8 
    DIVM_VAL_16* = (0x00000004)  # MCLK Source Divider f(MCLK)/16 
    DIVM_VAL_32* = (0x00000005)  # MCLK Source Divider f(MCLK)/32 
    DIVS_BIT0* = (0x00000000)    # SMCLK Source Divider 0 
    DIVS_BIT1* = (0x00000010)    # SMCLK Source Divider 1 
    DIVS_BIT2* = (0x00000020)    # SMCLK Source Divider 2 
    DIVS_BIT3* = (0x00000030)    # SMCLK Source Divider 3 
    DIVS_BIT4* = (0x00000040)    # SMCLK Source Divider 4 
    DIVS_BIT5* = (0x00000050)    # SMCLK Source Divider 5 
    DIVS_BIT6* = (0x00000060)    # SMCLK Source Divider 6 
    DIVS_BIT7* = (0x00000070)    # SMCLK Source Divider 7 
    DIVS_VAL_1* = (0x00000000)   # SMCLK Source Divider f(SMCLK)/1 
    DIVS_VAL_2* = (0x00000010)   # SMCLK Source Divider f(SMCLK)/2 
    DIVS_VAL_4* = (0x00000020)   # SMCLK Source Divider f(SMCLK)/4 
    DIVS_VAL_8* = (0x00000030)   # SMCLK Source Divider f(SMCLK)/8 
    DIVS_VAL_16* = (0x00000040)  # SMCLK Source Divider f(SMCLK)/16 
    DIVS_VAL_32* = (0x00000050)  # SMCLK Source Divider f(SMCLK)/32 
    DIVA_BIT0* = (0x00000000)    # ACLK Source Divider 0 
    DIVA_BIT1* = (0x00000100)    # ACLK Source Divider 1 
    DIVA_BIT2* = (0x00000200)    # ACLK Source Divider 2 
    DIVA_BIT3* = (0x00000300)    # ACLK Source Divider 3 
    DIVA_BIT4* = (0x00000400)    # ACLK Source Divider 4 
    DIVA_BIT5* = (0x00000500)    # ACLK Source Divider 5 
    DIVA_BIT6* = (0x00000600)    # ACLK Source Divider 6 
    DIVA_BIT7* = (0x00000700)    # ACLK Source Divider 7 
    DIVA_VAL_1* = (0x00000000)   # ACLK Source Divider f(ACLK)/1 
    DIVA_VAL_2* = (0x00000100)   # ACLK Source Divider f(ACLK)/2 
    DIVA_VAL_4* = (0x00000200)   # ACLK Source Divider f(ACLK)/4 
    DIVA_VAL_8* = (0x00000300)   # ACLK Source Divider f(ACLK)/8 
    DIVA_VAL_16* = (0x00000400)  # ACLK Source Divider f(ACLK)/16 
    DIVA_VAL_32* = (0x00000500)  # ACLK Source Divider f(ACLK)/32 
    DIVPA_BIT0* = (0x00000000)   # ACLK from Pin Source Divider 0 
    DIVPA_BIT1* = (0x00001000)   # ACLK from Pin Source Divider 1 
    DIVPA_BIT2* = (0x00002000)   # ACLK from Pin Source Divider 2 
    DIVPA_BIT3* = (0x00003000)   # ACLK from Pin Source Divider 3 
    DIVPA_BIT4* = (0x00004000)   # ACLK from Pin Source Divider 4 
    DIVPA_BIT5* = (0x00005000)   # ACLK from Pin Source Divider 5 
    DIVPA_BIT6* = (0x00006000)   # ACLK from Pin Source Divider 6 
    DIVPA_BIT7* = (0x00007000)   # ACLK from Pin Source Divider 7 
    DIVPA_VAL_1* = (0x00000000)  # ACLK from Pin Source Divider f(ACLK)/1 
    DIVPA_VAL_2* = (0x00001000)  # ACLK from Pin Source Divider f(ACLK)/2 
    DIVPA_VAL_4* = (0x00002000)  # ACLK from Pin Source Divider f(ACLK)/4 
    DIVPA_VAL_8* = (0x00003000)  # ACLK from Pin Source Divider f(ACLK)/8 
    DIVPA_VAL_16* = (0x00004000) # ACLK from Pin Source Divider f(ACLK)/16 
    DIVPA_VAL_32* = (0x00005000) # ACLK from Pin Source Divider f(ACLK)/32 
  # UCSCTL6 Control Bits 
  const 
    XT1OFF* = (0x00000001)    # High Frequency Oscillator 1 (XT1) disable 
    SMCLKOFF* = (0x00000002)  # SMCLK Off 
    XCAP0* = (0x00000004)     # XIN/XOUT Cap Bit: 0 
    XCAP1* = (0x00000008)     # XIN/XOUT Cap Bit: 1 
    XT1BYPASS* = (0x00000010) # XT1 bypass mode : 0: internal 1:sourced from external pin 
    XTS* = (0x00000020)       # 1: Selects high-freq. oscillator 
    XT1DRIVE0* = (0x00000040) # XT1 Drive Level mode Bit 0 
    XT1DRIVE1* = (0x00000080) # XT1 Drive Level mode Bit 1 
    XT2OFF* = (0x00000100)    # High Frequency Oscillator 2 (XT2) disable 
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  const 
    XT2BYPASS* = (0x00001000) # XT2 bypass mode : 0: internal 1:sourced from external pin 
  ##define RESERVED            (0x2000)    /* RESERVED */
  const 
    XT2DRIVE0* = (0x00004000) # XT2 Drive Level mode Bit 0 
    XT2DRIVE1* = (0x00008000) # XT2 Drive Level mode Bit 1 
  # UCSCTL6 Control Bits 
  const 
    XT1OFF_L* = (0x00000001)  # High Frequency Oscillator 1 (XT1) disable 
    SMCLKOFF_L* = (0x00000002) # SMCLK Off 
    XCAP0_L* = (0x00000004)   # XIN/XOUT Cap Bit: 0 
    XCAP1_L* = (0x00000008)   # XIN/XOUT Cap Bit: 1 
    XT1BYPASS_L* = (0x00000010) # XT1 bypass mode : 0: internal 1:sourced from external pin 
    XTS_L* = (0x00000020)     # 1: Selects high-freq. oscillator 
    XT1DRIVE0_L* = (0x00000040) # XT1 Drive Level mode Bit 0 
    XT1DRIVE1_L* = (0x00000080) # XT1 Drive Level mode Bit 1 
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  # UCSCTL6 Control Bits 
  const 
    XT2OFF_H* = (0x00000001)  # High Frequency Oscillator 2 (XT2) disable 
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  const 
    XT2BYPASS_H* = (0x00000010) # XT2 bypass mode : 0: internal 1:sourced from external pin 
  ##define RESERVED            (0x2000)    /* RESERVED */
  const 
    XT2DRIVE0_H* = (0x00000040) # XT2 Drive Level mode Bit 0 
    XT2DRIVE1_H* = (0x00000080) # XT2 Drive Level mode Bit 1 
    XCAP_BIT0* = (0x00000000)    # XIN/XOUT Cap 0 
    XCAP_BIT1* = (0x00000004)    # XIN/XOUT Cap 1 
    XCAP_BIT2* = (0x00000008)    # XIN/XOUT Cap 2 
    XCAP_BIT3* = (0x0000000C)    # XIN/XOUT Cap 3 
    XT1DRIVE_BIT0* = (0x00000000) # XT1 Drive Level mode: 0 
    XT1DRIVE_BIT1* = (0x00000040) # XT1 Drive Level mode: 1 
    XT1DRIVE_BIT2* = (0x00000080) # XT1 Drive Level mode: 2 
    XT1DRIVE_BIT3* = (0x000000C0) # XT1 Drive Level mode: 3 
    XT2DRIVE_BIT0* = (0x00000000) # XT2 Drive Level mode: 0 
    XT2DRIVE_BIT1* = (0x00004000) # XT2 Drive Level mode: 1 
    XT2DRIVE_BIT2* = (0x00008000) # XT2 Drive Level mode: 2 
    XT2DRIVE_BIT3* = (0x0000C000) # XT2 Drive Level mode: 3 
  # UCSCTL7 Control Bits 
  const 
    DCOFFG* = (0x00000001)    # DCO Fault Flag 
    XT1LFOFFG* = (0x00000002) # XT1 Low Frequency Oscillator Fault Flag 
  ##define RESERVED            (0x0004)    /* RESERVED */
  const 
    XT2OFFG* = (0x00000008)   # High Frequency Oscillator 2 Fault Flag 
  ##define RESERVED            (0x0010)    /* RESERVED */
  ##define RESERVED            (0x0020)    /* RESERVED */
  ##define RESERVED            (0x0040)    /* RESERVED */
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0100)    /* RESERVED */
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL7 Control Bits 
  const 
    DCOFFG_L* = (0x00000001)  # DCO Fault Flag 
    XT1LFOFFG_L* = (0x00000002) # XT1 Low Frequency Oscillator Fault Flag 
  ##define RESERVED            (0x0004)    /* RESERVED */
  const 
    XT2OFFG_L* = (0x00000008) # High Frequency Oscillator 2 Fault Flag 
  ##define RESERVED            (0x0010)    /* RESERVED */
  ##define RESERVED            (0x0020)    /* RESERVED */
  ##define RESERVED            (0x0040)    /* RESERVED */
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0100)    /* RESERVED */
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL7 Control Bits 
  ##define RESERVED            (0x0004)    /* RESERVED */
  ##define RESERVED            (0x0010)    /* RESERVED */
  ##define RESERVED            (0x0020)    /* RESERVED */
  ##define RESERVED            (0x0040)    /* RESERVED */
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0100)    /* RESERVED */
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL8 Control Bits 
  const 
    ACLKREQEN* = (0x00000001) # ACLK Clock Request Enable 
    MCLKREQEN* = (0x00000002) # MCLK Clock Request Enable 
    SMCLKREQEN* = (0x00000004) # SMCLK Clock Request Enable 
    MODOSCREQEN* = (0x00000008) # MODOSC Clock Request Enable 
  ##define RESERVED            (0x0010)    /* RESERVED */
  ##define RESERVED            (0x0020)    /* RESERVED */
  ##define RESERVED            (0x0040)    /* RESERVED */
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0100)    /* RESERVED */
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL8 Control Bits 
  const 
    ACLKREQEN_L* = (0x00000001) # ACLK Clock Request Enable 
    MCLKREQEN_L* = (0x00000002) # MCLK Clock Request Enable 
    SMCLKREQEN_L* = (0x00000004) # SMCLK Clock Request Enable 
    MODOSCREQEN_L* = (0x00000008) # MODOSC Clock Request Enable 
  ##define RESERVED            (0x0010)    /* RESERVED */
  ##define RESERVED            (0x0020)    /* RESERVED */
  ##define RESERVED            (0x0040)    /* RESERVED */
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0100)    /* RESERVED */
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  # UCSCTL8 Control Bits 
  ##define RESERVED            (0x0010)    /* RESERVED */
  ##define RESERVED            (0x0020)    /* RESERVED */
  ##define RESERVED            (0x0040)    /* RESERVED */
  ##define RESERVED            (0x0080)    /* RESERVED */
  ##define RESERVED            (0x0100)    /* RESERVED */
  ##define RESERVED            (0x0200)    /* RESERVED */
  ##define RESERVED            (0x0400)    /* RESERVED */
  ##define RESERVED            (0x0800)    /* RESERVED */
  ##define RESERVED            (0x1000)    /* RESERVED */
  ##define RESERVED            (0x2000)    /* RESERVED */
  ##define RESERVED            (0x4000)    /* RESERVED */
  ##define RESERVED            (0x8000)    /* RESERVED */
  #***********************************************************
  # USCI A0
  #**********************************************************
  const 
    MSP430_HAS_USCI_A0* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_USCI_A0* = 0x000005C0
    UCA0CTLW0_ADDR* = 0x000005C0
  sfrb(UCA0CTLW0_L, UCA0CTLW0_ADDR)
  sfrb(UCA0CTLW0_H, UCA0CTLW0_ADDR + 1)
  sfrw(UCA0CTLW0, UCA0CTLW0_ADDR)
  template UCA0CTL1* = UCA0CTLW0_L
  template UCA0CTL0* = UCA0CTLW0_H
  const 
    UCA0BRW_ADDR* = 0x000005C6
  sfrb(UCA0BRW_L, UCA0BRW_ADDR)
  sfrb(UCA0BRW_H, UCA0BRW_ADDR + 1)
  sfrw(UCA0BRW, UCA0BRW_ADDR)
  template UCA0BR0* = UCA0BRW_L
  template UCA0BR1* = UCA0BRW_H
  const 
    UCA0MCTL_ADDR* = 0x000005C8
  sfrb(UCA0MCTL, UCA0MCTL_ADDR)
  const 
    UCA0STAT_ADDR* = 0x000005CA
  sfrb(UCA0STAT, UCA0STAT_ADDR)
  const 
    UCA0RXBUF_ADDR* = 0x000005CC
  const_sfrb(UCA0RXBUF, UCA0RXBUF_ADDR)
  const 
    UCA0TXBUF_ADDR* = 0x000005CE
  sfrb(UCA0TXBUF, UCA0TXBUF_ADDR)
  const 
    UCA0ABCTL_ADDR* = 0x000005D0
  sfrb(UCA0ABCTL, UCA0ABCTL_ADDR)
  const 
    UCA0IRCTL_ADDR* = 0x000005D2
  sfrb(UCA0IRCTL_L, UCA0IRCTL_ADDR)
  sfrb(UCA0IRCTL_H, UCA0IRCTL_ADDR + 1)
  sfrw(UCA0IRCTL, UCA0IRCTL_ADDR)
  template UCA0IRTCTL* = UCA0IRCTL_L
  template UCA0IRRCTL* = UCA0IRCTL_H
  const 
    UCA0ICTL_ADDR* = 0x000005DC
  sfrb(UCA0ICTL_L, UCA0ICTL_ADDR)
  sfrb(UCA0ICTL_H, UCA0ICTL_ADDR + 1)
  sfrw(UCA0ICTL, UCA0ICTL_ADDR)
  template UCA0IE* = UCA0ICTL_L
  template UCA0IFG* = UCA0ICTL_H
  const 
    UCA0IV_ADDR* = 0x000005DE
  sfrw(UCA0IV, UCA0IV_ADDR)
  #***********************************************************
  # USCI B0
  #**********************************************************
  const 
    MSP430_HAS_USCI_B0* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_USCI_B0* = 0x000005E0
    UCB0CTLW0_ADDR* = 0x000005E0
  sfrb(UCB0CTLW0_L, UCB0CTLW0_ADDR)
  sfrb(UCB0CTLW0_H, UCB0CTLW0_ADDR + 1)
  sfrw(UCB0CTLW0, UCB0CTLW0_ADDR)
  template UCB0CTL1* = UCB0CTLW0_L
  template UCB0CTL0* = UCB0CTLW0_H
  const 
    UCB0BRW_ADDR* = 0x000005E6
  sfrb(UCB0BRW_L, UCB0BRW_ADDR)
  sfrb(UCB0BRW_H, UCB0BRW_ADDR + 1)
  sfrw(UCB0BRW, UCB0BRW_ADDR)
  template UCB0BR0* = UCB0BRW_L
  template UCB0BR1* = UCB0BRW_H
  const 
    UCB0STAT_ADDR* = 0x000005EA
  sfrb(UCB0STAT, UCB0STAT_ADDR)
  const 
    UCB0RXBUF_ADDR* = 0x000005EC
  const_sfrb(UCB0RXBUF, UCB0RXBUF_ADDR)
  const 
    UCB0TXBUF_ADDR* = 0x000005EE
  sfrb(UCB0TXBUF, UCB0TXBUF_ADDR)
  const 
    UCB0I2COA_ADDR* = 0x000005F0
  sfrb(UCB0I2COA_L, UCB0I2COA_ADDR)
  sfrb(UCB0I2COA_H, UCB0I2COA_ADDR + 1)
  sfrw(UCB0I2COA, UCB0I2COA_ADDR)
  const 
    UCB0I2CSA_ADDR* = 0x000005F2
  sfrb(UCB0I2CSA_L, UCB0I2CSA_ADDR)
  sfrb(UCB0I2CSA_H, UCB0I2CSA_ADDR + 1)
  sfrw(UCB0I2CSA, UCB0I2CSA_ADDR)
  const 
    UCB0ICTL_ADDR* = 0x000005FC
  sfrb(UCB0ICTL_L, UCB0ICTL_ADDR)
  sfrb(UCB0ICTL_H, UCB0ICTL_ADDR + 1)
  sfrw(UCB0ICTL, UCB0ICTL_ADDR)
  template UCB0IE* = UCB0ICTL_L
  template UCB0IFG* = UCB0ICTL_H
  const 
    UCB0IV_ADDR* = 0x000005FE
  sfrw(UCB0IV, UCB0IV_ADDR)
  # UCAxCTL0 UART-Mode Control Bits
  const 
    UCPEN* = (0x00000080)     # Async. Mode: Parity enable 
    UCPAR* = (0x00000040)     # Async. Mode: Parity     0:odd / 1:even 
    UCMSB* = (0x00000020)     # Async. Mode: MSB first  0:LSB / 1:MSB 
    UC7BIT* = (0x00000010)    # Async. Mode: Data Bits  0:8-bits / 1:7-bits 
    UCSPB* = (0x00000008)     # Async. Mode: Stop Bits  0:one / 1: two 
    UCMODE1* = (0x00000004)   # Async. Mode: USCI Mode 1 
    UCMODE0* = (0x00000002)   # Async. Mode: USCI Mode 0 
    UCSYNC* = (0x00000001)    # Sync-Mode  0:UART-Mode / 1:SPI-Mode 
  # UCxxCTL0 SPI-Mode Control Bits
  const 
    UCCKPH* = (0x00000080)    # Sync. Mode: Clock Phase 
    UCCKPL* = (0x00000040)    # Sync. Mode: Clock Polarity 
    UCMST* = (0x00000008)     # Sync. Mode: Master Select 
  # UCBxCTL0 I2C-Mode Control Bits
  const 
    UCA10* = (0x00000080)     # 10-bit Address Mode 
    UCSLA10* = (0x00000040)   # 10-bit Slave Address Mode 
    UCMM* = (0x00000020)      # Multi-Master Environment 
  ##define res               (0x10)    /* reserved */
  const 
    UCMODE_BIT0* = (0x00000000)  # Sync. Mode: USCI Mode: 0 
    UCMODE_BIT1* = (0x00000002)  # Sync. Mode: USCI Mode: 1 
    UCMODE_BIT2* = (0x00000004)  # Sync. Mode: USCI Mode: 2 
    UCMODE_BIT3* = (0x00000006)  # Sync. Mode: USCI Mode: 3 
  # UCAxCTL1 UART-Mode Control Bits
  const 
    UCSSEL1* = (0x00000080)   # USCI 0 Clock Source Select 1 
    UCSSEL0* = (0x00000040)   # USCI 0 Clock Source Select 0 
    UCRXEIE* = (0x00000020)   # RX Error interrupt enable 
    UCBRKIE* = (0x00000010)   # Break interrupt enable 
    UCDORM* = (0x00000008)    # Dormant (Sleep) Mode 
    UCTXADDR* = (0x00000004)  # Send next Data as Address 
    UCTXBRK* = (0x00000002)   # Send next Data as Break 
    UCSWRST* = (0x00000001)   # USCI Software Reset 
  # UCxxCTL1 SPI-Mode Control Bits
  ##define res               (0x20)    /* reserved */
  ##define res               (0x10)    /* reserved */
  ##define res               (0x08)    /* reserved */
  ##define res               (0x04)    /* reserved */
  ##define res               (0x02)    /* reserved */
  # UCBxCTL1 I2C-Mode Control Bits
  ##define res               (0x20)    /* reserved */
  const 
    UCTR* = (0x00000010)      # Transmit/Receive Select/Flag 
    UCTXNACK* = (0x00000008)  # Transmit NACK 
    UCTXSTP* = (0x00000004)   # Transmit STOP 
    UCTXSTT* = (0x00000002)   # Transmit START 
    UCSSEL_BIT0* = (0x00000000)  # USCI 0 Clock Source: 0 
    UCSSEL_BIT1* = (0x00000040)  # USCI 0 Clock Source: 1 
    UCSSEL_BIT2* = (0x00000080)  # USCI 0 Clock Source: 2 
    UCSSEL_BIT3* = (0x000000C0)  # USCI 0 Clock Source: 3 
    UCSSEL_UCLK* = (0x00000000) # USCI 0 Clock Source: UCLK 
    UCSSEL_ACLK* = (0x00000040) # USCI 0 Clock Source: ACLK 
    UCSSEL_SMCLK* = (0x00000080) # USCI 0 Clock Source: SMCLK 
  # UCAxMCTL Control Bits 
  const 
    UCBRF3* = (0x00000080)    # USCI First Stage Modulation Select 3 
    UCBRF2* = (0x00000040)    # USCI First Stage Modulation Select 2 
    UCBRF1* = (0x00000020)    # USCI First Stage Modulation Select 1 
    UCBRF0* = (0x00000010)    # USCI First Stage Modulation Select 0 
    UCBRS2* = (0x00000008)    # USCI Second Stage Modulation Select 2 
    UCBRS1* = (0x00000004)    # USCI Second Stage Modulation Select 1 
    UCBRS0* = (0x00000002)    # USCI Second Stage Modulation Select 0 
    UCOS16* = (0x00000001)    # USCI 16-times Oversampling enable 
    UCBRF_BIT0* = (0x00000000)   # USCI First Stage Modulation: 0 
    UCBRF_BIT1* = (0x00000010)   # USCI First Stage Modulation: 1 
    UCBRF_BIT2* = (0x00000020)   # USCI First Stage Modulation: 2 
    UCBRF_BIT3* = (0x00000030)   # USCI First Stage Modulation: 3 
    UCBRF_BIT4* = (0x00000040)   # USCI First Stage Modulation: 4 
    UCBRF_BIT5* = (0x00000050)   # USCI First Stage Modulation: 5 
    UCBRF_BIT6* = (0x00000060)   # USCI First Stage Modulation: 6 
    UCBRF_BIT7* = (0x00000070)   # USCI First Stage Modulation: 7 
    UCBRF_BIT8* = (0x00000080)   # USCI First Stage Modulation: 8 
    UCBRF_BIT9* = (0x00000090)   # USCI First Stage Modulation: 9 
    UCBRF_BIT10* = (0x000000A0)  # USCI First Stage Modulation: A 
    UCBRF_BIT11* = (0x000000B0)  # USCI First Stage Modulation: B 
    UCBRF_BIT12* = (0x000000C0)  # USCI First Stage Modulation: C 
    UCBRF_BIT13* = (0x000000D0)  # USCI First Stage Modulation: D 
    UCBRF_BIT14* = (0x000000E0)  # USCI First Stage Modulation: E 
    UCBRF_BIT15* = (0x000000F0)  # USCI First Stage Modulation: F 
    UCBRS_BIT0* = (0x00000000)   # USCI Second Stage Modulation: 0 
    UCBRS_BIT1* = (0x00000002)   # USCI Second Stage Modulation: 1 
    UCBRS_BIT2* = (0x00000004)   # USCI Second Stage Modulation: 2 
    UCBRS_BIT3* = (0x00000006)   # USCI Second Stage Modulation: 3 
    UCBRS_BIT4* = (0x00000008)   # USCI Second Stage Modulation: 4 
    UCBRS_BIT5* = (0x0000000A)   # USCI Second Stage Modulation: 5 
    UCBRS_BIT6* = (0x0000000C)   # USCI Second Stage Modulation: 6 
    UCBRS_BIT7* = (0x0000000E)   # USCI Second Stage Modulation: 7 
  # UCAxSTAT Control Bits 
  const 
    UCLISTEN* = (0x00000080)  # USCI Listen mode 
    UCFE* = (0x00000040)      # USCI Frame Error Flag 
    UCOE* = (0x00000020)      # USCI Overrun Error Flag 
    UCPE* = (0x00000010)      # USCI Parity Error Flag 
    UCBRK* = (0x00000008)     # USCI Break received 
    UCRXERR* = (0x00000004)   # USCI RX Error Flag 
    UCADDR* = (0x00000002)    # USCI Address received Flag 
    UCBUSY* = (0x00000001)    # USCI Busy Flag 
    UCIDLE* = (0x00000002)    # USCI Idle line detected Flag 
  # UCBxSTAT Control Bits 
  const 
    UCSCLLOW* = (0x00000040)  # SCL low 
    UCGC* = (0x00000020)      # General Call address received Flag 
    UCBBUSY* = (0x00000010)   # Bus Busy Flag 
  # UCAxIRTCTL Control Bits 
  const 
    UCIRTXPL5* = (0x00000080) # IRDA Transmit Pulse Length 5 
    UCIRTXPL4* = (0x00000040) # IRDA Transmit Pulse Length 4 
    UCIRTXPL3* = (0x00000020) # IRDA Transmit Pulse Length 3 
    UCIRTXPL2* = (0x00000010) # IRDA Transmit Pulse Length 2 
    UCIRTXPL1* = (0x00000008) # IRDA Transmit Pulse Length 1 
    UCIRTXPL0* = (0x00000004) # IRDA Transmit Pulse Length 0 
    UCIRTXCLK* = (0x00000002) # IRDA Transmit Pulse Clock Select 
    UCIREN* = (0x00000001)    # IRDA Encoder/Decoder enable 
  # UCAxIRRCTL Control Bits 
  const 
    UCIRRXFL5* = (0x00000080) # IRDA Receive Filter Length 5 
    UCIRRXFL4* = (0x00000040) # IRDA Receive Filter Length 4 
    UCIRRXFL3* = (0x00000020) # IRDA Receive Filter Length 3 
    UCIRRXFL2* = (0x00000010) # IRDA Receive Filter Length 2 
    UCIRRXFL1* = (0x00000008) # IRDA Receive Filter Length 1 
    UCIRRXFL0* = (0x00000004) # IRDA Receive Filter Length 0 
    UCIRRXPL* = (0x00000002)  # IRDA Receive Input Polarity 
    UCIRRXFE* = (0x00000001)  # IRDA Receive Filter enable 
  # UCAxABCTL Control Bits 
  ##define res               (0x80)    /* reserved */
  ##define res               (0x40)    /* reserved */
  const 
    UCDELIM1* = (0x00000020)  # Break Sync Delimiter 1 
    UCDELIM0* = (0x00000010)  # Break Sync Delimiter 0 
    UCSTOE* = (0x00000008)    # Sync-Field Timeout error 
    UCBTOE* = (0x00000004)    # Break Timeout error 
  ##define res               (0x02)    /* reserved */
  const 
    UCABDEN* = (0x00000001)   # Auto Baud Rate detect enable 
  # UCBxI2COA Control Bits 
  const 
    UCGCEN* = (0x00008000)    # I2C General Call enable 
    UCOA9* = (0x00000200)     # I2C Own Address 9 
    UCOA8* = (0x00000100)     # I2C Own Address 8 
    UCOA7* = (0x00000080)     # I2C Own Address 7 
    UCOA6* = (0x00000040)     # I2C Own Address 6 
    UCOA5* = (0x00000020)     # I2C Own Address 5 
    UCOA4* = (0x00000010)     # I2C Own Address 4 
    UCOA3* = (0x00000008)     # I2C Own Address 3 
    UCOA2* = (0x00000004)     # I2C Own Address 2 
    UCOA1* = (0x00000002)     # I2C Own Address 1 
    UCOA0* = (0x00000001)     # I2C Own Address 0 
  # UCBxI2COA Control Bits 
  const 
    UCOA7_L* = (0x00000080)   # I2C Own Address 7 
    UCOA6_L* = (0x00000040)   # I2C Own Address 6 
    UCOA5_L* = (0x00000020)   # I2C Own Address 5 
    UCOA4_L* = (0x00000010)   # I2C Own Address 4 
    UCOA3_L* = (0x00000008)   # I2C Own Address 3 
    UCOA2_L* = (0x00000004)   # I2C Own Address 2 
    UCOA1_L* = (0x00000002)   # I2C Own Address 1 
    UCOA0_L* = (0x00000001)   # I2C Own Address 0 
  # UCBxI2COA Control Bits 
  const 
    UCGCEN_H* = (0x00000080)  # I2C General Call enable 
    UCOA9_H* = (0x00000002)   # I2C Own Address 9 
    UCOA8_H* = (0x00000001)   # I2C Own Address 8 
  # UCBxI2CSA Control Bits 
  const 
    UCSA9* = (0x00000200)     # I2C Slave Address 9 
    UCSA8* = (0x00000100)     # I2C Slave Address 8 
    UCSA7* = (0x00000080)     # I2C Slave Address 7 
    UCSA6* = (0x00000040)     # I2C Slave Address 6 
    UCSA5* = (0x00000020)     # I2C Slave Address 5 
    UCSA4* = (0x00000010)     # I2C Slave Address 4 
    UCSA3* = (0x00000008)     # I2C Slave Address 3 
    UCSA2* = (0x00000004)     # I2C Slave Address 2 
    UCSA1* = (0x00000002)     # I2C Slave Address 1 
    UCSA0* = (0x00000001)     # I2C Slave Address 0 
  # UCBxI2CSA Control Bits 
  const 
    UCSA7_L* = (0x00000080)   # I2C Slave Address 7 
    UCSA6_L* = (0x00000040)   # I2C Slave Address 6 
    UCSA5_L* = (0x00000020)   # I2C Slave Address 5 
    UCSA4_L* = (0x00000010)   # I2C Slave Address 4 
    UCSA3_L* = (0x00000008)   # I2C Slave Address 3 
    UCSA2_L* = (0x00000004)   # I2C Slave Address 2 
    UCSA1_L* = (0x00000002)   # I2C Slave Address 1 
    UCSA0_L* = (0x00000001)   # I2C Slave Address 0 
  # UCBxI2CSA Control Bits 
  const 
    UCSA9_H* = (0x00000002)   # I2C Slave Address 9 
    UCSA8_H* = (0x00000001)   # I2C Slave Address 8 
  # UCAxIE Control Bits 
#  const 
#    UCTXIE* = (0x00000002)    # USCI Transmit Interrupt Enable 
#    UCRXIE* = (0x00000001)    # USCI Receive Interrupt Enable 
  # UCBxIE Control Bits 
  const 
    UCNACKIE* = (0x00000020)  # NACK Condition interrupt enable 
    UCALIE* = (0x00000010)    # Arbitration Lost interrupt enable 
    UCSTPIE* = (0x00000008)   # STOP Condition interrupt enable 
    UCSTTIE* = (0x00000004)   # START Condition interrupt enable 
    UCTXIE* = (0x00000002)    # USCI Transmit Interrupt Enable 
    UCRXIE* = (0x00000001)    # USCI Receive Interrupt Enable 
  # UCAxIFG Control Bits 
#  const 
#    UCTXIFG* = (0x00000002)   # USCI Transmit Interrupt Flag 
#    UCRXIFG* = (0x00000001)   # USCI Receive Interrupt Flag 
  # UCBxIFG Control Bits 
  const 
    UCNACKIFG* = (0x00000020) # NAK Condition interrupt Flag 
    UCALIFG* = (0x00000010)   # Arbitration Lost interrupt Flag 
    UCSTPIFG* = (0x00000008)  # STOP Condition interrupt Flag 
    UCSTTIFG* = (0x00000004)  # START Condition interrupt Flag 
    UCTXIFG* = (0x00000002)   # USCI Transmit Interrupt Flag 
    UCRXIFG* = (0x00000001)   # USCI Receive Interrupt Flag 
  # USCI Definitions 
  const 
    USCI_NONE* = (0x00000000) # No Interrupt pending 
    USCI_UCRXIFG* = (0x00000002) # USCI UCRXIFG 
    USCI_UCTXIFG* = (0x00000004) # USCI UCTXIFG 
    USCI_I2C_UCALIFG* = (0x00000002) # USCI I2C Mode: UCALIFG 
    USCI_I2C_UCNACKIFG* = (0x00000004) # USCI I2C Mode: UCNACKIFG 
    USCI_I2C_UCSTTIFG* = (0x00000006) # USCI I2C Mode: UCSTTIFG
    USCI_I2C_UCSTPIFG* = (0x00000008) # USCI I2C Mode: UCSTPIFG
    USCI_I2C_UCRXIFG* = (0x0000000A) # USCI I2C Mode: UCRXIFG 
    USCI_I2C_UCTXIFG* = (0x0000000C) # USCI I2C Mode: UCTXIFG 
  #***********************************************************
  # USCI A1
  #**********************************************************
  const 
    MSP430_HAS_USCI_A1* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_USCI_A1* = 0x00000600
    UCA1CTLW0_ADDR* = 0x00000600
  sfrb(UCA1CTLW0_L, UCA1CTLW0_ADDR)
  sfrb(UCA1CTLW0_H, UCA1CTLW0_ADDR + 1)
  sfrw(UCA1CTLW0, UCA1CTLW0_ADDR)
  template UCA1CTL1* = UCA1CTLW0_L
  template UCA1CTL0* = UCA1CTLW0_H
  const 
    UCA1BRW_ADDR* = 0x00000606
  sfrb(UCA1BRW_L, UCA1BRW_ADDR)
  sfrb(UCA1BRW_H, UCA1BRW_ADDR + 1)
  sfrw(UCA1BRW, UCA1BRW_ADDR)
  template UCA1BR0* = UCA1BRW_L
  template UCA1BR1* = UCA1BRW_H
  const 
    UCA1MCTL_ADDR* = 0x00000608
  sfrb(UCA1MCTL, UCA1MCTL_ADDR)
  const 
    UCA1STAT_ADDR* = 0x0000060A
  sfrb(UCA1STAT, UCA1STAT_ADDR)
  const 
    UCA1RXBUF_ADDR* = 0x0000060C
  const_sfrb(UCA1RXBUF, UCA1RXBUF_ADDR)
  const 
    UCA1TXBUF_ADDR* = 0x0000060E
  sfrb(UCA1TXBUF, UCA1TXBUF_ADDR)
  const 
    UCA1ABCTL_ADDR* = 0x00000610
  sfrb(UCA1ABCTL, UCA1ABCTL_ADDR)
  const 
    UCA1IRCTL_ADDR* = 0x00000612
  sfrb(UCA1IRCTL_L, UCA1IRCTL_ADDR)
  sfrb(UCA1IRCTL_H, UCA1IRCTL_ADDR + 1)
  sfrw(UCA1IRCTL, UCA1IRCTL_ADDR)
  template UCA1IRTCTL* = UCA1IRCTL_L
  template UCA1IRRCTL* = UCA1IRCTL_H
  const 
    UCA1ICTL_ADDR* = 0x0000061C
  sfrb(UCA1ICTL_L, UCA1ICTL_ADDR)
  sfrb(UCA1ICTL_H, UCA1ICTL_ADDR + 1)
  sfrw(UCA1ICTL, UCA1ICTL_ADDR)
  template UCA1IE* = UCA1ICTL_L
  template UCA1IFG* = UCA1ICTL_H
  const 
    UCA1IV_ADDR* = 0x0000061E
  sfrw(UCA1IV, UCA1IV_ADDR)
  #***********************************************************
  # USCI B1
  #**********************************************************
  const 
    MSP430_HAS_USCI_B1* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_USCI_B1* = 0x00000620
    UCB1CTLW0_ADDR* = 0x00000620
  sfrb(UCB1CTLW0_L, UCB1CTLW0_ADDR)
  sfrb(UCB1CTLW0_H, UCB1CTLW0_ADDR + 1)
  sfrw(UCB1CTLW0, UCB1CTLW0_ADDR)
  template UCB1CTL1* = UCB1CTLW0_L
  template UCB1CTL0* = UCB1CTLW0_H
  const 
    UCB1BRW_ADDR* = 0x00000626
  sfrb(UCB1BRW_L, UCB1BRW_ADDR)
  sfrb(UCB1BRW_H, UCB1BRW_ADDR + 1)
  sfrw(UCB1BRW, UCB1BRW_ADDR)
  template UCB1BR0* = UCB1BRW_L
  template UCB1BR1* = UCB1BRW_H
  const 
    UCB1STAT_ADDR* = 0x0000062A
  sfrb(UCB1STAT, UCB1STAT_ADDR)
  const 
    UCB1RXBUF_ADDR* = 0x0000062C
  const_sfrb(UCB1RXBUF, UCB1RXBUF_ADDR)
  const 
    UCB1TXBUF_ADDR* = 0x0000062E
  sfrb(UCB1TXBUF, UCB1TXBUF_ADDR)
  const 
    UCB1I2COA_ADDR* = 0x00000630
  sfrb(UCB1I2COA_L, UCB1I2COA_ADDR)
  sfrb(UCB1I2COA_H, UCB1I2COA_ADDR + 1)
  sfrw(UCB1I2COA, UCB1I2COA_ADDR)
  const 
    UCB1I2CSA_ADDR* = 0x00000632
  sfrb(UCB1I2CSA_L, UCB1I2CSA_ADDR)
  sfrb(UCB1I2CSA_H, UCB1I2CSA_ADDR + 1)
  sfrw(UCB1I2CSA, UCB1I2CSA_ADDR)
  const 
    UCB1ICTL_ADDR* = 0x0000063C
  sfrb(UCB1ICTL_L, UCB1ICTL_ADDR)
  sfrb(UCB1ICTL_H, UCB1ICTL_ADDR + 1)
  sfrw(UCB1ICTL, UCB1ICTL_ADDR)
  template UCB1IE* = UCB1ICTL_L
  template UCB1IFG* = UCB1ICTL_H
  const 
    UCB1IV_ADDR* = 0x0000063E
  sfrw(UCB1IV, UCB1IV_ADDR)
  #***********************************************************
  # WATCHDOG TIMER A
  #**********************************************************
  const 
    MSP430_HAS_WDT_A* = true # Definition to show that Module is available 
    MSP430_BASEADDRESS_WDT_A* = 0x00000150
    WDTCTL_ADDR* = 0x0000015C
  sfrb(WDTCTL_L, WDTCTL_ADDR)
  sfrb(WDTCTL_H, WDTCTL_ADDR + 1)
  sfrw(WDTCTL, WDTCTL_ADDR)
  # The bit names have been prefixed with "WDT" 
  # WDTCTL Control Bits 
  const 
    WDTIS0* = (0x00000001)    # WDT - Timer Interval Select 0 
    WDTIS1* = (0x00000002)    # WDT - Timer Interval Select 1 
    WDTIS2* = (0x00000004)    # WDT - Timer Interval Select 2 
    WDTCNTCL* = (0x00000008)  # WDT - Timer Clear 
    WDTTMSEL* = (0x00000010)  # WDT - Timer Mode Select 
    WDTSSEL0* = (0x00000020)  # WDT - Timer Clock Source Select 0 
    WDTSSEL1* = (0x00000040)  # WDT - Timer Clock Source Select 1 
    WDTHOLD* = (0x00000080)   # WDT - Timer hold 
  # WDTCTL Control Bits 
  const 
    WDTIS0_L* = (0x00000001)  # WDT - Timer Interval Select 0 
    WDTIS1_L* = (0x00000002)  # WDT - Timer Interval Select 1 
    WDTIS2_L* = (0x00000004)  # WDT - Timer Interval Select 2 
    WDTCNTCL_L* = (0x00000008) # WDT - Timer Clear 
    WDTTMSEL_L* = (0x00000010) # WDT - Timer Mode Select 
    WDTSSEL0_L* = (0x00000020) # WDT - Timer Clock Source Select 0 
    WDTSSEL1_L* = (0x00000040) # WDT - Timer Clock Source Select 1 
    WDTHOLD_L* = (0x00000080) # WDT - Timer hold 
  # WDTCTL Control Bits 
  const 
    WDTPW* = (0x00005A00)
    WDTIS_BIT0* = (0x00000000)   # WDT - Timer Interval Select: /2G 
    WDTIS_BIT1* = (0x00000001)   # WDT - Timer Interval Select: /128M 
    WDTIS_BIT2* = (0x00000002)   # WDT - Timer Interval Select: /8192k 
    WDTIS_BIT3* = (0x00000003)   # WDT - Timer Interval Select: /512k 
    WDTIS_BIT4* = (0x00000004)   # WDT - Timer Interval Select: /32k 
    WDTIS_BIT5* = (0x00000005)   # WDT - Timer Interval Select: /8192 
    WDTIS_BIT6* = (0x00000006)   # WDT - Timer Interval Select: /512 
    WDTIS_BIT7* = (0x00000007)   # WDT - Timer Interval Select: /64 
    WDTIS_VAL_2G* = (0x00000000) # WDT - Timer Interval Select: /2G 
    WDTIS_VAL_128M* = (0x00000001) # WDT - Timer Interval Select: /128M 
    WDTIS_VAL_8192K* = (0x00000002) # WDT - Timer Interval Select: /8192k 
    WDTIS_VAL_512K* = (0x00000003) # WDT - Timer Interval Select: /512k 
    WDTIS_VAL_32K* = (0x00000004) # WDT - Timer Interval Select: /32k 
    WDTIS_VAL_8192* = (0x00000005) # WDT - Timer Interval Select: /8192 
    WDTIS_VAL_512* = (0x00000006) # WDT - Timer Interval Select: /512 
    WDTIS_VAL_64* = (0x00000007) # WDT - Timer Interval Select: /64 
    WDTSSEL_BIT0* = (0x00000000) # WDT - Timer Clock Source Select: SMCLK 
    WDTSSEL_BIT1* = (0x00000020) # WDT - Timer Clock Source Select: ACLK 
    WDTSSEL_BIT2* = (0x00000040) # WDT - Timer Clock Source Select: VLO_CLK 
    WDTSSEL_BIT3* = (0x00000060) # WDT - Timer Clock Source Select: reserved 
    WDTSSEL_SMCLK* = (0x00000000) # WDT - Timer Clock Source Select: SMCLK 
    WDTSSEL_ACLK* = (0x00000020) # WDT - Timer Clock Source Select: ACLK 
    WDTSSEL_VLO* = (0x00000040) # WDT - Timer Clock Source Select: VLO_CLK 
  # WDT-interval times [1ms] coded with Bits 0-2 
  # WDT is clocked by fSMCLK (assumed 1MHz) 
  const 
    WDT_MDLY_BIT32* = (WDTPW + WDTTMSEL + WDTCNTCL + WDTIS2) # 32ms interval (default) 
    WDT_MDLY_BIT8* = (WDTPW + WDTTMSEL + WDTCNTCL + WDTIS2 + WDTIS0) # 8ms     " 
    WDT_MDLY_0_BIT5* = (WDTPW + WDTTMSEL + WDTCNTCL + WDTIS2 + WDTIS1) # 0.5ms   " 
    WDT_MDLY_0_BIT064* = (WDTPW + WDTTMSEL + WDTCNTCL + WDTIS2 + WDTIS1 + WDTIS0) # 
                                                                               # 0.064ms " 
  # WDT is clocked by fACLK (assumed 32KHz) 
  const 
    WDT_ADLY_BIT1000* = (WDTPW + WDTTMSEL + WDTCNTCL + WDTIS2 + WDTSSEL0) # 1000ms  " 
    WDT_ADLY_BIT250* = (WDTPW + WDTTMSEL + WDTCNTCL + WDTIS2 + WDTSSEL0 + WDTIS0) # 
                                                                               # 250ms   " 
    WDT_ADLY_BIT16* = (WDTPW + WDTTMSEL + WDTCNTCL + WDTIS2 + WDTSSEL0 + WDTIS1) # 
                                                                              # 16ms    " 
    WDT_ADLY_1_BIT9* = (
      WDTPW + WDTTMSEL + WDTCNTCL + WDTIS2 + WDTSSEL0 + WDTIS1 + WDTIS0) # 1.9ms   " 
  # Watchdog mode -> reset after expired time 
  # WDT is clocked by fSMCLK (assumed 1MHz) 
  const 
    WDT_MRST_BIT32* = (WDTPW + WDTCNTCL + WDTIS2) # 32ms interval (default) 
    WDT_MRST_BIT8* = (WDTPW + WDTCNTCL + WDTIS2 + WDTIS0) # 8ms     " 
    WDT_MRST_0_BIT5* = (WDTPW + WDTCNTCL + WDTIS2 + WDTIS1) # 0.5ms   " 
    WDT_MRST_0_BIT064* = (WDTPW + WDTCNTCL + WDTIS2 + WDTIS1 + WDTIS0) # 0.064ms " 
  # WDT is clocked by fACLK (assumed 32KHz) 
  const 
    WDT_ARST_BIT1000* = (WDTPW + WDTCNTCL + WDTSSEL0 + WDTIS2) # 1000ms  " 
    WDT_ARST_BIT250* = (WDTPW + WDTCNTCL + WDTSSEL0 + WDTIS2 + WDTIS0) # 250ms   " 
    WDT_ARST_BIT16* = (WDTPW + WDTCNTCL + WDTSSEL0 + WDTIS2 + WDTIS1) # 16ms    " 
    WDT_ARST_1_BIT9* = (WDTPW + WDTCNTCL + WDTSSEL0 + WDTIS2 + WDTIS1 + WDTIS0) # 
                                                                             # 1.9ms   " 
  #***********************************************************
  # TLV Descriptors
  #**********************************************************
  const 
    MSP430_HAS_TLV* = true # Definition to show that Module is available 
    TLV_START* = (0x00001A08) # Start Address of the TLV structure 
    TLV_END* = (0x00001AFF)   # End Address of the TLV structure 
    TLV_LDTAG* = (0x00000001) #  Legacy descriptor (1xx, 2xx, 4xx families) 
    TLV_PDTAG* = (0x00000002) #  Peripheral discovery descriptor 
    TLV_Reserved3* = (0x00000003) #  Future usage 
    TLV_Reserved4* = (0x00000004) #  Future usage 
    TLV_BLANK* = (0x00000005) #  Blank descriptor 
    TLV_Reserved6* = (0x00000006) #  Future usage 
    TLV_Reserved7* = (0x00000007) #  Serial Number 
    TLV_DIERECORD* = (0x00000008) #  Die Record  
    TLV_ADCCAL* = (0x00000011) #  ADC12 calibration 
    TLV_ADC12CAL* = (0x00000011) #  ADC12 calibration 
    TLV_ADC10CAL* = (0x00000013) #  ADC10 calibration 
    TLV_REFCAL* = (0x00000012) #  REF calibration 
    TLV_TAGEXT* = (0x000000FE) #  Tag extender 
    TLV_TAGEND* = (0x000000FF) #  Tag End of Table
  #***********************************************************
  #**********************************************************
