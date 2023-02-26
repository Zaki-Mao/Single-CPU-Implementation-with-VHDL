----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:18:37 05/18/2021 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity myalu5 is
port(
	A : in STD_LOGIC_VECTOR(31 downto 0); 
	B : in STD_LOGIC_VECTOR(31 downto 0);
	C : in STD_LOGIC_VECTOR(2 downto 0);
	result : out STD_LOGIC_VECTOR(31 downto 0);
	zero : out STD_LOGIC);
end myalu5;

architecture Behavioral of myalu5 is
	
begin
	process(A,B,C)
	variable temp_result : STD_LOGIC_VECTOR(31 downto 0);
		begin
		if C = "000" then
			temp_result := A + B;
		elsif C = "001" then
			temp_result := A - B;
		elsif C = "010" then
			if A < B then
				temp_result := "00000000000000000000000000000001";
			else
				temp_result := "00000000000000000000000000000000";
			end if;
		elsif C = "100" then 
			temp_result := A AND B;
		elsif C = "101" then 
			temp_result := A OR B;	
		elsif C = "110" then 
			temp_result := to_STDLOGICVECTOR(to_bitvector(B) sla 16);
		else 
			NULL;
		end if;
		
		result <= temp_result;
		
		if temp_result = "00000000000000000000000000000000" then
			zero <= '1';
		else
			zero <= '0';
		end if;
	end process;
end Behavioral;
