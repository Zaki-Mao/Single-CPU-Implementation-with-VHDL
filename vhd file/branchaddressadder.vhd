----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:22:28 05/18/2021 
-- Design Name: 
-- Module Name:    branchaddressadder - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mybaa13 is
port(
	up_input : in STD_LOGIC_VECTOR(31 downto 0);
	down_input : in STD_LOGIC_VECTOR(31 downto 0);
	output : out STD_LOGIC_VECTOR(31 downto 0)); 
end mybaa13;

architecture Behavioral of mybaa13 is

begin
	output <= up_input + down_input;

end Behavioral;
