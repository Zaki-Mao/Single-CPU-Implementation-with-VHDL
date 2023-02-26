----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:17:22 05/18/2021 
-- Design Name: 
-- Module Name:    Registerfile - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rf3 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           wa : in  STD_LOGIC_VECTOR (4 downto 0);
           rd1 : out  STD_LOGIC_VECTOR (31 downto 0);
           rd2 : out  STD_LOGIC_VECTOR (31 downto 0);
           wd : in  STD_LOGIC_VECTOR (31 downto 0);
           rw : in  STD_LOGIC);
end rf3;

--wa = address : in  STD_LOGIC_VECTOR (4 downto 0);
--rw = Regwrite : in  STD_LOGIC;
--wd = Data : in  STD_LOGIC_VECTOR (31 downto 0);
--ra2 = rs : in  STD_LOGIC_VECTOR (4 downto 0);
--ra1 = rt : in  STD_LOGIC_VECTOR (4 downto 0);
--clk = clk : in  STD_LOGIC;
--rd1 = Dataread1 : out  STD_LOGIC_VECTOR (31 downto 0);
--rd2 = Dataread2 : out  STD_LOGIC_VECTOR (31 downto 0));

architecture Behavioral of rf3 is
TYPE register_file is array (0 to 31) of STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL reg_file : register_file;
SIGNAL ra1 :  STD_LOGIC_VECTOR (4 downto 0);
SIGNAL ra2 :  STD_LOGIC_VECTOR (4 downto 0);
begin
ra1 <= instruction(25 downto 21);
ra2 <= instruction(20 downto 16);
PROCESS (clk, rw, wa, wd, reset)
begin
if(reset='0') then
	reg_file(0) <= conv_std_logic_vector(0,32);
	rd1 <= reg_file(conv_integer(ra2));
	rd2 <= reg_file(conv_integer(ra1));
   if (clk 'EVENT) AND (clk='1') and (rw = '1') and (wa /= 0) then
      reg_file(conv_integer(wa)) <= wd;
   end if;
end if;
end PROCESS;

end Behavioral;
