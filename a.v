// Verilog stimulus file.
// Please do not create a module in this file.
//
// Testing of a sequential design requires you to implement
// a clock - see the advice in Blackboard on how to do this
//

/*

#VALUE      creates a delay of VALUE ns
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/

// Implement your clock here
// -----------------------------------------------------

initial clock = 0;
always
	begin
	#50
	clock = ~clock;
	end


// -----------------------------------------------------

initial 
begin

// Set input signals here, using delays where appropriate
// -----------------------------------------------------
reset = 0;
clock = 0;
start = 0;
#1010
reset = 1;
#100
reset = 0;
#100

// 0,1,2,3,4,5,6,7,0 states
start = 1;
#100
start = 0;
#800

reset = 1;
#100
reset = 0;
#100

// 0,1,2,3,4,5,8,9,10,1,2,3,4,5,6,7,0 statas
start = 1;
#100
start = 0;
#400
start = 1;
#100
start = 0;
#1000

reset = 1;
#100
reset = 0;
#100

// 0,1,2,3,4,5,6,9,10,1,2,3,4,5,6,7,0 statas
start = 1;
#100
start = 0;
#500
start = 1;
#100
start = 0;
#900

reset = 1;
#100
reset = 0;
#100

// 0,1,2,3,4,5,6,7,10,1,2,3,4,5,6,7,0 statas
start = 1;
#100
start = 0;
#600
start = 1;
#100
start = 0;
#800

//text reset
start = 1;
#100
start = 0;
#300


reset = 1;
#100
reset = 0;
#500

$stop;
end
