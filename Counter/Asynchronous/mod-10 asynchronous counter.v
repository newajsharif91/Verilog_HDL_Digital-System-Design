module jk_ff(q,qbar,j,k,clear,clk);
input j,k,clear,clk;
output q,qbar;
wire a,b,c,d,e,f,cbar;
not (cbar,clk);
nand n1(a,qbar,j,clear,clk);
nand n2(b,clk,k,q);
nand n3(c,a,d);
nand n4(d,c,b,clear);
nand n5(e,c,cbar);
nand n6(f,d,cbar);
nand n7(q,e,qbar);
nand n8(qbar,q,f,clear);
endmodule

module mod_10_counter(q,clear,clk);
input clear,clk;
output [3:0]q;
wire w;
nand (w,q[1],q[3]);
jk_ff f1(q[0],,1,1,(w&clear),clk);
jk_ff f2(q[1],,1,1,(w&clear),q[0]);
jk_ff f3(q[2],,1,1,(w&clear),q[1]);
jk_ff f4(q[3],,1,1,(w&clear),q[2]);
endmodule





