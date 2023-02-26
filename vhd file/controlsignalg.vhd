----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:20:28 05/18/2021 
-- Design Name: 
-- Module Name:    controlsignalg - Behavioral 
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

entity mycsg9 is
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
end mycsg9;

architecture Behavioral of mycsg9 is 

begin
	process(op)
		begin
		if op = "000000" then 
			regdst <= '1';
			alusrc <= '0';
			memtoreg <= '0';
			regwrite <= '1';
			memread <= '0';
			memwrite <= '0';
			branch <= '0';
			jump <= '0';
			aluop <= "111";
		elsif op = "001000" then
			regdst <= '0';
			alusrc <= '1';
			memtoreg <= '0';
			regwrite <= '1';
			memwrite <= '0';
			branch <= '0';
			jump <= '0';
			aluop <= "000";
		elsif op = "100011" then
			regdst <= '0';
			alusrc <= '1';
			memtoreg <= '1';
			regwrite <= '1';
			memread <= '1';
			memwrite <= '0';
			branch <= '0';
			jump <= '0';
			aluop <= "000";
		elsif op = "101011" then 
			regdst <= 'U';
			alusrc <= '1';
			memtoreg <= 'U';
			regwrite <= '0';
			memread <= '0';
			memwrite <= '1';
			branch <= '0';
			jump <= '0';
			aluop <= "000";
		elsif op = "000100" then 
			regdst <= 'U';
			alusrc <= '0';
			memtoreg <= 'U';
			regwrite <= '0';
			memread <= '0';
			memwrite <= '0';
			branch <= '1';
			jump <= '0';
			aluop <= "001";
		elsif op = "000010" then
			regdst <= '0';
			alusrc <= '0';
			memtoreg <= '0';
			regwrite <= '0';
			memread <= '0';
			memwrite <= '0';
			branch <= '0';
			jump <= '1';
			aluop <= "000";
		elsif op = "001111" then 
			regdst <= '0';
			alusrc <= '1';
			memtoreg <= '0';
			regwrite <= '1';
			memread <= 'U';
			memwrite <= '0';
			branch <= '0';
			jump <= '0';
			aluop <= "110";
		elsif op = "001010" then 
			regdst <= '0';
			alusrc <= '1';
			memtoreg <= '0';
			regwrite <= '1';
			memread <= 'U';
			memwrite <= '0';
			branch <= '0';
			jump <= '0';
			aluop <= "010";
		else
			NULL;
		end if;
	end process;	
end Behavioral;
