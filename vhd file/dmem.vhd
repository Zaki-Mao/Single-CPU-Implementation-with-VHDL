----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:25:21 05/18/2021 
-- Design Name: 
-- Module Name:    dmem - Behavioral 
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
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity dmem is
port (
	clk: in std_logic;
	reset: in std_logic;
	daddr: in std_logic_vector(31 downto 0);
	ddatain: in std_logic_vector(31 downto 0);
	ddataout: out std_logic_vector(31 downto 0);
	oe: in std_logic;
	we: in std_logic );
end dmem;

architecture dmem_arch of dmem is

	constant mbegin: natural := 0;				
	constant mend: natural := 16384-1;			
	subtype word is std_logic_vector(31 downto 0);
	type memory is array (natural range mbegin to mend) of word;

begin

	process (clk, reset, daddr, ddatain, oe, we)
	
	variable mem: memory;
	variable da: natural;

	begin
	

				if ((daddr > (mend+1)*4-4 or daddr < mbegin*4)
				and (oe = '1' or we = '1')) then
					
					assert false severity failure;
				end if;
				if (daddr(1 downto 0) /= "00"
				and (oe = '1' or we = '1')) then
					
					assert false severity failure;
				end if;
			
				da := conv_integer(unsigned(daddr(31 downto 2)));
				
			   if (clk'event and clk = '1') then
	         if (we = '1') then
		          mem(da) := ddatain;
	         end if;
				end if;


			
			
			if (oe = '1') then
				ddataout <= mem(da);
			else
				ddataout <= (others => 'Z');
			end if;

	end process;

end dmem_arch;
