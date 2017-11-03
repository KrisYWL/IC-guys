`timescale 1ns/1ns
`include "s27.v"
`include "erxuanyi.v"

module s27_tb;
	reg G0,G1,G2,G3,SI,SE,CK=0;
	wire G17,G7;
	always #50 CK=~CK;
	initial
	begin
	CK=0;
	G0=0;G1=0;G2=0;G3=0;
	SE=0;
	#10;
	SE=0;		
	#100;		//110ns
	SI=1;
	#100;		//210ns
	SI=0;
	#100;		//310ns
	SI=1;

	#100;		//410ns
	G0=1;G1=0;G2=1;G3=0;
	SE=1;

	#100;		//510ns
	SE=0;
	#100;		//610ns
	SI=0;
	#100;		//710ns
	SI=1;
	#100;		//810ns
	SI=0;
	
	#500;		//910ns
	$stop;
	end
	s27 shili(CK,G0,G1,G17,G2,G3,SI,SE,G7);
endmodule

