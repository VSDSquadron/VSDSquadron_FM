# Real Time Sensor Data Acquisition and Transmission System

## **1.Introduction**

In modern embedded systems, **efficient data acquisition, processing, and control** play a crucial role in automation, industrial monitoring, and real-time decision-making. **Field-Programmable Gate Arrays (FPGAs)** offer **parallel processing capabilities, low latency, and high-speed data handling**, making them ideal for such applications.

This project focuses on designing an **FPGA-based data acquisition and processing system** that collects sensor data, processes it internally, and communicates the results to external devices via UART. The FPGA also controls an RGB LED system based on processed signals.


This project focuses on designing an **FPGA-based data acquisition and processing system** that collects sensor data, processes it internally, and communicates the results to external devices via UART. The FPGA also controls an RGB LED system based on processed signals.

## **2.Literature Survey** 

- [****https://www.mdpi.com/2079-9292/13/15/2950****](https://www.mdpi.com/2079-9292/13/15/2950)

- [****https://github.com/linukaratnayake/FPGA-Based-IMU-Sensor-Data-Acquisition-and-Display****](https://github.com/linukaratnayake/FPGA-Based-IMU-Sensor-Data-Acquisition-and-Display)

- [****https://citeseerx.ist.psu.edu/document?repid=rep1\&type=pdf\&doi=956a51be00c461510d9ccc5c166cac9fe1721098****](https://citeseerx.ist.psu.edu/document?repid=rep1\&type=pdf\&doi=956a51be00c461510d9ccc5c166cac9fe1721098)

- [****https://www.mdpi.com/2076-3417/14/15/6738****](https://www.mdpi.com/2076-3417/14/15/6738)


## **3.System Overview**

The FPGA-based system is designed for **real-time data acquisition, processing, and control**. It captures sensor data, processes it internally, and transmits the processed data to an external device via **UART communication**. Additionally, an **RGB LED control system** provides visual feedback based on the processed signals.


 **High-Level System Flow:**

 **Sensor Data Acquisition** – The system collects real-time data from **analog and digital sensors**. Analog signals are converted into digital format using an **ADC (Analog-to-Digital Converter)** before being sent to the FPGA.

**FPGA Internal Processing** – The FPGA processes the acquired sensor data using custom logic and generates output signals.

**Data Transmission** – If processing is successful, the system transmits data to an **external device (PC, cloud, or display)** via **UART communication**.

**Control Mechanism** – Based on the processed data, the FPGA also controls an **RGB LED system** for status indication or feedback.


## **4.System Requirements**

### **. Hardware Components**

- FPGA Board: VSD Squadron Mini FPGA

- Sensors: (Depends on the application)

- Power Supply: USB or external source

- Communication Interface: UART (for transmission)

- External Device: PC for monitoring and debugging


#### **Software Tools**

##### **Development & Simulation**

- VS Code

- Icarus Verilog

- GTKWave


##### **FPGA Toolchain**

- Yosys (Logic synthesis)

- NextPNR (Placement & routing)

- Icetime (Timing analysis)

- Icepack (Bitstream generation)

- openFPGALoader (FPGA flashing)

- Git (Version control)

## **5.System Architecture**

## **FPGA Internal Block Diagram**

****![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeroj9fDIKl2LyLznR6cecdHEr4nAeJ77iWfLTEQk__Yw3jTPvN_XXbSgpygMGcMcvLXSgyrkZPAU3yEScgVPO5HT8He6ZSl5RPcDbuzoz4G-ptN_DNUgtApI6tPnCYgqwQsqwXMw?key=7WfJZ0NyJZ01f7p81pYMoAQl)****


### **Overview**

This diagram illustrates the internal architecture of an FPGA, showing how different functional blocks interact to process and control data.


### **Block Descriptions**

1. **Clock Generator**

   - Generates the system clock required for synchronization of all FPGA operations.

2. **Internal Oscillator**

   - Maintains a stable clock signal and ensures proper timing for internal processes.

3. **Data Processing Block**

   - Responsible for receiving, interpreting, and processing sensor or system data.

4. **UART Controller**

   - Handles serial communication by transmitting processed data to external devices.

5. **RGB LED Control**

   - Controls the RGB LED indicators based on processed control signals from the FPGA.


### **Signal Flow**

- **Clock Signal**: Propagates from the Clock Generator to the Internal Oscillator, ensuring synchronized operations.

- **Processed Data**: Sent from the Data Processing Block to the UART Controller for external communication.

- **Control Signal**: Directs the RGB LED Control block, enabling appropriate LED status indications.


## **FPGA based Sensor data acquisition System**

****![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdSu-30CrrmTcJZ8O_gq2zciqDuQvwcqZSHI_aTAK2HFit-OQbkXowC8cce5Ncb15lhTR4Ivamyo5xOjemWViVdWZe1aWFiTwsx_LXf2NRBVlI8Z465EDwFRUrx67giFCqI7cjVtA?key=7WfJZ0NyJZ01f7p81pYMoAQl)****


### **Overview**

This diagram depicts the flow of sensor data from acquisition to final transmission, highlighting the role of FPGA in data conversion and processing.


### **Process Flow**

1. **Sensor Data Acquisition**

   - Captures environmental data using sensors.

2. **Analog Sensor Check**

   - If the sensor provides analog data, it is sent to an ADC (Analog-to-Digital Converter) for conversion.

   - If the data is already digital, it bypasses ADC and is directly transmitted to the FPGA.

3. **Digital Data to FPGA**

   - The FPGA receives the digital data for further processing.

4. **FPGA Internal Processing**

   - The FPGA analyzes and processes the incoming data.

5. **Processed Data Check**

   - If data is not yet processed, it is sent back for further computation.

   - If the data is processed, it proceeds to transmission.

6. **Data Transmission (UART)**

   - The processed data is transmitted via the UART (Universal Asynchronous Receiver-Transmitter) interface.

7. **External Device Communication**

   - The transmitted data is received by an external system such as a PC, cloud server, or display unit for further analysis and visualization.



## **6.Milestones & Development Roadmap**

|          |                                                                |                                                                                                                                                                                     |
| -------- | -------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Date     | Task                                                           | Details                                                                                                                                                                             |
| March 8  | UART Implementation (Verilog)                                  | Develop **UART RX/TX module (uart\_trx.v)** Implement Baud Rate Generator (9600 Hz)Simulate UART communication using testbench                                                       |
| March 9  | Sensor Data Acquisition & ADC Integration                      |  Develop **ADC Interface Module** Simulate ADC behavior in **testbench (ModelSim/ISE)**Debug & adjust timing constraints                                                            |
| March 10 | Top module development(top.v)                                  |  Define **top-level module (top.v)** Integrate **UART, internal clock, LED outputs** Map signals to FPGA pins                                                                         |
| March 11 | Clock & Oscillator Implementation                              | Implement **Internal Oscillator (SB\_HFOSC)** Design **Clock Divider (1MHz from 50MHz)** Verify output clock stability                                                               |
| March 12 | FPGA Data Processing & RGB LED Control                         |  Implement **data processing logic** Connect **RGB LED driver (SB\_RGBA\_DRV)** Verify PWM LED control using **UART RX signals**                                                     |
| March 13 | Makefile Creation, Pin Constraints & Final Hardware Validation | Creating Makefile & PCF FileFor pin mapping and uploading the code to **FPGA** Upload bitstream to **VSD Squadron Mini FPGA.** Verify **UART communication** using a serial monitor. |
