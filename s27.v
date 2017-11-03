`include "erxuanyi.v"
module dff(CK,Q,D);
	input CK,D;
	output Q;

	wire NM,NCK;
	trireg NQ,M;

	nmos N7(M,D,NCK);
	not P3(NM,M);
	nmos N9(NQ,NM,CK);
	not P5(Q,NQ);
	not P1(NCK,CK);
endmodule

module s27(CK,G0,G1,G17,G2,G3,SI,SE,G7);
input CK,G0,G1,G2,G3,SI,SE;
output G17,G7;
	wire G5,G10,G10_NEW,G6,G11,G11_NEW,G7,G13,G13_NEW,G14,G8,G15,G12,G16,G9;

	erxuanyi cpr0(G10_NEW,SI,G10,SE);
	erxuanyi cpr1(G11_NEW,G5,G11,SE);
	erxuanyi cpr2(G13_NEW,G6,G13,SE);

	dff DFF_0(CK,G5,G10_NEW);
	dff DFF_1(CK,G6,G11_NEW);
	dff DFF_2(CK,G7,G13_NEW);


	not NOT_0(G14,G0);
	not NOT_1(G17,G11);
	and AND2_0(G8,G14,G6);
	or OR2_0(G15,G12,G8);
	or OR2_1(G16,G3,G8);
	nand NAND2_0(G9,G16,G15);//(out,in,in)
	nor NOR2_0(G10,G14,G11);
	nor NOR2_1(G11,G5,G9);
	nor NOR2_2(G12,G1,G7);
	nor NOR2_3(G13,G2,G12);
endmodule