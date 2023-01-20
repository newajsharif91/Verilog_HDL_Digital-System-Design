module jk_ff(q,qbar,j,k,clear,clk);
input j,k,clear,clk;
output q,qbar;
wire a,b,y,ybar,e,d;
not(cbar, clk);
nand n1(a,qbar,j,clear,clk);
nand n2(b,q,k,clk);
nand n3(y,a,ybar);
nand n4(ybar,clear,b,y);
nand n5(e,cbar,y);
nand n6(d,cbar,ybar);
nand n7(q,e,qbar);
nand n8(qbar,q,d,clear);
endmodule


module ripple_counter(q,qbar,clear,clk);
input clear,clk;
output [3:0] q,qbar;
jk_ff f1(q[0],qbar[0],1,1,clear,clk);
jk_ff f2(q[1],qbar[1],1,1,clear,q[0]);
jk_ff f3(q[2],qbar[2],1,1,clear,q[1]);
jk_ff f4(q[3],qbar[3],1,1,clear,q[2]);
endmodule
