----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:24:16 05/18/2021 
-- Design Name: 
-- Module Name:    jumpaddresscon - Behavioral 
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

entity myjac17 is
port(
	input : in STD_LOGIC_VECTOR(27 downto 0);
	pcinput : in STD_LOGIC_VECTOR(3 downto 0);
	output : out STD_LOGIC_VECTOR(31 downto 0)); 
end myjac17;

architecture Behavioral of myjac17 is

begin
	output(31 downto 28) <= pcinput;
	output(27 downto 0) <= input;

end Behavioral;

