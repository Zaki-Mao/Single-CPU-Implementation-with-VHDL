----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:15:55 05/18/2021 
-- Design Name: 
-- Module Name:    Registerdm - Behavioral 
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

entity myrdm2 is
port(
	A : in STD_LOGIC_VECTOR(4 downto 0);
	B : in STD_LOGIC_VECTOR(4 downto 0);
	C : in STD_LOGIC; 
	output : out STD_LOGIC_VECTOR(4 downto 0)); 
end myrdm2;

architecture Behavioral of myrdm2 is

begin
with C select
	output <= A when '0',
				 B when '1';

end Behavioral;
