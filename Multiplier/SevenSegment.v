module SevenSegment(
	input  [3:0] din,
	output [6:0] dout
);
	assign dout[0] = ((!din[3])&(!din[2])&(!din[1])&( din[0]))| // A
						  ((!din[3])&( din[2])&(!din[1])&(!din[0]))|
		 		 		  (( din[3])&( din[2])&(!din[1])&( din[0]))|
				 		  (( din[3])&(!din[2])&( din[1])&( din[0]));
	assign dout[1] = (( din[3])&( din[2])          &(!din[0]))| // B
						  ((!din[3])&( din[2])&(!din[1])&( din[0]))|
						  (( din[3])          &( din[1])&( din[0]))|
						  (          ( din[2])&( din[1])&(!din[0]));
	assign dout[2] = ((!din[3])&(!din[2])&( din[1])&(!din[0]))| // C
			 			  (( din[3])&( din[2])&( din[1])          )|
						  (( din[3])&( din[2])          &(!din[0]));
	assign dout[3] = ((!din[3])&( din[2])&(!din[1])&(!din[0]))| // D
						  (( din[3])&(!din[2])&( din[1])&(!din[0]))|
						  (          (!din[2])&(!din[1])&( din[0]))|
						  (          ( din[2])&( din[1])&( din[0]));
	assign dout[4] = ((!din[3])                    &( din[0]))| // E
						  ((!din[3])&( din[2])&(!din[1])          )|
						  (          (!din[2])&(!din[1])&( din[0]));
	assign dout[5] = (( din[3])&( din[2])&(!din[1])&( din[0]))| // F
						  ((!din[3])&(!din[2])          &( din[0]))|
						  ((!din[3])&(!din[2])&( din[1])          )|
						  ((!din[3])          &( din[1])&( din[0]));
	assign dout[6] = ((!din[3])&(!din[2])&(!din[1])          )| // G
						  (( din[3])&( din[2])&(!din[1])&(!din[0]))|
		 				  ((!din[3])&( din[2])&( din[1])&( din[0]));
endmodule
