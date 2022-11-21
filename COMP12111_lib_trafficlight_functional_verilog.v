// Verilog HDL for "COMP12111", "trafficlight" "functional"
//
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

reg [3:0] state, next_statae;	// internal state variables


// implement your next state combinatorial logic block here

always@ (*)
	case(state)
		4b'0000:	if(start)	next_statae = 4b'0001;	//s0
					else		next_statae = 4b'0000;

		4b'0001:	next_statae = 4b'0002;		//s1
		4b'0010:	next_statae = 4b'0003;		//s2
		4b'0011:	next_statae = 4b'0004;		//s3
		4b'0100:	next_statae = 4b'0005;		//s4

		4b'0101:	if(start)	next_statae = 4b'1000;	//s5
					else		next_statae = 4b'0110;
		4b'0110:	if(start)	next_statae = 4b'1001;	//s6
					else		next_statae = 4b'0111;
		4b'0111:	if(start)	next_statae = 4b'1010;	//s7
					else		next_statae = 4b'1000;

		4b'1000:	next_statae = 4b'1001;		//s8
		4b'1001:	next_statae = 4b'1010;		//s9
		4b'1010:	next_statae = 4b'0001;		//s10

		

	endcase
end


// implement your current state assignment, register, here
always@ (posedge clock)
	state <= next_statae
end


// implement your output logic here

always@ (*)
	case(state)
		4b'0000:	lightseq = 5b'01001;		//s0
		4b'0001:	lightseq = 5b'10100;		//s1
		4b'0010:	lightseq = 5b'10100;		//s2
		4b'0011:	lightseq = 5b'10100;		//s3
		4b'0100:	lightseq = 5b'01001;		//s4
		4b'0101:	lightseq = 5b'01110;		//s5
		4b'0110:	lightseq = 5b'01001;		//s6
		4b'0111:	lightseq = 5b'01001;		//s7
		4b'1000:	lightseq = 5b'01001;		//s8
		4b'1001:	lightseq = 5b'01001;		//s9
		4b'1010:	lightseq = 5b'01001;		//s10
	endcase


endmodule
