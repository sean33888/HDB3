/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03-SP5
// Date      : Mon Apr 21 15:17:26 2025
/////////////////////////////////////////////////////////////


module encoder ( data, reset, clk, P, N );
  input data, reset, clk;
  output P, N;
  wire   pre, par, N22, N23, N24, N25, N26, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28;
  wire   [2:0] arr;

  DFQD1 arr_reg_0_ ( .D(N24), .CP(clk), .Q(arr[0]) );
  DFQD1 arr_reg_1_ ( .D(N25), .CP(clk), .Q(arr[1]) );
  DFQD1 arr_reg_2_ ( .D(N26), .CP(clk), .Q(arr[2]) );
  DFQD1 par_reg ( .D(n13), .CP(clk), .Q(par) );
  DFQD1 pre_reg ( .D(n12), .CP(clk), .Q(pre) );
  DFQD1 N_reg ( .D(N23), .CP(clk), .Q(N) );
  DFQD1 P_reg ( .D(N22), .CP(clk), .Q(P) );
  NR2D0 U21 ( .A1(reset), .A2(n27), .ZN(N22) );
  AOI22D0 U22 ( .A1(n23), .A2(n25), .B1(data), .B2(n28), .ZN(n27) );
  INVD0 U23 ( .I(pre), .ZN(n28) );
  ND2D0 U24 ( .A1(n20), .A2(n22), .ZN(N25) );
  INVD0 U25 ( .I(arr[0]), .ZN(n22) );
  OAI31D0 U28 ( .A1(reset), .A2(n14), .A3(par), .B(n15), .ZN(n13) );
  CKND2D0 U29 ( .A1(n14), .A2(par), .ZN(n15) );
  CKND2D0 U30 ( .A1(n14), .A2(pre), .ZN(n18) );
  INVD0 U31 ( .I(N24), .ZN(n14) );
  ND2D0 U32 ( .A1(n20), .A2(n16), .ZN(N24) );
  NR2D0 U33 ( .A1(reset), .A2(n19), .ZN(n17) );
  INVD1 U34 ( .I(data), .ZN(n16) );
  NR2D0 U35 ( .A1(reset), .A2(n24), .ZN(N23) );
  NR2D0 U36 ( .A1(n25), .A2(n26), .ZN(n19) );
  OAI211D0 U37 ( .A1(pre), .A2(n16), .B(n17), .C(n18), .ZN(n12) );
  AOI21D0 U38 ( .A1(pre), .A2(data), .B(n19), .ZN(n24) );
  CKXOR2D0 U39 ( .A1(par), .A2(pre), .Z(n25) );
  NR4D0 U41 ( .A1(data), .A2(arr[2]), .A3(arr[1]), .A4(arr[0]), .ZN(n23) );
  INVD0 U42 ( .I(n23), .ZN(n26) );
  IND2D0 U26 ( .A1(arr[1]), .B1(n20), .ZN(N26) );
  NR2D0 U27 ( .A1(reset), .A2(n23), .ZN(n20) );
endmodule

