----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:14:46 05/18/2021 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity mypc1 is
port(
	clk : in STD_LOGIC;
	reset : in STD_LOGIC;
	in_pc : in STD_LOGIC_VECTOR(31 downto 0);
	out_pc : out STD_LOGIC_VECTOR(31 downto 0));
end mypc1;

architecture Behavioral of mypc1 is
begin
	process(clk,reset)
	begin
		if reset = '1' then
			out_pc <= "00000000000000000100000000000000";
		elsif rising_edge(clk) then
			out_pc <= in_pc;
		end if;
	end process;
end Behavioral;
