
// COMP12111 - Exercise 3 Sequential Design
//
// Version 1. Feb 2019. P W Nutter
//
// This is the Verilog module for the pedestrian/cyclist crossing Controller
//
// The aim of this exercise is complete the finite state machine using the
// state transition diagram given in the laboratory notes. 
//
// DO NOT change the interface to this design or it may not be marked completely
// when submitted.
//
// Make sure you document your code and marks may be awarded/lost for the 
// quality of the comments given.
//
// Add your comments:
//
//
//

module trafficlight ( output reg [4:0] 	lightseq,	//the 5-bit light sequence
		      input             clock,		//clock that drives the fsm
		      input             reset,		//reset signal 
		      input             start);		//input from pedestrian


// declare internal variables here (how many bits required?)
reg [3:0] state, new_state;	// internal state variables


// implement your next state combinatorial logic block here

// get new state
always@ (*)
begin
	case(state)
		4'b0000:	if(start)	new_state = 4'b0001;	
					else		new_state = 4'b0000;

		4'b0001:	new_state = 4'b0010;	
		4'b0010:	new_state = 4'b0011;	
		4'b0011:	new_state = 4'b0100;	
		4'b0100:	new_state = 4'b0101;	

		4'b0101:	if(start)	new_state = 4'b1000;
					else		new_state = 4'b0110;
		4'b0110:	if(start)	new_state = 4'b1001;
					else		new_state = 4'b0111;
		4'b0111:	if(start)	new_state = 4'b1010;
					else		new_state = 4'b0000;

		4'b1000:	new_state = 4'b1001;	
		4'b1001:	new_state = 4'b1010;	
		4'b1010:	new_state = 4'b0001;		
	endcase
	if (reset) new_state = 4'b0000;
end

// implement your current state assignment, register, here


always@ (posedge clock)
	state <= new_state;	//save state

// implement your output logic here

// state to light
always@ (*)
	case(state)
		4'b0000:	lightseq = 5'b01001;	
		4'b0001:	lightseq = 5'b10010;	
		4'b0010:	lightseq = 5'b10100;	
		4'b0011:	lightseq = 5'b10100;	
		4'b0100:	lightseq = 5'b01100;	
		4'b0101:	lightseq = 5'b01110;	
		4'b0110:	lightseq = 5'b01001;	
		4'b0111:	lightseq = 5'b01001;	
		4'b1000:	lightseq = 5'b01001;	
		4'b1001:	lightseq = 5'b01001;	
		4'b1010:	lightseq = 5'b01001;		
	endcase



endmodule
