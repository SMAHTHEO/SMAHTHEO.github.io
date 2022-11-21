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
	#20
	clock = ~clock;
	end


// -----------------------------------------------------

initial 
begin

// Set input signals here, using delays where appropriate
// -----------------------------------------------------
reset = 0; clock = 0; start = 0;
#405 reset = 1;
#40 reset = 0;

// first times
#160 start = 1;
#40 start = 0;
#400 reset = 1;
#40 reset = 0;


// 2st times
#160 start = 1;
#40 start = 0;
#160 start = 1;
#40 start = 0;
#400 reset = 1;
#40 reset = 0;

// 3st times
#160 start = 1;
#40 start = 0;
#200 start = 1;
#40 start = 0;
#400 reset = 1;
#40 reset = 0;

// 4st times
#160 start = 1;
#40 start = 0;
#240 start = 1;
#40 start = 0;
#400 reset = 1;
#40 reset = 0;

// 5st times
#160 start = 1;
#40 start = 0;
#120 reset = 1;
#40 reset = 0;
#400

$stop;
end
