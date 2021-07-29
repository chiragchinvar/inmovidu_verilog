module upordown_counter(
    Clk,
    reset,
    UpOrDown,  //high for UP counter and low for Down counter
    Count
    );

    
    //input ports and their sizes
    input Clk,reset,UpOrDown;
    //output ports and their size
    output [3 : 0] Count;
    //Internal variables
    reg [3 : 0] Count = 0;  
    
     always @(posedge(Clk) or posedge(reset))
     begin
        if(reset == 1) 
            Count <= 0;
        else    
            if(UpOrDown == 1)   //Up mode selected
                if(Count == 15)
                    Count <= 0;
                else
                    Count <= Count + 1; //Incremend Counter
            else  //Down mode selected
                if(Count == 0)
                    Count <= 15;
                else
                    Count <= Count - 1; //Decrement counter
     end    
    
endmodule


module tb_counter;

    // Inputs
    reg Clk;
    reg reset;
    reg UpOrDown;

    // Outputs
    wire [3:0] Count;

    
    upordown_counter uut (
        .Clk(Clk), 
        .reset(reset), 
        .UpOrDown(UpOrDown), 
        .Count(Count)
    );

//Generate clock with 10 ns clk period.
    initial Clk = 0;
    always #5 Clk = ~Clk;
    
    initial begin
        
        reset = 0;
        UpOrDown = 0;
        #300;
        UpOrDown = 1;
      #300;
        reset = 1;
        UpOrDown = 0;
        #100;
        reset = 0; 
    end
  
  initial begin
    $dumpfile("updown.vcd");
  $dumpvars;
  #100 $finish;
  end
      
endmodule
