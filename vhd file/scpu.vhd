----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:14:04 05/18/2021 
-- Design Name: 
-- Module Name:    scpu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity scpu is
port(
	clk : in STD_LOGIC;
	reset : in STD_LOGIC;
	idata : in STD_LOGIC_VECTOR(31 downto 0);
	ddataout : in STD_LOGIC_VECTOR(31 downto 0);
	iaddr : out STD_LOGIC_VECTOR(31 downto 0);
	ddatain : out STD_LOGIC_VECTOR(31 downto 0);
	daddr : out STD_LOGIC_VECTOR(31 downto 0);
	we : out STD_LOGIC;
	oe : out STD_LOGIC;
	regview_t1 : out STD_LOGIC_VECTOR(31 downto 0));
end scpu;

architecture Behavioral of scpu is

component mypc1
port(
	clk : in STD_LOGIC;
	reset : in STD_LOGIC;
	in_pc : in STD_LOGIC_VECTOR(31 downto 0);
	out_pc : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component myrdm2
port(
	A : in STD_LOGIC_VECTOR(4 downto 0);
	B : in STD_LOGIC_VECTOR(4 downto 0);
	C : in STD_LOGIC; 
	output : out STD_LOGIC_VECTOR(4 downto 0)); 
end component;

component myrf3
Port( 
	clk : in  STD_LOGIC;
   reset : in  STD_LOGIC;
   instruction : in  STD_LOGIC_VECTOR (31 downto 0);
   wa : in  STD_LOGIC_VECTOR (4 downto 0);
   rd1 : out  STD_LOGIC_VECTOR (31 downto 0);
   rd2 : out  STD_LOGIC_VECTOR (31 downto 0);
   wd : in  STD_LOGIC_VECTOR (31 downto 0);
   rw : in  STD_LOGIC;
	regview_t1 : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component myalum4
port(
	A : in STD_LOGIC_VECTOR(31 downto 0);
	B : in STD_LOGIC_VECTOR(31 downto 0);
	C : in STD_LOGIC; 
	output : out STD_LOGIC_VECTOR(31 downto 0)); 
end component;

component myalu5
port(
	A : in STD_LOGIC_VECTOR(31 downto 0); 
	B : in STD_LOGIC_VECTOR(31 downto 0); 
	C : in STD_LOGIC_VECTOR(2 downto 0); 
	result : out STD_LOGIC_VECTOR(31 downto 0);
	zero : out STD_LOGIC);
end component;

component mywdm6
port(
	A : in STD_LOGIC_VECTOR(31 downto 0);
	B : in STD_LOGIC_VECTOR(31 downto 0);
	C : in STD_LOGIC;
	output : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component myse7
port(
	input : in STD_LOGIC_VECTOR(31 downto 0);
	output : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component myaluc8
port(
	funct : in STD_LOGIC_VECTOR(5 downto 0); 
	aluop : in STD_LOGIC_VECTOR(2 downto 0); 
	output : out STD_LOGIC_VECTOR(2 downto 0)); 
end component;

component mycsg9
port(
	op : in STD_LOGIC_VECTOR(5 downto 0);
	regdst : out STD_LOGIC;
	alusrc : out STD_LOGIC;
	memtoreg : out STD_LOGIC;
	regwrite : out STD_LOGIC;
	memread : out STD_LOGIC;
	memwrite : out STD_LOGIC;
	branch : out STD_LOGIC;
	jump : out STD_LOGIC;
	aluop : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component mypcaf10
port(
	input : in STD_LOGIC_VECTOR(31 downto 0);
	output : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component mysil11
port(
	input : in STD_LOGIC_VECTOR(31 downto 0);
	output : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component mycb12
port(
	A : in STD_LOGIC;
	B : in STD_LOGIC;
	output : out STD_LOGIC); 
end component;

component mybaa13
port(
	up_input : in STD_LOGIC_VECTOR(31 downto 0);
	down_input : in STD_LOGIC_VECTOR(31 downto 0);
	output : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component mybm14
port(
	A : in STD_LOGIC_VECTOR(31 downto 0);
	B : in STD_LOGIC_VECTOR(31 downto 0);
	C : in STD_LOGIC; 
	output : out STD_LOGIC_VECTOR(31 downto 0)); 
end component;

component myjm15
port(
	A : in STD_LOGIC_VECTOR(31 downto 0);
	B : in STD_LOGIC_VECTOR(31 downto 0);
	C : in STD_LOGIC; 
	output : out STD_LOGIC_VECTOR(31 downto 0)); 
end component;

component myjas16
port(
	input : in STD_LOGIC_VECTOR(27 downto 0);
	output : out STD_LOGIC_VECTOR(27 downto 0)); 
end component;

component myjac17
port(
	input : in STD_LOGIC_VECTOR(27 downto 0);
	pcinput : in STD_LOGIC_VECTOR(3 downto 0);
	output : out STD_LOGIC_VECTOR(31 downto 0)); 
end component;


signal jm_to_pc : STD_LOGIC_VECTOR(31 downto 0);
signal pc_to_pcaf : STD_LOGIC_VECTOR(31 downto 0);


signal idata_to_rdm_a : STD_LOGIC_VECTOR(4 downto 0); 
signal idata_to_rdm_b : STD_LOGIC_VECTOR(4 downto 0);
signal csg_to_rdm : STD_LOGIC; --regdst
signal rdm_to_rf : STD_LOGIC_VECTOR(4 downto 0);


signal wdm_to_rf : STD_LOGIC_VECTOR(31 downto 0);
signal csg_to_rf : STD_LOGIC; --regwrite
signal read_data1_to_alu_a : STD_LOGIC_VECTOR(31 downto 0);
signal read_data2_to_alum : STD_LOGIC_VECTOR(31 downto 0);


signal se_to_alum : STD_LOGIC_VECTOR(31 downto 0);
signal csg_to_alum : STD_LOGIC; --alusrc
signal alum_to_alu_b : STD_LOGIC_VECTOR(31 downto 0);


signal aluc_to_alu_c : STD_LOGIC_VECTOR(2 downto 0);
signal alu_zero_to_cb : STD_LOGIC;
signal alu_result_to_wdm_b : STD_LOGIC_VECTOR(31 downto 0);

signal ddataout_to_wdm_a : STD_LOGIC_VECTOR(31 downto 0);


signal csg_to_wdm_c : STD_LOGIC; 


signal idata_to_se : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');


signal idata_to_aluc : STD_LOGIC_VECTOR(5 downto 0);
signal csg_to_aluc : STD_LOGIC_VECTOR(2 downto 0);


signal idata_to_csg : STD_LOGIC_VECTOR(5 downto 0);


signal csg_to_oe : STD_LOGIC;
signal csg_to_we : STD_LOGIC;
signal csg_to_cb : STD_LOGIC;
signal csg_to_jm : STD_LOGIC;


signal pcaf_to_baa : STD_LOGIC_VECTOR(31 downto 0);


signal sil_to_baa : STD_LOGIC_VECTOR(31 downto 0);


signal cb_to_bm : STD_LOGIC;


signal baa_to_bm : STD_LOGIC_VECTOR(31 downto 0);


signal bm_to_jm : STD_LOGIC_VECTOR(31 downto 0);


signal jac_to_jm : STD_LOGIC_VECTOR(31 downto 0);


signal idata_to_jas : STD_LOGIC_VECTOR(27 downto 0) := (others => '0');
signal jas_to_jac : STD_LOGIC_VECTOR(27 downto 0);


signal pcaf_to_jac : STD_LOGIC_VECTOR(3 downto 0);



begin

idata_to_se(15 downto 0) <= idata(15 downto 0);
idata_to_jas(25 downto 0) <= idata(25 downto 0); 
pcaf_to_jac(3 downto 0) <= pcaf_to_baa(31 downto 28);
idata_to_csg(5 downto 0) <= idata(31 downto 26);
idata_to_aluc(5 downto 0) <= idata(5 downto 0);
ddataout_to_wdm_a(31 downto 0) <= ddataout;
idata_to_rdm_a(4 downto 0) <= idata(20 downto 16);
idata_to_rdm_b(4 downto 0) <= idata(15 downto 11);

program_counter: mypc1 PORT MAP (clk, reset, jm_to_pc, pc_to_pcaf);
register_destination_multiplexer: myrdm2 PORT MAP (idata_to_rdm_a, idata_to_rdm_b, csg_to_rdm, rdm_to_rf);
register_file: myrf3 PORT MAP (clk, reset, idata, rdm_to_rf, read_data1_to_alu_a, read_data2_to_alum, wdm_to_rf, csg_to_rf, regview_t1);
ALU_multiplexer: myalum4 PORT MAP (read_data2_to_alum, se_to_alum, csg_to_alum, alum_to_alu_b);
ALU: myalu5 PORT MAP (read_data1_to_alu_a, alum_to_alu_b, aluc_to_alu_c, alu_result_to_wdm_b, alu_zero_to_cb);
data_multiplexer: mywdm6 PORT MAP (ddataout_to_wdm_a, alu_result_to_wdm_b, csg_to_wdm_c, wdm_to_rf);
sign_extenf: myse7 PORT MAP (idata_to_se, se_to_alum);
ALU_control: myaluc8 PORT MAP (idata_to_aluc, csg_to_aluc, aluc_to_alu_c);
control_signal_generation: mycsg9 PORT MAP (idata_to_csg, csg_to_rdm, csg_to_alum, csg_to_wdm_c, csg_to_rf, csg_to_oe, csg_to_we, csg_to_cb, csg_to_jm, csg_to_aluc);
PC_add_four: mypcaf10 PORT MAP (pc_to_pcaf, pcaf_to_baa);
shift_immediate_left: mysil11 PORT MAP (se_to_alum, sil_to_baa);
check_branch: mycb12 PORT MAP (csg_to_cb, alu_zero_to_cb, cb_to_bm);
branch_address_adder: mybaa13 PORT MAP (pcaf_to_baa, sil_to_baa, baa_to_bm);
--branch_address_adder: mybm14 PORT MAP (pcaf_to_baa, baa_to_bm, cb_to_bm, bm_to_jm);
jump_multiplexer : myjm15 PORT MAP (jac_to_jm, bm_to_jm, csg_to_jm, jm_to_pc);
jump_address_shift : myjas16 PORT MAP (idata_to_jas, jas_to_jac);
jump_address_concatenation : myjac17 PORT MAP (jas_to_jac, pcaf_to_jac, jac_to_jm);


iaddr <= pc_to_pcaf;
daddr <= alu_result_to_wdm_b;
ddatain <= read_data2_to_alum;
oe <= csg_to_oe;
we <= csg_to_we;

end Behavioral;
