module erxuanyi(out,a,b,sel);
  input a,b,sel;
  output out;
  reg out;
  always @(sel or a or b)begin
      if(!sel)
        out=a;
      else
        out=b;
  end
endmodule

