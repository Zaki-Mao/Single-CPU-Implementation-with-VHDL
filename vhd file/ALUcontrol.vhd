----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:19:57 05/18/2021 
-- Design Name: 
-- Module Name:    ALUcontrol - Behavioral 
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

entity myaluc8 is
port(
	funct : in STD_LOGIC_VECTOR(5 downto 0); 
	aluop : in STD_LOGIC_VECTOR(2 downto 0); 
	output : out STD_LOGIC_VECTOR(2 downto 0)); 
end myaluc8;

architecture Behavioral of myaluc8 is

begin
process(aluop,funct)
	begin
		if aluop = "111" then
			if funct = "100000" then
				output <= "000";
			elsif funct = "100010" then
				output <= "001";
			elsif funct = "101010" then
				output <= "010";
			elsif funct = "100100" then
				output <= "100";
			elsif funct = "100101" then
				output <= "101";
			else
				NULL;
			end if;
		else
			output <= aluop;
		end if;	
	end process;
end Behavioral;
