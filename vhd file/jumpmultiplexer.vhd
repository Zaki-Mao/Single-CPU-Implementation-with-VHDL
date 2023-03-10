----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:23:23 05/18/2021 
-- Design Name: 
-- Module Name:    jumpmultiplexer - Behavioral 
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

entity myjm15 is
port(
	A : in STD_LOGIC_VECTOR(31 downto 0);
	B : in STD_LOGIC_VECTOR(31 downto 0);
	C : in STD_LOGIC; 
	output : out STD_LOGIC_VECTOR(31 downto 0)); 
end myjm15;

architecture Behavioral of myjm15 is

begin
	with C select
	output <= A when '1',
				 B when '0';
end Behavioral;
