//----------------------------------------------------------------------------
//                         RGB LED Blink Controller
//
// This module controls an RGB LED to display 8 different colors in sequence:
// Red, Green, Blue, Cyan, Yellow, Magenta, White, and Off.
// 
// Clock: External hardware clock (hw_clk)
// Color Timing: Changes color every 2^24 clock cycles using bits [26:24]
//----------------------------------------------------------------------------

module rgb_blink (
    // Outputs - Active low RGB LED pins
    output wire led_red,    // Red LED control
    output wire led_blue,   // Blue LED control
    output wire led_green,  // Green LED control
    
    // Inputs
    input wire hw_clk      // Hardware clock input
);

    //------------------------------------------------------------------------
    // Internal Signals
    //------------------------------------------------------------------------
    reg [27:0] frequency_counter_i;  // Counter for color timing
    wire [2:0] color_select;         // Current color selection

    //------------------------------------------------------------------------
    // Counter Logic
    //------------------------------------------------------------------------
    always @(posedge hw_clk) begin
        frequency_counter_i <= frequency_counter_i + 1'b1;
    end

    // Use upper bits of counter to select colors
    assign color_select = frequency_counter_i[26:24];

    //------------------------------------------------------------------------
    // Color Pattern Logic
    //------------------------------------------------------------------------
    // Define when each LED should be on to create the different colors
    wire red_on    = (color_select == 3'b000) ||  // Red
                     (color_select == 3'b100) ||  // Yellow  (Red + Green)
                     (color_select == 3'b101) ||  // Magenta (Red + Blue)
                     (color_select == 3'b111);    // White   (All)
                   
    wire green_on  = (color_select == 3'b001) ||  // Green
                     (color_select == 3'b011) ||  // Cyan    (Green + Blue)
                     (color_select == 3'b100) ||  // Yellow  (Red + Green)
                     (color_select == 3'b111);    // White   (All)
                   
    wire blue_on   = (color_select == 3'b010) ||  // Blue
                     (color_select == 3'b011) ||  // Cyan    (Green + Blue)
                     (color_select == 3'b101) ||  // Magenta (Red + Blue)
                     (color_select == 3'b111);    // White   (All)

    //------------------------------------------------------------------------
    // RGB LED Driver Instance
    //------------------------------------------------------------------------
    SB_RGBA_DRV RGB_DRIVER (
        .RGBLEDEN (1'b1),      // Enable LED driver
        .RGB0PWM  (green_on),  // Green LED control
        .RGB1PWM  (blue_on),   // Blue LED control
        .RGB2PWM  (red_on),    // Red LED control
        .CURREN   (1'b1),      // Enable current generator
        .RGB0     (led_green), // Green LED output
        .RGB1     (led_blue),  // Blue LED output
        .RGB2     (led_red)    // Red LED output
    );

    // Set current levels for each LED (lowest setting to reduce brightness)
    defparam RGB_DRIVER.RGB0_CURRENT = "0b000001";  // Green current
    defparam RGB_DRIVER.RGB1_CURRENT = "0b000001";  // Blue current
    defparam RGB_DRIVER.RGB2_CURRENT = "0b000001";  // Red current

endmodule